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

	public struct FT_Error : int32 // Todo: enum? // Todo: ErrorCode constants
	{
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
			strBuffer.Append(FreeType.FT_Error_String(this));
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
