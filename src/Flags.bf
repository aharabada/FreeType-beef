using System;
namespace FreeType
{
	/// FT_FACE_FLAG_XXX
	public enum FaceFlag : FT_Long
	{
		/// No flags specified.
		None			= 0,
		/// FT_FACE_FLAG_SCALABLE
		Scalable 		= 1L << 0,
		/// FT_FACE_FLAG_FIXED_SIZES
		FixedSize 		= 1L << 1,
		/// FT_FACE_FLAG_FIXED_WIDTH
		FixedWidth 		= 1L << 2,
		/// FT_FACE_FLAG_SFNT
		SFNT 			= 1L << 3,
		/// FT_FACE_FLAG_HORIZONTAL
		Horizontal 		= 1L << 4,
		/// FT_FACE_FLAG_VERTICAL
		Vertical 		= 1L << 5,
		/// FT_FACE_FLAG_KERNING
		Kerning 		= 1L << 6,
		/// FT_FACE_FLAG_FAST_GLYPHS
		FastGlyphs 		= 1L << 7,
		/// FT_FACE_FLAG_MULTIPLE_MASTERS
		MultipleMasters = 1L << 8,
		/// FT_FACE_FLAG_GLYPH_NAMES
		GlyphNames 		= 1L << 9,
		/// FT_FACE_FLAG_EXTERNAL_STREAM
		ExternalStream 	= 1L << 10,
		/// FT_FACE_FLAG_HINTER
		Hinter 			= 1L << 11,
		/// FT_FACE_FLAG_CID_KEYED
		CIDKeyed 		= 1L << 12,
		/// FT_FACE_FLAG_TRICKY
		Tricky 			= 1L << 13,
		/// FT_FACE_FLAG_COLOR
		Color 			= 1L << 14,
		/// FT_FACE_FLAG_VARIATION
		Variation 		= 1L << 15
	}
	
	/// STYLE_FLAG_XXX
	public enum StyleFlag : FT_Long
	{
		/// No flags specified.
		None 	= 0,
		/// FT_STYLE_FLAG_ITALIC
		Italic 	= 1 << 0,
		/// FT_STYLE_FLAG_BOLD
		Bold 	= 1 << 1
	}

	/// FT_LOAD_XXX
	[AllowDuplicates]
	public enum LoadFlag : FT_Long
	{
		/// FT_LOAD_DEFAULT                    
		Default                     = 0x0,
		/// FT_LOAD_NO_SCALE                   
		NoScale                    = 1L << 0,
		/// FT_LOAD_NO_HINTING                 
		NoHinting                  = 1L << 1,
		/// FT_LOAD_RENDER                     
		Render                      = 1L << 2,
		/// FT_LOAD_NO_BITMAP                  
		NoBitmap                   = 1L << 3,
		/// FT_LOAD_VERTICAL_LAYOUT            
		VerticalLayout             = 1L << 4,
		/// FT_LOAD_FORCE_AUTOHINT             
		ForceAutohint              = 1L << 5,
		/// FT_LOAD_CROP_BITMAP                
		CropBitmap                 = 1L << 6,
		/// FT_LOAD_PEDANTIC                   
		Pedantic                    = 1L << 7,
		/// FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH
		IgnoreGlobalAdvanceWidth = 1L << 9,
		/// FT_LOAD_NO_RECURSE                 
		NoRecurse                  = 1L << 10,
		/// FT_LOAD_IGNORE_TRANSFORM           
		IgnoreTransform            = 1L << 11,
		/// FT_LOAD_MONOCHROME                 
		Monochrome                  = 1L << 12,
		/// FT_LOAD_LINEAR_DESIGN              
		LinearDesign               = 1L << 13,
		/// FT_LOAD_NO_AUTOHINT                
		NoAutohint                 = 1L << 15,

		/// FT_LOAD_TARGET_NORMAL              
		TargetNormal               = ((.)FT_Render_Mode.FT_RENDER_MODE_NORMAL & 15) << 16,
		/// FT_LOAD_TARGET_LIGHT               
		TargetLight                = ((.)FT_Render_Mode.FT_RENDER_MODE_LIGHT & 15) << 16,
		/// FT_LOAD_TARGET_MONO                
		TargetMono                 = ((.)FT_Render_Mode.FT_RENDER_MODE_MONO & 15) << 16,
		/// FT_LOAD_TARGET_LCD                 
		TargetLcd                  = ((.)FT_Render_Mode.FT_RENDER_MODE_LCD & 15) << 16,
		/// FT_LOAD_TARGET_LCD_V               
		TargetLcdV                = ((.)FT_Render_Mode.FT_RENDER_MODE_LCD_V & 15) << 16,

		/// FT_LOAD_COLOR                      
		Color                       = 1L << 20,
		/// FT_LOAD_COMPUTE_METRICS            
		ComputeMetrics             = 1L << 21,
		/// FT_LOAD_BITMAP_METRICS_ONLY        
		BitmapMetricsOnly         = 1L << 22,
		/* used internally only by certain font drivers */
		/// FT_LOAD_ADVANCE_ONLY               
		AdvanceOnly                = 1L << 8,
		/// FT_LOAD_SBITS_ONLY                 
		SbitsOnly                  = 1L << 14
	}

	/// SUBGLYPH_FLAG_XXX
	public enum SubglyphFlag : FT_Long
	{
		/// FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS
		ArgsAreWords    = 1,
		/// FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES
		ArgsAreXyValues = 2,
		/// FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID
		RoundXyToGrid   = 4,
		/// FT_SUBGLYPH_FLAG_SCALE
		Scale           = 8,
		/// FT_SUBGLYPH_FLAG_XY_SCALE
		XyScale         = 0x40,
		/// FT_SUBGLYPH_FLAG_2X2
		TwoByTwo        = 0x80,
		/// FT_SUBGLYPH_FLAG_USE_MY_METRICS
		UseMyMetrics    = 0x200
	}

	/// FT_OPEN_XXX
	public enum OpenFlag : FT_UInt
	{
		/// FT_OPEN_MEMORY
		Memory   = 0x1,
		/// FT_OPEN_STREAM
		Stream   = 0x2,
		/// FT_OPEN_PATHNAME
		Pathname = 0x4,
		/// FT_OPEN_DRIVER
		Driver   = 0x8,
		/// FT_OPEN_PARAMS
		Params   = 0x10
	}

	/// FT_FSTYPE_XXX
	public enum FSTypeFlag : FT_Short
	{
		/// FT_FSTYPE_INSTALLABLE_EMBEDDING
		InstallableEmbedding 		= 0x0000,
		/// FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING
		RestrictedLicenseEmbedding 	= 0x0002,
		/// FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING
		PreviewAndPrintEmbedding 	= 0x0004,
		/// FT_FSTYPE_EDITABLE_EMBEDDING
		EditableEmbedding 			= 0x0008,
		/// FT_FSTYPE_NO_SUBSETTING
		NoSubsetting 				= 0x0100,
		/// FT_FSTYPE_BITMAP_EMBEDDING_ONLY
		BitmapEmbeddingOnly 		= 0x0200
	}
}
