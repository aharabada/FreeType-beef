using System;

namespace FreeType
{
	typealias FT_Pos = int32;
	
	[CRepr]
	public struct FT_Vector
	{
		public FT_Pos x;
		public FT_Pos y;
	}

	[CRepr]
	public struct FT_BBox
	{
		public FT_Pos xMin, yMin;
		public FT_Pos xMax, yMax;
	}

	public enum FT_Pixel_Mode : char8
	{
		FT_PIXEL_MODE_NONE = 0,
		FT_PIXEL_MODE_MONO,
		FT_PIXEL_MODE_GRAY,
		FT_PIXEL_MODE_GRAY2,
		FT_PIXEL_MODE_GRAY4,
		FT_PIXEL_MODE_LCD,
		FT_PIXEL_MODE_LCD_V,
		FT_PIXEL_MODE_BGRA,

		FT_PIXEL_MODE_MAX
	}
	
	[CRepr]
	public struct FT_Bitmap
	{
    	public uint32 rows;
    	public uint32 width;
    	public int32  pitch;
    	public uint8* buffer;
    	public uint16 num_grays;
    	public FT_Pixel_Mode  pixel_mode; // char8
    	public uint8  palette_mode;
    	public void*  palette;
	}

	[CRepr]
	public struct FT_Outline
	{
		public int16       n_contours;      /* number of contours in glyph        */
		public int16       n_points;        /* number of points in the glyph      */

		public FT_Vector*  points;          /* the outline's points               */
		public int8*       tags;            /* the points flags                   */
		public int16*      contours;        /* the contour end points             */

		public int         flags;           /* outline masks                      */
	}

	static
	{
		public const int16 FT_OUTLINE_CONTOURS_MAX = int16.MaxValue;
		public const int16 FT_OUTLINE_POINTS_MAX   = int16.MaxValue;
		
		// Todo: check whether or not int is an appropriate data type for these defines
		public const int FT_OUTLINE_NONE            = 0x0;
		public const int FT_OUTLINE_OWNER           = 0x1;
		public const int FT_OUTLINE_EVEN_ODD_FILL   = 0x2;
		public const int FT_OUTLINE_REVERSE_FILL    = 0x4;
		public const int FT_OUTLINE_IGNORE_DROPOUTS = 0x8;
		public const int FT_OUTLINE_SMART_DROPOUTS  = 0x10;
		public const int FT_OUTLINE_INCLUDE_STUBS   = 0x20;

		public const int FT_OUTLINE_HIGH_PRECISION  = 0x100;
		public const int FT_OUTLINE_SINGLE_PASS     = 0x200;

		public static int FT_CURVE_TAG(int flag)
		{
			return flag & 0x03;
		}

		public const int FT_CURVE_TAG_ON           = 0x01;
		public const int FT_CURVE_TAG_CONIC        = 0x00;
		public const int FT_CURVE_TAG_CUBIC        = 0x02;
			
		public const int FT_CURVE_TAG_HAS_SCANMODE = 0x04;

		public const int FT_CURVE_TAG_TOUCH_X      = 0x08;
		public const int FT_CURVE_TAG_TOUCH_Y      = 0x10;

		public const int FT_CURVE_TAG_TOUCH_BOTH = FT_CURVE_TAG_TOUCH_X | FT_CURVE_TAG_TOUCH_Y;

		public const int FT_Curve_Tag_On      = FT_CURVE_TAG_ON;
		public const int FT_Curve_Tag_Conic   = FT_CURVE_TAG_CONIC;
		public const int FT_Curve_Tag_Cubic   = FT_CURVE_TAG_CUBIC;
		public const int FT_Curve_Tag_Touch_X = FT_CURVE_TAG_TOUCH_X;
		public const int FT_Curve_Tag_Touch_Y = FT_CURVE_TAG_TOUCH_Y;
	}

	// Todo: finish

	public enum FT_Glyph_Format : uint32
	{
		FT_GLYPH_FORMAT_NONE = 0,
		FT_GLYPH_FORMAT_COMPOSITE = ((.)'c' << 24) | ((.)'o' << 16) | ((.)'m' << 8) | (.)'p',//'c', 'o', 'm', 'p',
		FT_GLYPH_FORMAT_BITMAP    = ((.)'b' << 24) | ((.)'i' << 16) | ((.)'t' << 8) | (.)'s',   //'b', 'i', 't', 's',
		FT_GLYPH_FORMAT_OUTLINE   = ((.)'o' << 24) | ((.)'u' << 16) | ((.)'t' << 8) | (.)'l',  //'o', 'u', 't', 'l',
		FT_GLYPH_FORMAT_PLOTTER   = ((.)'p' << 24) | ((.)'l' << 16) | ((.)'o' << 8) | (.)'t'  //'p', 'l', 'o', 't'
	}
}
