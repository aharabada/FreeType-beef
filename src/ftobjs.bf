using System;

namespace FreeType
{
	[CRepr]
	public struct FT_Size_InternalRec
	{
		void*  module_data;

		RenderMode   autohint_mode;
		FT_Size_Metrics  autohint_metrics;
	}

	public struct FT_ModuleRec;

	public struct FT_DriverRec;

	public struct FT_RendererRec;

	public struct FT_Face_InternalRec;

	[CRepr]
	public struct FT_Slot_InternalRec
	{
		public FT_GlyphLoader  loader;
		public FT_UInt         flags;
		public FT_Bool         glyph_transformed;
		public FT_Matrix       glyph_matrix;
		public FT_Vector       glyph_delta;
		public void*           glyph_hints;

		public FT_Int32        load_flags;
	}

	[CRepr]
	public struct FT_LibraryRec
	{
		public FT_Memory memory;

		public FT_Int version_major;
		public FT_Int version_minor;
		public FT_Int version_patch;
		
		FT_UInt num_modules;
		FT_Module[FT_MAX_MODULES] modules;  /* module objects  */

		FT_ListRec         renderers;        /* list of renderers        */
		FT_Renderer        *cur_renderer;     /* current outline renderer */
		FT_Module          auto_hinter;

		FT_DebugHook_Func[4]  debug_hooks;

#if FT_CONFIG_OPTION_SUBPIXEL_RENDERING
		FT_LcdFiveTapFilter      lcd_weights;      /* filter weights, if any */
		FT_Bitmap_LcdFilterFunc  lcd_filter_func;  /* filtering callback     */
#else
		FT_Vector[3]                lcd_geometry;  /* RGB subpixel positions */
#endif

		FT_Int             refcount;
	}
}
