using System;
using System.Interop;

namespace FreeType
{
	public static class Fribidi
	{
		public typealias FriBidiLevel = int8;
		public typealias FriBidiChar = char32;
		public typealias FriBidiStrIndex = c_int;
		public typealias FriBidiParType = uint32;

		[CLink]
		public static extern FriBidiLevel fribidi_log2vis (
		  FriBidiChar* str,	/* input logical string */
		  FriBidiStrIndex len,	/* input string length */
		  FriBidiParType *pbase_dir,	/* requested and resolved paragraph
						 * base direction */
		  FriBidiChar *visual_str,	/* output visual string */
		  FriBidiStrIndex *positions_L_to_V,	/* output mapping from logical to 
							 * visual string positions */
		  FriBidiStrIndex *positions_V_to_L,	/* output mapping from visual string
							 * back to the logical string
							 * positions */
		  FriBidiLevel *embedding_levels	/* output list of embedding levels */
		);
	}
}