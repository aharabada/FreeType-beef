In order to use this wrapper you first have to build freetype and harfbuzz.
For that you need [meson](https://mesonbuild.com/Getting-meson.html).

1. Clone harfbuzz (`git submodule update --init`)
2. Build harfbuzz
   1. `cd harfbuzz`
   2. Prepare build: `meson build --wrap-mode=default -Dfreetype=enabled -Dglib=disabled -Dgobject=disabled -Dcairo=disabled -Dchafa=disabled -Dicu=disabled`
   3. Compile: `meson compile -C build`
3. Copy .lib and .dll files from meson/build into deps-directory
