In order to use this wrapper you first have to build Freetype, Harfbuzz and Fribidi.

## Prerequisites

- [Meson](https://mesonbuild.com/Getting-meson.html) and [Ninja](https://ninja-build.org/)
- [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/) (on Windows: `scoop install pkg-config`)
- A C/C++ toolchain:
  - **Windows:** Visual Studio 2022 with the "Desktop development with C++" workload. Run the commands below from a *x64 Native Tools Command Prompt for VS* (or any shell in which `vcvarsall.bat x64` has been sourced), otherwise Meson may pick up the GNU `link.exe` from Git Bash instead of MSVC's.
  - **Linux/macOS:** the system default C/C++ compiler.

## Linking strategy

Freetype (FTL license) and Harfbuzz (MIT) are built as **static** libraries and linked directly into dependents. Fribidi (LGPL 2.1+) is built as a **shared** library and shipped as a DLL with an import lib, so the dynamic-linking exception in the LGPL applies and no further obligations are triggered.

Harfbuzz is configured with `-Dfreetype=enabled`, which makes its Meson build fetch Freetype as a subproject via the wrap file at `harfbuzz/subprojects/freetype2.wrap`. As a side effect we get a standalone `libfreetype.a` in the Harfbuzz build tree, separate from `libharfbuzz.a` — that is the file we ship as `freetype.lib`.

## Build

1. Pull the submodules:
   ```
   git submodule update --init
   ```

2. Build Harfbuzz (produces `libharfbuzz.a`, `libfreetype.a`, `libpng16.a`, `libz.a`):
   ```
   cd harfbuzz
   meson setup build ^
     --buildtype=release ^
     --default-library=static ^
     -Db_vscrt=md ^
     --wrap-mode=default ^
     -Dfreetype=enabled ^
     -Dglib=disabled ^
     -Dgobject=disabled ^
     -Dcairo=disabled ^
     -Dchafa=disabled ^
     -Dicu=disabled ^
     -Dtests=disabled ^
     -Ddocs=disabled
   meson compile -C build
   cd ..
   ```

3. Build Fribidi (produces `fribidi-0.dll` and `fribidi.lib`):
   ```
   cd fribidi
   meson setup build ^
     --buildtype=release ^
     --default-library=shared ^
     -Db_vscrt=md ^
     -Ddeprecated=false ^
     -Dtests=false ^
     -Ddocs=false
   meson compile -C build
   cd ..
   ```

4. Copy the outputs to `dist/win64/`, renaming the `.a` files to `.lib` (they are already MSVC-compatible AR archives):

   | Source                                                 | Destination              |
   |--------------------------------------------------------|--------------------------|
   | `harfbuzz/build/src/libharfbuzz.a`                     | `dist/win64/harfbuzz.lib` |
   | `harfbuzz/build/subprojects/freetype/libfreetype.a`    | `dist/win64/freetype.lib` |
   | `harfbuzz/build/subprojects/libpng-*/libpng16.a`       | `dist/win64/png16.lib`   |
   | `harfbuzz/build/subprojects/zlib-*/libz.a`             | `dist/win64/z.lib`       |
   | `fribidi/build/lib/fribidi.lib`                        | `dist/win64/fribidi.lib` |
   | `fribidi/build/lib/fribidi-0.dll`                      | `dist/win64/fribidi-0.dll` |

The `BeefProj.toml` in this directory already lists all five `.lib` files under `LibPaths` and copies `fribidi-0.dll` alongside dependents via `PostBuildCmds`.
