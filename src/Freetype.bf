using System;

namespace FreeType
{
	//
	// Basic types
	//

	[CRepr]
	public struct FT_Glyph_Metrics
	{
		public FT_Pos  width;
		public FT_Pos  height;

		public FT_Pos  horiBearingX;
		public FT_Pos  horiBearingY;
		public FT_Pos  horiAdvance;

		public FT_Pos  vertBearingX;
		public FT_Pos  vertBearingY;
		public FT_Pos  vertAdvance;
	}

	[CRepr]
	public struct FT_Bitmap_Size
	{
	    public FT_Short  height;
	    public FT_Short  width;
	
	    public FT_Pos    size;
	
	    public FT_Pos    x_ppem;
	    public FT_Pos    y_ppem;
	}

	//
	// Object classes
	//
	
	typealias FT_Library = FT_LibraryRec*;

	typealias FT_Module = FT_ModuleRec*;

	typealias FT_Driver = FT_DriverRec*;

	typealias FT_Renderer = FT_RendererRec*;

	typealias FT_Face = FT_FaceRec*;
	
	typealias FT_Size = FT_SizeRec*;

	typealias FT_GlyphSlot = FT_GlyphSlotRec*;
	
	typealias FT_CharMap = FT_CharMapRec*;

	[AllowDuplicates]
	public enum FT_Encoding : FT_UInt32
	{
		FT_ENCODING_NONE = 0,

		FT_ENCODING_MS_SYMBOL = ((.)'s' << 24) | ((.)'y' << 16) | ((.)'m' << 8 ) | (.)'b',
		FT_ENCODING_UNICODE = ((.)'u' << 24) | ((.)'n' << 16) | ((.)'i' << 8 ) | (.)'c',

		FT_ENCODING_SJIS = ((.)'s' << 24) | ((.)'j' << 16) | ((.)'i' << 8 ) | (.)'s', //   's', 'j', 'i', 's'
		FT_ENCODING_PRC = ((.)'g' << 24) | ((.)'b' << 16) | ((.)' ' << 8 ) | (.)' ', //     'g', 'b', ' ', ' '
		FT_ENCODING_BIG5 = ((.)'b' << 24) | ((.)'i' << 16) | ((.)'g' << 8 ) | (.)'5', //    'b', 'i', 'g', '5'
		FT_ENCODING_WANSUNG = ((.)'w' << 24) | ((.)'a' << 16) | ((.)'n' << 8 ) | (.)'s', // 'w', 'a', 'n', 's'
		FT_ENCODING_JOHAB = ((.)'j' << 24) | ((.)'o' << 16) | ((.)'h' << 8 ) | (.)'a', //   'j', 'o', 'h', 'a'
		
		/* for backward compatibility */
		FT_ENCODING_GB2312     = FT_ENCODING_PRC,
		FT_ENCODING_MS_SJIS    = FT_ENCODING_SJIS,
		FT_ENCODING_MS_GB2312  = FT_ENCODING_PRC,
		FT_ENCODING_MS_BIG5    = FT_ENCODING_BIG5,
		FT_ENCODING_MS_WANSUNG = FT_ENCODING_WANSUNG,
		FT_ENCODING_MS_JOHAB   = FT_ENCODING_JOHAB,

		FT_ENCODING_ADOBE_STANDARD= ((.)'A' << 24) | ((.)'D' << 16) | ((.)'O' << 8 ) | (.)'B', //    'A', 'D', 'O', 'B' ),
		FT_ENCODING_ADOBE_EXPERT= ((.)'A' << 24) | ((.)'D' << 16) | ((.)'B' << 8 ) | (.)'E', //      'A', 'D', 'B', 'E' ),
		FT_ENCODING_ADOBE_CUSTOM= ((.)'A' << 24) | ((.)'D' << 16) | ((.)'B' << 8 ) | (.)'C', //      'A', 'D', 'B', 'C' ),
		FT_ENCODING_ADOBE_LATIN_1 = ((.)'l' << 24) | ((.)'a' << 16) | ((.)'t' << 8 ) | (.)'1', //     'l', 'a', 't', '1' ),

		FT_ENCODING_OLD_LATIN_2 = ((.)'l' << 24) | ((.)'a' << 16) | ((.)'t' << 8 ) | (.)'2', //    'l', 'a', 't', '2' ),

		FT_ENCODING_APPLE_ROMAN = ((.)'a' << 24) | ((.)'r' << 16) | ((.)'m' << 8 ) | (.)'n', //    'a', 'r', 'm', 'n' )
	}

	[CRepr]
	public struct FT_CharMapRec
	{
    	public FT_Face      face;
    	public FT_Encoding  encoding;
    	public FT_UShort    platform_id;
    	public FT_UShort    encoding_id;
	}

	typealias FT_Face_Internal = FT_Face_InternalRec*;

	[CRepr]
	public struct FT_FaceRec
	{
		public FT_Long           num_faces;
		public FT_Long           face_index;

		public FT_Long           face_flags;
		public FT_Long           style_flags;

		public FT_Long           num_glyphs;

		public FT_String*        family_name;
		public FT_String*        style_name;

		public FT_Int            num_fixed_sizes;
		public FT_Bitmap_Size*   available_sizes;

		public FT_Int            num_charmaps;
		public FT_CharMap*       charmaps;

		public FT_Generic        generic;

		/*# The following member variables (down to `underline_thickness`) */
		/*# are only relevant to scalable outlines; cf. @FT_Bitmap_Size    */
		/*# for bitmap fonts.                                              */
		public FT_BBox           bbox;

		public FT_UShort         units_per_EM;
		public FT_Short          ascender;
		public FT_Short          descender;
		public FT_Short          height;

		public FT_Short          max_advance_width;
		public FT_Short          max_advance_height;

		public FT_Short          underline_position;
		public FT_Short          underline_thickness;

		public FT_GlyphSlot      glyph;
		public FT_Size           size;
		public FT_CharMap        charmap;

		private FT_Driver 		  driver;
		private FT_Memory         memory;
	    private FT_Stream         stream;
	
	    private FT_ListRec        sizes_list;
	
	    private FT_Generic        autohint;   /* face-specific auto-hinter data */
	    private void*             extensions; /* unused                         */
	
	    private FT_Face_Internal  ftinternal;

	}

	static
	{
		public const uint32 FT_FACE_FLAG_SCALABLE 			= 1L << 0;
		public const uint32 FT_FACE_FLAG_FIXED_SIZES 		= 1L << 1;
		public const uint32 FT_FACE_FLAG_FIXED_WIDTH 		= 1L << 2;
		public const uint32 FT_FACE_FLAG_SFNT 				= 1L << 3;
		public const uint32 FT_FACE_FLAG_HORIZONTAL 		= 1L << 4;
		public const uint32 FT_FACE_FLAG_VERTICAL 			= 1L << 5;
		public const uint32 FT_FACE_FLAG_KERNING 			= 1L << 6;
		public const uint32 FT_FACE_FLAG_FAST_GLYPHS 		= 1L << 7;
		public const uint32 FT_FACE_FLAG_MULTIPLE_MASTERS 	= 1L << 8;
		public const uint32 FT_FACE_FLAG_GLYPH_NAMES 		= 1L << 9;
		public const uint32 FT_FACE_FLAG_EXTERNAL_STREAM 	= 1L << 10;
		public const uint32 FT_FACE_FLAG_HINTER 			= 1L << 11;
		public const uint32 FT_FACE_FLAG_CID_KEYED 			= 1L << 12;
		public const uint32 FT_FACE_FLAG_TRICKY 			= 1L << 13;
		public const uint32 FT_FACE_FLAG_COLOR 				= 1L << 14;
		public const uint32 FT_FACE_FLAG_VARIATION 			= 1L << 15;

		// Todo methods for flag checking

		public const uint32 FT_STYLE_FLAG_ITALIC = 1 << 0;
		public const uint32 FT_STYLE_FLAG_BOLD   = 1 << 1;
	}
	

	typealias FT_Size_Internal = FT_Size_InternalRec*;

	[CRepr]
	public struct FT_Size_Metrics
	{
		public FT_UShort  x_ppem;      /* horizontal pixels per EM               */
		public FT_UShort  y_ppem;      /* vertical pixels per EM                 */

		public FT_Fixed   x_scale;     /* scaling values used to convert font    */
		public FT_Fixed   y_scale;     /* units to 26.6 fractional pixels        */

		public FT_Pos     ascender;    /* ascender in 26.6 frac. pixels          */
		public FT_Pos     descender;   /* descender in 26.6 frac. pixels         */
		public FT_Pos     height;      /* text height in 26.6 frac. pixels       */
		public FT_Pos     max_advance; /* max horizontal advance, in 26.6 pixels */
	}
	

	[CRepr]
	public struct FT_SizeRec
	{
		public FT_Face           face;      /* parent face object              */
		public FT_Generic        generic;   /* generic pointer for client uses */
		public FT_Size_Metrics   metrics;   /* size metrics                    */
		public FT_Size_Internal  size_internal;
	}
	
	typealias FT_SubGlyph = FT_SubGlyphRec*;

	typealias FT_Slot_Internal = FT_Slot_InternalRec*;
	
	[CRepr]
	public struct FT_GlyphSlotRec
	{
		public FT_Library        library;
		public FT_Face           face;
		public FT_GlyphSlot      next;
		public FT_UInt           glyph_index; /* new in 2.10; was reserved previously */
		public FT_Generic        generic;

		public FT_Glyph_Metrics  metrics;
		public FT_Fixed          linearHoriAdvance;
		public FT_Fixed          linearVertAdvance;
		public FT_Vector         advance;

		public FT_Glyph_Format   format;

		public FT_Bitmap         bitmap;
		public FT_Int            bitmap_left;
		public FT_Int            bitmap_top;

		public FT_Outline        outline;

		public FT_UInt           num_subglyphs;
		public FT_SubGlyph       subglyphs;

		public void*             control_data;
		public int32              control_len;

		public FT_Pos            lsb_delta;
		public FT_Pos            rsb_delta;

		public void*             other;

		public FT_Slot_Internal  slot_internal;
	}

	static
	{
		[CLink]
		public static extern FT_Error FT_Init_FreeType(FT_Library *alibrary);
	
		[CLink]
		public static extern FT_Error FT_Done_FreeType(FT_Library library);

		public const uint32 FT_OPEN_MEMORY = 0x1;
		public const uint32 FT_OPEN_STREAM = 0x2;
		public const uint32 FT_OPEN_PATHNAME = 0x4;
		public const uint32 FT_OPEN_DRIVER = 0x8;
		public const uint32 FT_OPEN_PARAMS = 0x10;
	}
	
	[CRepr]
	public struct FT_Parameter
	{
		public FT_ULong tag;
		public FT_Pointer data;
	}

	[CRepr]
	public struct FT_Open_Args
	{
		public FT_UInt         flags;
		public FT_Byte*  	   memory_base;
		public FT_Long         memory_size;
		public FT_String*      pathname;
		public FT_Stream       stream;
		public FT_Module       driver;
		public FT_Int          num_params;
		public FT_Parameter*   ftparams;
	}

	static
	{
		[CLink]
		public static extern FT_Error FT_New_Face(FT_Library library, char8* filepathname, FT_Long face_index, FT_Face *aface);
	
		[CLink]
		public static extern FT_Error FT_New_Memory_Face(FT_Library library, FT_Byte* file_base, FT_Long file_size, FT_Long face_index, FT_Face *aface);
		
		[CLink]
		public static extern FT_Error FT_Open_Face(FT_Library library, FT_Open_Args* args, FT_Long face_index, FT_Face *aface);
		
		[CLink]
		public static extern FT_Error FT_Attach_File(FT_Face face, uint8* filepathname);

		[CLink]
		public static extern FT_Error FT_Attach_Stream(FT_Face face, FT_Open_Args* parameters);
		
		[CLink]
		public static extern FT_Error FT_Reference_Face(FT_Face face);

		[CLink]
		public static extern FT_Error FT_Done_Face(FT_Face face);

		[CLink]
		public static extern FT_Error FT_Select_Size(FT_Face face, FT_Int strike_index);
	}	

	public enum FT_Size_Request_Type : uint32
	{
		FT_SIZE_REQUEST_TYPE_NOMINAL,
		FT_SIZE_REQUEST_TYPE_REAL_DIM,
		FT_SIZE_REQUEST_TYPE_BBOX,
		FT_SIZE_REQUEST_TYPE_CELL,
		FT_SIZE_REQUEST_TYPE_SCALES,

		FT_SIZE_REQUEST_TYPE_MAX
	}

	[CRepr]
	public struct FT_Size_RequestRec
	{
		public FT_Size_Request_Type  type;
		public FT_Long               width;
		public FT_Long               height;
		public FT_UInt               horiResolution;
		public FT_UInt               vertResolution;
	}

	typealias FT_Size_Request = FT_Size_RequestRec*;

	static
	{
		[CLink]
		public static extern FT_Error FT_Request_Size(FT_Face face, FT_Size_Request req);

		[CLink]
		public static extern FT_Error FT_Set_Char_Size(FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, FT_UInt horz_resolution, FT_UInt vert_resolution);

		[CLink]
		public static extern FT_Error FT_Set_Pixel_Sizes(FT_Face face, FT_UInt pixel_width, FT_UInt pixel_height);
		
		[CLink]
		public static extern FT_Error FT_Load_Glyph(FT_Face face, FT_UInt glyph_index, FT_Int32 load_flags);

		[CLink]
		public static extern FT_Error FT_Load_Char(FT_Face face, /* FT_ULong*/char32 char_code, FT_Int32  load_flags);
		
		public static FT_Int32 FT_LOAD_DEFAULT                     = 0x0;
		public static FT_Int32 FT_LOAD_NO_SCALE                    = ( 1L << 0 );
		public static FT_Int32 FT_LOAD_NO_HINTING                  = ( 1L << 1 );
		public static FT_Int32 FT_LOAD_RENDER                      = ( 1L << 2 );
		public static FT_Int32 FT_LOAD_NO_BITMAP                   = ( 1L << 3 );
		public static FT_Int32 FT_LOAD_VERTICAL_LAYOUT             = ( 1L << 4 );
		public static FT_Int32 FT_LOAD_FORCE_AUTOHINT              = ( 1L << 5 );
		public static FT_Int32 FT_LOAD_CROP_BITMAP                 = ( 1L << 6 );
		public static FT_Int32 FT_LOAD_PEDANTIC                    = ( 1L << 7 );
		public static FT_Int32 FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = ( 1L << 9 );
		public static FT_Int32 FT_LOAD_NO_RECURSE                  = ( 1L << 10 );
		public static FT_Int32 FT_LOAD_IGNORE_TRANSFORM            = ( 1L << 11 );
		public static FT_Int32 FT_LOAD_MONOCHROME                  = ( 1L << 12 );
		public static FT_Int32 FT_LOAD_LINEAR_DESIGN               = ( 1L << 13 );
		public static FT_Int32 FT_LOAD_NO_AUTOHINT                 = ( 1L << 15 );
		  /* Bits 16-19 are used by `FT_LOAD_TARGET_` */
		public static FT_Int32 FT_LOAD_COLOR                       = ( 1L << 20 );
		public static FT_Int32 FT_LOAD_COMPUTE_METRICS             = ( 1L << 21 );
		public static FT_Int32 FT_LOAD_BITMAP_METRICS_ONLY         = ( 1L << 22 );
		  /* used internally only by certain font drivers */
		public static FT_Int32 FT_LOAD_ADVANCE_ONLY                = ( 1L << 8 );
		public static FT_Int32 FT_LOAD_SBITS_ONLY                  = ( 1L << 14 );
		
		//FT_LOAD_TARGET_( x )   ( (FT_Int32)( (x) & 15 ) << 16 )

		public static FT_Int32 FT_LOAD_TARGET_NORMAL = ((.)FT_Render_Mode.FT_RENDER_MODE_NORMAL & 15) << 16; //FT_LOAD_TARGET_( FT_RENDER_MODE_NORMAL )
		public static FT_Int32 FT_LOAD_TARGET_LIGHT  = ((.)FT_Render_Mode.FT_RENDER_MODE_LIGHT & 15) << 16;//FT_LOAD_TARGET_( FT_RENDER_MODE_LIGHT  )
		public static FT_Int32 FT_LOAD_TARGET_MONO   = ((.)FT_Render_Mode.FT_RENDER_MODE_MONO & 15) << 16;//FT_LOAD_TARGET_( FT_RENDER_MODE_MONO   )
		public static FT_Int32 FT_LOAD_TARGET_LCD    = ((.)FT_Render_Mode.FT_RENDER_MODE_LCD & 15) << 16;//FT_LOAD_TARGET_( FT_RENDER_MODE_LCD    )
		public static FT_Int32 FT_LOAD_TARGET_LCD_V  = ((.)FT_Render_Mode.FT_RENDER_MODE_LCD_V & 15) << 16; //FT_LOAD_TARGET_( FT_RENDER_MODE_LCD_V  )


		[CLink]
		public static extern void FT_Set_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);
	}

	public enum FT_Render_Mode : uint32
	{
	  FT_RENDER_MODE_NORMAL = 0,
	  FT_RENDER_MODE_LIGHT,
	  FT_RENDER_MODE_MONO,
	  FT_RENDER_MODE_LCD,
	  FT_RENDER_MODE_LCD_V,

	  FT_RENDER_MODE_MAX
	}

	static
	{
		[CLink]
		public static extern FT_Error FT_Render_Glyph(FT_GlyphSlot slot, FT_Render_Mode render_mode);
	}

	public enum FT_Kerning_Mode : uint32
	{
		FT_KERNING_DEFAULT = 0,
		FT_KERNING_UNFITTED,
		FT_KERNING_UNSCALED
	}

	static
	{
		[CLink]
		public static extern FT_Error FT_Get_Kerning(FT_Face face, FT_UInt left_glyph, FT_UInt right_glyph, FT_UInt kern_mode, FT_Vector *akerning );

		[CLink]
		public static extern FT_Error FT_Get_Track_Kerning(FT_Face face, FT_Fixed point_size, FT_Int degree, FT_Fixed* akerning);

		[CLink]
		public static extern FT_Error FT_Get_Glyph_Name(FT_Face face, FT_UInt glyph_index, FT_Pointer buffer, FT_UInt buffer_max);

		[CLink]
		public static extern char8* FT_Get_Postscript_Name(FT_Face face);

		[CLink]
		public static extern FT_Error FT_Select_Charmap(FT_Face face, FT_Encoding encoding);

		[CLink]
		public static extern FT_Error FT_Set_Charmap(FT_Face face, FT_CharMap charmap);

		[CLink]
		public static extern FT_Int FT_Get_Charmap_Index(FT_CharMap charmap);

		[CLink]
		public static extern FT_UInt FT_Get_Char_Index(FT_Face face, /*FT_ULong*/ char32 charcode);
		
		[CLink]
		public static extern FT_ULong FT_Get_First_Char(FT_Face face, FT_UInt *agindex);

		[CLink]
		public static extern FT_ULong FT_Get_Next_Char(FT_Face face, FT_ULong char_code, FT_UInt *agindex);

		[CLink]
		public static extern FT_Error FT_Face_Properties(FT_Face face, FT_UInt num_properties, FT_Parameter* properties);

		[CLink]
		public static extern FT_UInt FT_Get_Name_Index(FT_Face face, FT_String* glyph_name);

		public const uint32 FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS 	= 1;
		public const uint32 FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES	= 2;
		public const uint32 FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID 	= 4;
		public const uint32 FT_SUBGLYPH_FLAG_SCALE 				= 8;
		public const uint32 FT_SUBGLYPH_FLAG_XY_SCALE 			= 0x40;
		public const uint32 FT_SUBGLYPH_FLAG_2X2 				= 0x80;
		public const uint32 FT_SUBGLYPH_FLAG_USE_MY_METRICS 	= 0x200;

		[CLink]
		public static extern FT_Error FT_Get_SubGlyph_Info(FT_GlyphSlot glyph, FT_UInt sub_index, FT_Int *p_index, FT_UInt *p_flags, FT_Int *p_arg1, FT_Int *p_arg2, FT_Matrix *p_transform);
	}

	[CRepr]
	public struct FT_LayerIterator
	{
    	public FT_UInt   num_layers;
    	public FT_UInt   layer;
    	public FT_Byte*  p;
	}

	static
	{
		[CLink]
		public static extern FT_Bool FT_Get_Color_Glyph_Layer(FT_Face face, FT_UInt base_glyph, FT_UInt *aglyph_index, FT_UInt *acolor_index, FT_LayerIterator* iterator);

		public const uint32 FT_FSTYPE_INSTALLABLE_EMBEDDING 		= 0x0000;
		public const uint32 FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING 	= 0x0002;
		public const uint32 FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING 	= 0x0004;
		public const uint32 FT_FSTYPE_EDITABLE_EMBEDDING 			= 0x0008;
		public const uint32 FT_FSTYPE_NO_SUBSETTING 				= 0x0100;
		public const uint32 FT_FSTYPE_BITMAP_EMBEDDING_ONLY 		= 0x0200;
		
		[CLink]
		public static extern FT_UShort FT_Get_FSType_Flags(FT_Face face);

		[CLink]
		public static extern FT_UInt FT_Face_GetCharVariantIndex(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);
		
		[CLink]
		public static extern FT_Int FT_Face_GetCharVariantIsDefault(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);
		
		[CLink]
		public static extern FT_UInt32* FT_Face_GetVariantSelectors(FT_Face face);
		
		[CLink]
		public static extern FT_UInt32* FT_Face_GetVariantsOfChar(FT_Face face, FT_ULong charcode);
		
		[CLink]
		public static extern FT_UInt32* FT_Face_GetCharsOfVariant(FT_Face face, FT_ULong variantSelector);
		
		[CLink]
		public static extern void FT_Library_Version(FT_Library library, FT_Int *amajor, FT_Int *aminor, FT_Int *apatch);
		
		[CLink]
		public static extern FT_Bool FT_Face_CheckTrueTypePatents(FT_Face face);
		
		[CLink]
		public static extern FT_Bool FT_Face_SetUnpatentedHinting(FT_Face face, FT_Bool value);
	}
}
