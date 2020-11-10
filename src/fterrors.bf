using System;

namespace FreeType
{
	static
	{
		/**
		 * Retrieve the description of a valid FreeType error code.
		 * @param error_code A valid FreeType error code.
		 * @returns A C string or NULL, if any error occurred.
		 *
		 * @remarks FreeType has to be compiled with FT_CONFIG_OPTION_ERROR_STRINGS or FT_DEBUG_LEVEL_ERROR to get meaningful descriptions. ‘error_string’ will be NULL otherwise.
		*/
		[CLink]
		public static extern char8* FT_Error_String(FT_Error error_code);
	}
}
