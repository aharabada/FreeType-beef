using System;
namespace FreeType
{
	[CRepr]
	public struct FT_SubGlyphRec
	{
		public FT_Int     index;
	    public FT_UShort  flags;
	    public FT_Int     arg1;
	    public FT_Int     arg2;
	    public FT_Matrix  transform;
	}

	[CRepr]
	public struct FT_GlyphLoadRec
	{
		public FT_Outline   outline;       /* outline                   */
		public FT_Vector*   extra_points;  /* extra points table        */
		public FT_Vector*   extra_points2; /* second extra points table */
		public FT_UInt      num_subglyphs; /* number of subglyphs       */
		public FT_SubGlyph  subglyphs;     /* subglyphs                 */
	}

	typealias FT_GlyphLoader = FT_GlyphLoaderRec*;

	[CRepr]
	public struct  FT_GlyphLoaderRec
	{
	  public FT_Memory        memory;
	  public FT_UInt          max_points;
	  public FT_UInt          max_contours;
	  public FT_UInt          max_subglyphs;
	  public FT_Bool          use_extra;

	  public FT_GlyphLoadRec  glyph_base;
	  public FT_GlyphLoadRec  current;

	  public void*            other;            /* for possible future extension? */

	}
}
