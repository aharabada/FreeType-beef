using System;

namespace FreeType
{
	/// FT_ENCODING_XXX
	[AllowDuplicates]
	public enum Encoding : FT_UInt32
	{
		FT_ENCODING_NONE = 0,

		/// FT_ENCODING_MS_SYMBOL
		MsSymbol = ((.)'s' << 24) | ((.)'y' << 16) | ((.)'m' << 8 ) | (.)'b',
		/// FT_ENCODING_UNICODE
		Unicode = ((.)'u' << 24) | ((.)'n' << 16) | ((.)'i' << 8 ) | (.)'c',
		/// FT_ENCODING_SJIS
		Sjis = ((.)'s' << 24) | ((.)'j' << 16) | ((.)'i' << 8 ) | (.)'s', //   's', 'j', 'i', 's'
		/// FT_ENCODING_PRC
		Prc = ((.)'g' << 24) | ((.)'b' << 16) | ((.)' ' << 8 ) | (.)' ', //     'g', 'b', ' ', ' '
		/// FT_ENCODING_BIG5
		Big5 = ((.)'b' << 24) | ((.)'i' << 16) | ((.)'g' << 8 ) | (.)'5', //    'b', 'i', 'g', '5'
		/// FT_ENCODING_WANSUNG
		Wansung = ((.)'w' << 24) | ((.)'a' << 16) | ((.)'n' << 8 ) | (.)'s', // 'w', 'a', 'n', 's'
		/// FT_ENCODING_JOHAB
		Johab = ((.)'j' << 24) | ((.)'o' << 16) | ((.)'h' << 8 ) | (.)'a', //   'j', 'o', 'h', 'a'

		/* for backward compatibility */
		/// FT_ENCODING_GB2312
		Gb2312    = Prc,
		/// FT_ENCODING_MS_SJIS
		MsSjis    = Sjis,
		/// FT_ENCODING_MS_GB2312
		MsGb2312  = Prc,
		/// FT_ENCODING_MS_BIG5
		MsBig5    = Big5,
		/// FT_ENCODING_MS_WANSUNG
		MsWansung = Wansung,
		/// FT_ENCODING_MS_JOHAB
		MsJohab   = Johab,
		/// FT_ENCODING_ADOBE_STANDARD
		AdobeStandard = ((.)'A' << 24) | ((.)'D' << 16) | ((.)'O' << 8 ) | (.)'B', //    'A', 'D', 'O', 'B' ),
		/// FT_ENCODING_ADOBE_EXPERT
		AdobeExpert = ((.)'A' << 24) | ((.)'D' << 16) | ((.)'B' << 8 ) | (.)'E', //      'A', 'D', 'B', 'E' ),
		/// FT_ENCODING_ADOBE_CUSTOM
		AdobeCustom = ((.)'A' << 24) | ((.)'D' << 16) | ((.)'B' << 8 ) | (.)'C', //      'A', 'D', 'B', 'C' ),
		/// FT_ENCODING_ADOBE_LATIN_1
		AdobeLatin_1 = ((.)'l' << 24) | ((.)'a' << 16) | ((.)'t' << 8 ) | (.)'1', //     'l', 'a', 't', '1' ),
		/// FT_ENCODING_OLD_LATIN_2
		OldLatin_2 = ((.)'l' << 24) | ((.)'a' << 16) | ((.)'t' << 8 ) | (.)'2', //    'l', 'a', 't', '2' ),
		/// FT_ENCODING_APPLE_ROMAN
		AppleRoman = ((.)'a' << 24) | ((.)'r' << 16) | ((.)'m' << 8 ) | (.)'n', //    'a', 'r', 'm', 'n' )
	}

	/// FT_SIZE_REQUEST_X
	public enum SizeRequestType : uint32
	{
		/// FT_SIZE_REQUEST_TYPE_NOMINAL
		Nominal,
		/// FT_SIZE_REQUEST_TYPE_REAL_DIM
		RealDim,
		/// FT_SIZE_REQUEST_TYPE_BBOX
		Bbox,
		/// FT_SIZE_REQUEST_TYPE_CELL
		Cell,
		/// FT_SIZE_REQUEST_TYPE_SCALES
		Scales,

		/// FT_SIZE_REQUEST_TYPE_MAX
		Max
	}

	/// FT_RENDER_MODE_XXX
	public enum RenderMode : uint32
	{
	  	/// FT_RENDER_MODE_NORMAL
		Normal = 0,
		/// FT_RENDER_MODE_LIGHT
		Light,
		/// FT_RENDER_MODE_MONO
		Mono,
		/// FT_RENDER_MODE_LCD
		Lcd,
		/// FT_RENDER_MODE_LCD_V
		LcdV,

		/// FT_RENDER_MODE_MAX
		Max
	}

	/// FT_KERNING_XXX
	public enum FT_Kerning_Mode : uint32
	{
		/// FT_KERNING_DEFAULT
		Default = 0,
		/// FT_KERNING_UNFITTED
		Unfitted,
		/// FT_KERNING_UNSCALED
		Unscaled
	}

	/// FT_PIXEL_MODE_XXX
	public enum PixelMode : char8
	{
		
		/// FT_PIXEL_MODE_NONE
		None = 0,
		/// FT_PIXEL_MODE_MONO
		Mono,
		/// FT_PIXEL_MODE_GRAY
		Gray,
		/// FT_PIXEL_MODE_GRAY2
		Gray2,
		/// FT_PIXEL_MODE_GRAY4
		Gray4,
		/// FT_PIXEL_MODE_LCD
		Lcd,
		/// FT_PIXEL_MODE_LCD_V
		LcdV,
		/// FT_PIXEL_MODE_BGRA
		Bgra,

		/// FT_PIXEL_MODE_MAX
		Max
	}

	/// FT_GLYPH_FORMAT_NONE
	public enum GlyphFormat : uint32
	{
		/// FT_GLYPH_FORMAT_NONE
		None = 0,
		/// FT_GLYPH_FORMAT_COMPOSITE
		Composite = ((.)'c' << 24) | ((.)'o' << 16) | ((.)'m' << 8) | (.)'p',//'c', 'o', 'm', 'p',
		/// FT_GLYPH_FORMAT_BITMAP
		Bitmap    = ((.)'b' << 24) | ((.)'i' << 16) | ((.)'t' << 8) | (.)'s',   //'b', 'i', 't', 's',
		/// FT_GLYPH_FORMAT_OUTLINE
		Outline   = ((.)'o' << 24) | ((.)'u' << 16) | ((.)'t' << 8) | (.)'l',  //'o', 'u', 't', 'l',
		/// FT_GLYPH_FORMAT_PLOTTER
		Plotter   = ((.)'p' << 24) | ((.)'l' << 16) | ((.)'o' << 8) | (.)'t'  //'p', 'l', 'o', 't'
	}
}
