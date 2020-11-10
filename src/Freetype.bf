using System;

namespace FreeType
{
	public static class FreeType
	{
		[LinkName("FT_Init_FreeType")]
		public static extern FT_Error Init_FreeType(FT_Library *alibrary);
		
		[LinkName("FT_Done_FreeType")]
		public static extern FT_Error Done_FreeType(FT_Library library);

		[LinkName("FT_New_Face")]
		public static extern FT_Error New_Face(FT_Library library, char8* filepathname, FT_Long face_index, FT_Face *aface);

		[LinkName("FT_New_Memory_Face")]
		public static extern FT_Error New_Memory_Face(FT_Library library, FT_Byte* file_base, FT_Long file_size, FT_Long face_index, FT_Face *aface);

		[LinkName("FT_Open_Face")]
		public static extern FT_Error Open_Face(FT_Library library, FT_Open_Args* args, FT_Long face_index, FT_Face *aface);

		[LinkName("FT_Attach_File")]
		public static extern FT_Error Attach_File(FT_Face face, uint8* filepathname);

		[LinkName("FT_Attach_Stream")]
		public static extern FT_Error Attach_Stream(FT_Face face, FT_Open_Args* parameters);

		[LinkName("FT_Reference_Face")]
		public static extern FT_Error Reference_Face(FT_Face face);

		[LinkName("FT_Done_Face")]
		public static extern FT_Error Done_Face(FT_Face face);

		[LinkName("FT_Select_Size")]
		public static extern FT_Error Select_Size(FT_Face face, FT_Int strike_index);

		[LinkName("FT_Request_Size")]
		public static extern FT_Error Request_Size(FT_Face face, FT_Size_Request req);

		[LinkName("FT_Set_Char_Size")]
		public static extern FT_Error Set_Char_Size(FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, FT_UInt horz_resolution, FT_UInt vert_resolution);

		[LinkName("FT_Set_Pixel_Sizes")]
		public static extern FT_Error Set_Pixel_Sizes(FT_Face face, FT_UInt pixel_width, FT_UInt pixel_height);

		[LinkName("FT_Load_Glyph")]
		public static extern FT_Error Load_Glyph(FT_Face face, FT_UInt glyph_index, LoadFlag load_flags);

		[LinkName("FT_Load_Char")]
		public static extern FT_Error Load_Char(FT_Face face, /*FT_ULong*/ char32 char_code, LoadFlag load_flags);
		
		[LinkName("FT_Set_Transform")]
		public static extern void Set_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);

		[LinkName("FT_Render_Glyph")]
		public static extern FT_Error Render_Glyph(FT_GlyphSlot slot, RenderMode render_mode);

		[LinkName("FT_Get_Kerning")]
		public static extern FT_Error Get_Kerning(FT_Face face, FT_UInt left_glyph, FT_UInt right_glyph, FT_UInt kern_mode, FT_Vector *akerning );

		[LinkName("FT_Get_Track_Kerning")]
		public static extern FT_Error Get_Track_Kerning(FT_Face face, FT_Fixed point_size, FT_Int degree, FT_Fixed* akerning);

		[LinkName("FT_Get_Glyph_Name")]
		public static extern FT_Error Get_Glyph_Name(FT_Face face, FT_UInt glyph_index, FT_Pointer buffer, FT_UInt buffer_max);

		[LinkName("FT_Get_Postscript_Name")]
		public static extern char8* Get_Postscript_Name(FT_Face face);

		[LinkName("FT_Select_Charmap")]
		public static extern FT_Error Select_Charmap(FT_Face face, Encoding encoding);

		[LinkName("FT_Set_Charmap")]
		public static extern FT_Error Set_Charmap(FT_Face face, FT_CharMap charmap);

		[LinkName("FT_Get_Charmap_Index")]
		public static extern FT_Int Get_Charmap_Index(FT_CharMap charmap);

		[LinkName("FT_Get_Char_Index")]
		public static extern FT_UInt Get_Char_Index(FT_Face face, /*FT_ULong*/ char32 charcode);

		[LinkName("FT_Get_First_Char")]
		public static extern /*FT_ULong*/ char32 Get_First_Char(FT_Face face, FT_UInt *agindex);

		[LinkName("FT_Get_Next_Char")]
		public static extern /*FT_ULong*/ char32 Get_Next_Char(FT_Face face, /*FT_ULong*/ char32 char_code, FT_UInt *agindex);

		[LinkName("FT_Face_Properties")]
		public static extern FT_Error Face_Properties(FT_Face face, FT_UInt num_properties, FT_Parameter* properties);

		[LinkName("FT_Get_Name_Index")]
		public static extern FT_UInt Get_Name_Index(FT_Face face, FT_String* glyph_name);

		[LinkName("FT_Get_SubGlyph_Info")]
		public static extern FT_Error Get_SubGlyph_Info(FT_GlyphSlot glyph, FT_UInt sub_index, FT_Int *p_index, SubglyphFlag *p_flags, FT_Int *p_arg1, FT_Int *p_arg2, FT_Matrix *p_transform);

		[LinkName("FT_Get_Color_Glyph_Layer")]
		public static extern FT_Bool Get_Color_Glyph_Layer(FT_Face face, FT_UInt base_glyph, FT_UInt *aglyph_index, FT_UInt *acolor_index, FT_LayerIterator* iterator);

		[LinkName("FT_Get_FSType_Flags")]
		public static extern FSTypeFlag Get_FSType_Flags(FT_Face face);

		[LinkName("FT_Face_GetCharVariantIndex")]
		public static extern FT_UInt Face_GetCharVariantIndex(FT_Face face, /*FT_ULong*/ char32 charcode, FT_ULong variantSelector);

		[LinkName("FT_Face_GetCharVariantIsDefault")]
		public static extern FT_Int Face_GetCharVariantIsDefault(FT_Face face, /*FT_ULong*/ char32 charcode, FT_ULong variantSelector);

		[LinkName("FT_Face_GetVariantSelectors")]
		public static extern FT_UInt32* Face_GetVariantSelectors(FT_Face face);

		[LinkName("FT_Face_GetVariantsOfChar")]
		public static extern FT_UInt32* Face_GetVariantsOfChar(FT_Face face, /*FT_ULong*/ char32 charcode);

		[LinkName("FT_Face_GetCharsOfVariant")]
		public static extern FT_UInt32* Face_GetCharsOfVariant(FT_Face face, FT_ULong variantSelector);

		[LinkName("FT_Library_Version")]
		public static extern void Library_Version(FT_Library library, FT_Int *amajor, FT_Int *aminor, FT_Int *apatch);

		[LinkName("FT_Face_CheckTrueTypePatents")]
		public static extern FT_Bool Face_CheckTrueTypePatents(FT_Face face);

		[LinkName("FT_Face_SetUnpatentedHinting")]
		public static extern FT_Bool Face_SetUnpatentedHinting(FT_Face face, FT_Bool value);

		
		/**
		 * Retrieve the description of a valid FreeType error code.
		 * @param error_code A valid FreeType error code.
		 * @returns A C string or NULL, if any error occurred.
		 *
		 * @remarks FreeType has to be compiled with FT_CONFIG_OPTION_ERROR_STRINGS or FT_DEBUG_LEVEL_ERROR to get meaningful descriptions. ‘error_string’ will be NULL otherwise.
		*/
		[LinkName("FT_Error_String")]
		public static extern char8* Error_String(FT_Error error_code);
	}

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

	[CRepr]
	public struct FT_CharMapRec
	{
    	public FT_Face      face;
    	public Encoding     encoding;
    	public FT_UShort    platform_id;
    	public FT_UShort    encoding_id;
	}

	typealias FT_Face_Internal = FT_Face_InternalRec*;

	[CRepr]
	public struct FT_FaceRec
	{
		public FT_Long           num_faces;
		public FT_Long           face_index;

		public FaceFlag          face_flags;
		public StyleFlag         style_flags;

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

		public GlyphFormat   format;

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

	[CRepr]
	public struct FT_Parameter
	{
		public FT_ULong tag;
		public FT_Pointer data;
	}

	[CRepr]
	public struct FT_Open_Args
	{
		public OpenFlag        flags; /*FT_UInt*/
		public FT_Byte*  	   memory_base;
		public FT_Long         memory_size;
		public FT_String*      pathname;
		public FT_Stream       stream;
		public FT_Module       driver;
		public FT_Int          num_params;
		public FT_Parameter*   ftparams;
	}

	[CRepr]
	public struct FT_Size_RequestRec
	{
		public SizeRequestType       type;
		public FT_Long               width;
		public FT_Long               height;
		public FT_UInt               horiResolution;
		public FT_UInt               vertResolution;
	}

	typealias FT_Size_Request = FT_Size_RequestRec*;

	[CRepr]
	public struct FT_LayerIterator
	{
    	public FT_UInt   num_layers;
    	public FT_UInt   layer;
    	public FT_Byte*  p;
	}
}
