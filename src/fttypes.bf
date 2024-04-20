using System;

namespace FreeType
{
	typealias FT_Bool = bool;
	typealias FT_FWord = int16;
	typealias FT_UFWord = uint16;
	typealias FT_Char = char8;
	typealias FT_Byte = uint8;
	typealias FT_Bytes = FT_Byte*;
	typealias FT_Tag = FT_UInt32;
	typealias FT_String = char8;
	typealias FT_Short = int16;
	typealias FT_UShort = uint16;
	typealias FT_Int = int32; // Todo: check
	typealias FT_UInt = uint32; // Todo: check
	typealias FT_Long = int32;
	typealias FT_ULong = uint32;
	typealias FT_F2Dot14 = int16;
	typealias FT_F26Dot6 = int32;

	typealias FT_Fixed = int32;

	public enum FT_Error : int32 // Todo: enum? // Todo: ErrorCode constants
	{
		case Ok = 0x00;
		case Cannot_Open_Resource = 0x01;
		case Unknown_File_Format = 0x02;
		case Invalid_File_Format = 0x03;
		case Invalid_Version = 0x04;
		case Lower_Module_Version = 0x05;
		case Invalid_Argument = 0x06;
		case Unimplemented_Feature = 0x07;
		case Invalid_Table = 0x08;
		case Invalid_Offset = 0x09;
		case Array_Too_Large = 0x0A;
		case Missing_Module = 0x0B;
		case Missing_Property = 0x0C;
	
			/* glyph/character errors */
	
		case Invalid_Glyph_Index = 0x10;
		case Invalid_Character_Code = 0x11;
		case Invalid_Glyph_Format = 0x12;
		case Cannot_Render_Glyph = 0x13;
		case Invalid_Outline = 0x14;
		case Invalid_Composite = 0x15;
		case Too_Many_Hints = 0x16;
		case Invalid_Pixel_Size = 0x17;
		case Invalid_SVG_Document = 0x18;
	
			/* handle errors */
	
		case Invalid_Handle = 0x20;
		case Invalid_Library_Handle = 0x21;
		case Invalid_Driver_Handle = 0x22;
		case Invalid_Face_Handle = 0x23;
		case Invalid_Size_Handle = 0x24;
		case Invalid_Slot_Handle = 0x25;
		case Invalid_CharMap_Handle = 0x26;
		case Invalid_Cache_Handle = 0x27;
		case Invalid_Stream_Handle = 0x28;
	
			/* driver errors */
	
		case Too_Many_Drivers = 0x30;
		case Too_Many_Extensions = 0x31;
	
			/* memory errors */
	
		case Out_Of_Memory = 0x40;
		case Unlisted_Object = 0x41;
	
			/* stream errors */
	
		case Cannot_Open_Stream = 0x51;
		case Invalid_Stream_Seek = 0x52;
		case Invalid_Stream_Skip = 0x53;
		case Invalid_Stream_Read = 0x54;
		case Invalid_Stream_Operation = 0x55;
		case Invalid_Frame_Operation = 0x56;
		case Nested_Frame_Access = 0x57;
		case Invalid_Frame_Read = 0x58;
	
			/* raster errors */
	
		case Raster_Uninitialized = 0x60;
		case Raster_Corrupted = 0x61;
		case Raster_Overflow = 0x62;
		case Raster_Negative_Height = 0x63;
	
			/* cache errors */
	
		case Too_Many_Caches = 0x70;
	
			/* TrueType and SFNT errors */
	
		case Invalid_Opcode = 0x80;
		case Too_Few_Arguments = 0x81;
		case Stack_Overflow = 0x82;
		case Code_Overflow = 0x83;
		case Bad_Argument = 0x84;
		case Divide_By_Zero = 0x85;
		case Invalid_Reference = 0x86;
		case Debug_OpCode = 0x87;
		case ENDF_In_Exec_Stream = 0x88;
		case Nested_DEFS = 0x89;
		case Invalid_CodeRange = 0x8A;
		case Execution_Too_Long = 0x8B;
		case Too_Many_Function_Defs = 0x8C;
		case Too_Many_Instruction_Defs = 0x8D;
		case Table_Missing = 0x8E;
		case Horiz_Header_Missing = 0x8F;
		case Locations_Missing = 0x90;
		case Name_Table_Missing = 0x91;
		case CMap_Table_Missing = 0x92;
		case Hmtx_Table_Missing = 0x93;
		case Post_Table_Missing = 0x94;
		case Invalid_Horiz_Metrics = 0x95;
		case Invalid_CharMap_Format = 0x96;
		case Invalid_PPem = 0x97;
		case Invalid_Vert_Metrics = 0x98;
		case Could_Not_Find_Context = 0x99;
		case Invalid_Post_Table_Format = 0x9A;
		case Invalid_Post_Table = 0x9B;
		case DEF_In_Glyf_Bytecode = 0x9C;
		case Missing_Bitmap = 0x9D;
		case Missing_SVG_Hooks = 0x9E;
	
			/* CFF, CID, and Type 1 errors */
	
		case Syntax_Error = 0xA0;
		case Stack_Underflow = 0xA1;
		case Ignore = 0xA2;
		case No_Unicode_Glyph_Name = 0xA3;
		case Glyph_Too_Big = 0xA4;
	
			/* BDF errors */
	
		case Missing_Startfont_Field = 0xB0;
		case Missing_Font_Field = 0xB1;
		case Missing_Size_Field = 0xB2;
		case Missing_Fontboundingbox_Field = 0xB3;
		case Missing_Chars_Field = 0xB4;
		case Missing_Startchar_Field = 0xB5;
		case Missing_Encoding_Field = 0xB6;
		case Missing_Bbx_Field = 0xB7;
		case Bbx_Too_Big = 0xB8;
		case Corrupted_Font_Header = 0xB9;
		case Corrupted_Font_Glyphs = 0xBA;
	
		public bool Success => this == 0;
		public bool Error => this != 0;

		/**
		 * Returns true, if this freetype error code represents an error.
		*/
		[Inline]
		public static implicit operator bool(this FT_Error error)
		{
			return error.[Inline]Error;
		}

		public override void ToString(String strBuffer)
		{
			// Todo: check if error strings are activated
			strBuffer.Append(FreeType.Error_String(this) ?? "Unknown");
		}
	}

	typealias FT_Pointer = void*;
	typealias FT_Offset = uint;
	typealias FT_PtrDist = int;
	
	[CRepr]
	public struct FT_UnitVector
	{
		public FT_F2Dot14 x;
		public FT_F2Dot14 y;
	}

	[CRepr]
	public struct FT_Matrix
	{
		public FT_Fixed xx, xy;
		public FT_Fixed yx, yy;
	}

	[CRepr]
	public struct FT_Data
	{
		public FT_Byte* pointer;
		public FT_Int   length;
	}

	typealias FT_Generic_Finalizer = function void (void* object); // Todo: check
	
	[CRepr]
	public struct FT_Generic
	{
		public void* 				data;
		public void* finalizer; //FT_Generic_Finalizer
	}

	typealias FT_ListNode = FT_ListNodeRec*;

	typealias FT_List = FT_ListRec*;
	
	[CRepr]
	public struct FT_ListNodeRec
	{
		public FT_ListNode prev;
		public FT_ListNode next;
		public void*	   data;
	}
	
	[CRepr]
	public struct FT_ListRec
	{
		public FT_ListNode head;
		public FT_ListNode tail;
	}


	static
	{
		typealias FT_Int16 = int16;
		typealias FT_UInt16 = uint16;
		typealias FT_Int32 = int32;
		typealias FT_UInt32 = uint32;
		typealias FT_Int64 = int64;
		typealias FT_UInt64 = uint64;

		typealias FT_DebugHook_Func = function void(void* arg) ;
	}
}
