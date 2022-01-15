#pragma warning disable 168
using System;
using System.Interop;

namespace FreeType
{
	static class HarfBuzz
	{
		// hb-common.h



		public typealias hb_bool_t = c_int;
		public typealias hb_codepoint_t = uint32;
		public typealias hb_position_t = int32;
		public typealias hb_mask_t = uint32;
		
		[Union, CRepr]
		public struct hb_var_int_t
		{
			public uint32 u32;
			public int32 i32;
			public uint16[2] u16;
			public int16[2] i16;
			public uint8[4] u8;
			public int8[4] i8;
		}

		public typealias hb_tag_t = uint32;

		public static uint32 HB_TAG(char8 c1, char8 c2, char8 c3, char8 c4)
		{
			return ((hb_tag_t)((((uint32)(c1)&0xFF)<<24)|(((uint32)(c2)&0xFF)<<16)|(((uint32)(c3)&0xFF)<<8)|((uint32)(c4)&0xFF)));
		}

		// TODO: HB_UNTAG

		public const hb_tag_t HB_TAG_NONE = HB_TAG(0,0,0,0);
		public const hb_tag_t HB_TAG_MAX = HB_TAG((char8)0xFf,(char8)0xff,(char8)0xff,(char8)0xff);
		public const hb_tag_t HB_TAG_MAX_SIGNED = HB_TAG((char8)0x7f,(char8)0xff,(char8)0xff,(char8)0xff);
		
		[CLink]
		public static extern hb_tag_t hb_tag_from_string(char8* str, c_int len);

		[CLink]
		public static extern hb_tag_t hb_tag_to_string(hb_tag_t tag, char8* buf);

		public enum hb_direction_t : uint32
		{
		  HB_DIRECTION_INVALID = 0,
		  HB_DIRECTION_LTR = 4,
		  HB_DIRECTION_RTL,
		  HB_DIRECTION_TTB,
		  HB_DIRECTION_BTT
		};

		[CLink]
		public static extern hb_direction_t hb_direction_from_string(char8* str, c_int len);
		
		[CLink]
		public static extern char8* hb_direction_to_string(hb_direction_t direction);

		public static bool HB_DIRECTION_IS_VALID(hb_direction_t dir)
		{
			return ((((uint32)dir) & ~3U) == 4);
		}
		
		public static bool HB_DIRECTION_IS_HORIZONTAL(hb_direction_t dir)
		{
			return ((((uint32)dir) & ~1U) == 4);
		}
		
		public static bool HB_DIRECTION_IS_FORWARD(hb_direction_t dir)
		{
			return ((((uint32)dir) & ~2U) == 4);
		}
		
		public static bool HB_DIRECTION_IS_BACKWARD(hb_direction_t dir)
		{
			return ((((uint32)dir) & ~2U) == 5);
		}
		
		public static hb_direction_t HB_DIRECTION_REVERSE(hb_direction_t dir)
		{
			return (hb_direction_t)(((uint32)dir) ^ 1);
		}

		public struct hb_language_impl_t;

		public typealias hb_language_t = hb_language_impl_t*;
		
		[CLink]
		public static extern hb_language_t hb_language_from_string(char8* str, c_int len);
		
		[CLink]
		public static extern char8* hb_language_to_string(hb_language_t language);

		public const hb_language_t HB_LANGUAGE_INVALID = null;

		[CLink]
		public static extern hb_language_t hb_language_get_default();

		
		public enum hb_script_t : uint32
		{
			case HB_SCRIPT_COMMON			= HB_TAG ('Z','y','y','y'); /*1.1*/
			case HB_SCRIPT_INHERITED			= HB_TAG ('Z','i','n','h'); /*1.1*/
			case HB_SCRIPT_UNKNOWN			= HB_TAG ('Z','z','z','z'); /*5.0*/
	
			case HB_SCRIPT_ARABIC			= HB_TAG ('A','r','a','b'); /*1.1*/
			case HB_SCRIPT_ARMENIAN			= HB_TAG ('A','r','m','n'); /*1.1*/
			case HB_SCRIPT_BENGALI			= HB_TAG ('B','e','n','g'); /*1.1*/
			case HB_SCRIPT_CYRILLIC			= HB_TAG ('C','y','r','l'); /*1.1*/
			case HB_SCRIPT_DEVANAGARI			= HB_TAG ('D','e','v','a'); /*1.1*/
			case HB_SCRIPT_GEORGIAN			= HB_TAG ('G','e','o','r'); /*1.1*/
			case HB_SCRIPT_GREEK			= HB_TAG ('G','r','e','k'); /*1.1*/
			case HB_SCRIPT_GUJARATI			= HB_TAG ('G','u','j','r'); /*1.1*/
			case HB_SCRIPT_GURMUKHI			= HB_TAG ('G','u','r','u'); /*1.1*/
			case HB_SCRIPT_HANGUL			= HB_TAG ('H','a','n','g'); /*1.1*/
			case HB_SCRIPT_HAN				= HB_TAG ('H','a','n','i'); /*1.1*/
			case HB_SCRIPT_HEBREW			= HB_TAG ('H','e','b','r'); /*1.1*/
			case HB_SCRIPT_HIRAGANA			= HB_TAG ('H','i','r','a'); /*1.1*/
			case HB_SCRIPT_KANNADA			= HB_TAG ('K','n','d','a'); /*1.1*/
			case HB_SCRIPT_KATAKANA			= HB_TAG ('K','a','n','a'); /*1.1*/
			case HB_SCRIPT_LAO				= HB_TAG ('L','a','o','o'); /*1.1*/
			case HB_SCRIPT_LATIN			= HB_TAG ('L','a','t','n'); /*1.1*/
			case HB_SCRIPT_MALAYALAM			= HB_TAG ('M','l','y','m'); /*1.1*/
			case HB_SCRIPT_ORIYA			= HB_TAG ('O','r','y','a'); /*1.1*/
			case HB_SCRIPT_TAMIL			= HB_TAG ('T','a','m','l'); /*1.1*/
			case HB_SCRIPT_TELUGU			= HB_TAG ('T','e','l','u'); /*1.1*/
			case HB_SCRIPT_THAI			= HB_TAG ('T','h','a','i'); /*1.1*/
	
			case HB_SCRIPT_TIBETAN			= HB_TAG ('T','i','b','t'); /*2.0*/
	
			case HB_SCRIPT_BOPOMOFO			= HB_TAG ('B','o','p','o'); /*3.0*/
			case HB_SCRIPT_BRAILLE			= HB_TAG ('B','r','a','i'); /*3.0*/
			case HB_SCRIPT_CANADIAN_SYLLABICS		= HB_TAG ('C','a','n','s'); /*3.0*/
			case HB_SCRIPT_CHEROKEE			= HB_TAG ('C','h','e','r'); /*3.0*/
			case HB_SCRIPT_ETHIOPIC			= HB_TAG ('E','t','h','i'); /*3.0*/
			case HB_SCRIPT_KHMER			= HB_TAG ('K','h','m','r'); /*3.0*/
			case HB_SCRIPT_MONGOLIAN			= HB_TAG ('M','o','n','g'); /*3.0*/
			case HB_SCRIPT_MYANMAR			= HB_TAG ('M','y','m','r'); /*3.0*/
			case HB_SCRIPT_OGHAM			= HB_TAG ('O','g','a','m'); /*3.0*/
			case HB_SCRIPT_RUNIC			= HB_TAG ('R','u','n','r'); /*3.0*/
			case HB_SCRIPT_SINHALA			= HB_TAG ('S','i','n','h'); /*3.0*/
			case HB_SCRIPT_SYRIAC			= HB_TAG ('S','y','r','c'); /*3.0*/
			case HB_SCRIPT_THAANA			= HB_TAG ('T','h','a','a'); /*3.0*/
			case HB_SCRIPT_YI				= HB_TAG ('Y','i','i','i'); /*3.0*/
	
			case HB_SCRIPT_DESERET			= HB_TAG ('D','s','r','t'); /*3.1*/
			case HB_SCRIPT_GOTHIC			= HB_TAG ('G','o','t','h'); /*3.1*/
			case HB_SCRIPT_OLD_ITALIC			= HB_TAG ('I','t','a','l'); /*3.1*/
	
			case HB_SCRIPT_BUHID			= HB_TAG ('B','u','h','d'); /*3.2*/
			case HB_SCRIPT_HANUNOO			= HB_TAG ('H','a','n','o'); /*3.2*/
			case HB_SCRIPT_TAGALOG			= HB_TAG ('T','g','l','g'); /*3.2*/
			case HB_SCRIPT_TAGBANWA			= HB_TAG ('T','a','g','b'); /*3.2*/
	
			case HB_SCRIPT_CYPRIOT			= HB_TAG ('C','p','r','t'); /*4.0*/
			case HB_SCRIPT_LIMBU			= HB_TAG ('L','i','m','b'); /*4.0*/
			case HB_SCRIPT_LINEAR_B			= HB_TAG ('L','i','n','b'); /*4.0*/
			case HB_SCRIPT_OSMANYA			= HB_TAG ('O','s','m','a'); /*4.0*/
			case HB_SCRIPT_SHAVIAN			= HB_TAG ('S','h','a','w'); /*4.0*/
			case HB_SCRIPT_TAI_LE			= HB_TAG ('T','a','l','e'); /*4.0*/
			case HB_SCRIPT_UGARITIC			= HB_TAG ('U','g','a','r'); /*4.0*/
	
			case HB_SCRIPT_BUGINESE			= HB_TAG ('B','u','g','i'); /*4.1*/
			case HB_SCRIPT_COPTIC			= HB_TAG ('C','o','p','t'); /*4.1*/
			case HB_SCRIPT_GLAGOLITIC			= HB_TAG ('G','l','a','g'); /*4.1*/
			case HB_SCRIPT_KHAROSHTHI			= HB_TAG ('K','h','a','r'); /*4.1*/
			case HB_SCRIPT_NEW_TAI_LUE			= HB_TAG ('T','a','l','u'); /*4.1*/
			case HB_SCRIPT_OLD_PERSIAN			= HB_TAG ('X','p','e','o'); /*4.1*/
			case HB_SCRIPT_SYLOTI_NAGRI		= HB_TAG ('S','y','l','o'); /*4.1*/
			case HB_SCRIPT_TIFINAGH			= HB_TAG ('T','f','n','g'); /*4.1*/
	
			case HB_SCRIPT_BALINESE			= HB_TAG ('B','a','l','i'); /*5.0*/
			case HB_SCRIPT_CUNEIFORM			= HB_TAG ('X','s','u','x'); /*5.0*/
			case HB_SCRIPT_NKO				= HB_TAG ('N','k','o','o'); /*5.0*/
			case HB_SCRIPT_PHAGS_PA			= HB_TAG ('P','h','a','g'); /*5.0*/
			case HB_SCRIPT_PHOENICIAN			= HB_TAG ('P','h','n','x'); /*5.0*/
	
			case HB_SCRIPT_CARIAN			= HB_TAG ('C','a','r','i'); /*5.1*/
			case HB_SCRIPT_CHAM			= HB_TAG ('C','h','a','m'); /*5.1*/
			case HB_SCRIPT_KAYAH_LI			= HB_TAG ('K','a','l','i'); /*5.1*/
			case HB_SCRIPT_LEPCHA			= HB_TAG ('L','e','p','c'); /*5.1*/
			case HB_SCRIPT_LYCIAN			= HB_TAG ('L','y','c','i'); /*5.1*/
			case HB_SCRIPT_LYDIAN			= HB_TAG ('L','y','d','i'); /*5.1*/
			case HB_SCRIPT_OL_CHIKI			= HB_TAG ('O','l','c','k'); /*5.1*/
			case HB_SCRIPT_REJANG			= HB_TAG ('R','j','n','g'); /*5.1*/
			case HB_SCRIPT_SAURASHTRA			= HB_TAG ('S','a','u','r'); /*5.1*/
			case HB_SCRIPT_SUNDANESE			= HB_TAG ('S','u','n','d'); /*5.1*/
			case HB_SCRIPT_VAI				= HB_TAG ('V','a','i','i'); /*5.1*/
	
			case HB_SCRIPT_AVESTAN			= HB_TAG ('A','v','s','t'); /*5.2*/
			case HB_SCRIPT_BAMUM			= HB_TAG ('B','a','m','u'); /*5.2*/
			case HB_SCRIPT_EGYPTIAN_HIEROGLYPHS	= HB_TAG ('E','g','y','p'); /*5.2*/
			case HB_SCRIPT_IMPERIAL_ARAMAIC		= HB_TAG ('A','r','m','i'); /*5.2*/
			case HB_SCRIPT_INSCRIPTIONAL_PAHLAVI	= HB_TAG ('P','h','l','i'); /*5.2*/
			case HB_SCRIPT_INSCRIPTIONAL_PARTHIAN	= HB_TAG ('P','r','t','i'); /*5.2*/
			case HB_SCRIPT_JAVANESE			= HB_TAG ('J','a','v','a'); /*5.2*/
			case HB_SCRIPT_KAITHI			= HB_TAG ('K','t','h','i'); /*5.2*/
			case HB_SCRIPT_LISU			= HB_TAG ('L','i','s','u'); /*5.2*/
			case HB_SCRIPT_MEETEI_MAYEK		= HB_TAG ('M','t','e','i'); /*5.2*/
			case HB_SCRIPT_OLD_SOUTH_ARABIAN		= HB_TAG ('S','a','r','b'); /*5.2*/
			case HB_SCRIPT_OLD_TURKIC			= HB_TAG ('O','r','k','h'); /*5.2*/
			case HB_SCRIPT_SAMARITAN			= HB_TAG ('S','a','m','r'); /*5.2*/
			case HB_SCRIPT_TAI_THAM			= HB_TAG ('L','a','n','a'); /*5.2*/
			case HB_SCRIPT_TAI_VIET			= HB_TAG ('T','a','v','t'); /*5.2*/
	
			case HB_SCRIPT_BATAK			= HB_TAG ('B','a','t','k'); /*6.0*/
			case HB_SCRIPT_BRAHMI			= HB_TAG ('B','r','a','h'); /*6.0*/
			case HB_SCRIPT_MANDAIC			= HB_TAG ('M','a','n','d'); /*6.0*/
	
			case HB_SCRIPT_CHAKMA			= HB_TAG ('C','a','k','m'); /*6.1*/
			case HB_SCRIPT_MEROITIC_CURSIVE		= HB_TAG ('M','e','r','c'); /*6.1*/
			case HB_SCRIPT_MEROITIC_HIEROGLYPHS	= HB_TAG ('M','e','r','o'); /*6.1*/
			case HB_SCRIPT_MIAO			= HB_TAG ('P','l','r','d'); /*6.1*/
			case HB_SCRIPT_SHARADA			= HB_TAG ('S','h','r','d'); /*6.1*/
			case HB_SCRIPT_SORA_SOMPENG		= HB_TAG ('S','o','r','a'); /*6.1*/
			case HB_SCRIPT_TAKRI			= HB_TAG ('T','a','k','r'); /*6.1*/
	
				/*
				* Since: 0.9.30
				*/
			case HB_SCRIPT_BASSA_VAH			= HB_TAG ('B','a','s','s'); /*7.0*/
			case HB_SCRIPT_CAUCASIAN_ALBANIAN		= HB_TAG ('A','g','h','b'); /*7.0*/
			case HB_SCRIPT_DUPLOYAN			= HB_TAG ('D','u','p','l'); /*7.0*/
			case HB_SCRIPT_ELBASAN			= HB_TAG ('E','l','b','a'); /*7.0*/
			case HB_SCRIPT_GRANTHA			= HB_TAG ('G','r','a','n'); /*7.0*/
			case HB_SCRIPT_KHOJKI			= HB_TAG ('K','h','o','j'); /*7.0*/
			case HB_SCRIPT_KHUDAWADI			= HB_TAG ('S','i','n','d'); /*7.0*/
			case HB_SCRIPT_LINEAR_A			= HB_TAG ('L','i','n','a'); /*7.0*/
			case HB_SCRIPT_MAHAJANI			= HB_TAG ('M','a','h','j'); /*7.0*/
			case HB_SCRIPT_MANICHAEAN			= HB_TAG ('M','a','n','i'); /*7.0*/
			case HB_SCRIPT_MENDE_KIKAKUI		= HB_TAG ('M','e','n','d'); /*7.0*/
			case HB_SCRIPT_MODI			= HB_TAG ('M','o','d','i'); /*7.0*/
			case HB_SCRIPT_MRO				= HB_TAG ('M','r','o','o'); /*7.0*/
			case HB_SCRIPT_NABATAEAN			= HB_TAG ('N','b','a','t'); /*7.0*/
			case HB_SCRIPT_OLD_NORTH_ARABIAN		= HB_TAG ('N','a','r','b'); /*7.0*/
			case HB_SCRIPT_OLD_PERMIC			= HB_TAG ('P','e','r','m'); /*7.0*/
			case HB_SCRIPT_PAHAWH_HMONG		= HB_TAG ('H','m','n','g'); /*7.0*/
			case HB_SCRIPT_PALMYRENE			= HB_TAG ('P','a','l','m'); /*7.0*/
			case HB_SCRIPT_PAU_CIN_HAU			= HB_TAG ('P','a','u','c'); /*7.0*/
			case HB_SCRIPT_PSALTER_PAHLAVI		= HB_TAG ('P','h','l','p'); /*7.0*/
			case HB_SCRIPT_SIDDHAM			= HB_TAG ('S','i','d','d'); /*7.0*/
			case HB_SCRIPT_TIRHUTA			= HB_TAG ('T','i','r','h'); /*7.0*/
			case HB_SCRIPT_WARANG_CITI			= HB_TAG ('W','a','r','a'); /*7.0*/
	
			case HB_SCRIPT_AHOM			= HB_TAG ('A','h','o','m'); /*8.0*/
			case HB_SCRIPT_ANATOLIAN_HIEROGLYPHS	= HB_TAG ('H','l','u','w'); /*8.0*/
			case HB_SCRIPT_HATRAN			= HB_TAG ('H','a','t','r'); /*8.0*/
			case HB_SCRIPT_MULTANI			= HB_TAG ('M','u','l','t'); /*8.0*/
			case HB_SCRIPT_OLD_HUNGARIAN		= HB_TAG ('H','u','n','g'); /*8.0*/
			case HB_SCRIPT_SIGNWRITING			= HB_TAG ('S','g','n','w'); /*8.0*/
	
				/*
				* Since 1.3.0
				*/
			case HB_SCRIPT_ADLAM			= HB_TAG ('A','d','l','m'); /*9.0*/
			case HB_SCRIPT_BHAIKSUKI			= HB_TAG ('B','h','k','s'); /*9.0*/
			case HB_SCRIPT_MARCHEN			= HB_TAG ('M','a','r','c'); /*9.0*/
			case HB_SCRIPT_OSAGE			= HB_TAG ('O','s','g','e'); /*9.0*/
			case HB_SCRIPT_TANGUT			= HB_TAG ('T','a','n','g'); /*9.0*/
			case HB_SCRIPT_NEWA			= HB_TAG ('N','e','w','a'); /*9.0*/
	
				/*
				* Since 1.6.0
				*/
			case HB_SCRIPT_MASARAM_GONDI		= HB_TAG ('G','o','n','m'); /*10.0*/
			case HB_SCRIPT_NUSHU			= HB_TAG ('N','s','h','u'); /*10.0*/
			case HB_SCRIPT_SOYOMBO			= HB_TAG ('S','o','y','o'); /*10.0*/
			case HB_SCRIPT_ZANABAZAR_SQUARE		= HB_TAG ('Z','a','n','b'); /*10.0*/
	
				/*
				* Since 1.8.0
				*/
			case HB_SCRIPT_DOGRA			= HB_TAG ('D','o','g','r'); /*11.0*/
			case HB_SCRIPT_GUNJALA_GONDI		= HB_TAG ('G','o','n','g'); /*11.0*/
			case HB_SCRIPT_HANIFI_ROHINGYA		= HB_TAG ('R','o','h','g'); /*11.0*/
			case HB_SCRIPT_MAKASAR			= HB_TAG ('M','a','k','a'); /*11.0*/
			case HB_SCRIPT_MEDEFAIDRIN			= HB_TAG ('M','e','d','f'); /*11.0*/
			case HB_SCRIPT_OLD_SOGDIAN			= HB_TAG ('S','o','g','o'); /*11.0*/
			case HB_SCRIPT_SOGDIAN			= HB_TAG ('S','o','g','d'); /*11.0*/
	
				/*
				* Since 2.4.0
				*/
			case HB_SCRIPT_ELYMAIC			= HB_TAG ('E','l','y','m'); /*12.0*/
			case HB_SCRIPT_NANDINAGARI			= HB_TAG ('N','a','n','d'); /*12.0*/
			case HB_SCRIPT_NYIAKENG_PUACHUE_HMONG	= HB_TAG ('H','m','n','p'); /*12.0*/
			case HB_SCRIPT_WANCHO			= HB_TAG ('W','c','h','o'); /*12.0*/
	
				/*
				* Since 2.6.7
				*/
			case HB_SCRIPT_CHORASMIAN			= HB_TAG ('C','h','r','s'); /*13.0*/
			case HB_SCRIPT_DIVES_AKURU			= HB_TAG ('D','i','a','k'); /*13.0*/
			case HB_SCRIPT_KHITAN_SMALL_SCRIPT		= HB_TAG ('K','i','t','s'); /*13.0*/
			case HB_SCRIPT_YEZIDI			= HB_TAG ('Y','e','z','i'); /*13.0*/
	
				/*
				* Since 3.0.0
				*/
			case HB_SCRIPT_CYPRO_MINOAN		= HB_TAG ('C','p','m','n'); /*14.0*/
			case HB_SCRIPT_OLD_UYGHUR			= HB_TAG ('O','u','g','r'); /*14.0*/
			case HB_SCRIPT_TANGSA			= HB_TAG ('T','n','s','a'); /*14.0*/
			case HB_SCRIPT_TOTO			= HB_TAG ('T','o','t','o'); /*14.0*/
			case HB_SCRIPT_VITHKUQI			= HB_TAG ('V','i','t','h'); /*14.0*/
	
				/* No script set. */
			case HB_SCRIPT_INVALID			= HB_TAG_NONE;
	
			/*< private >*/

			/* Dummy values to ensure any HB_TAG_t value can be passed/stored as case HB_script_t
			* without risking undefined behavior.  We have two, for historical reasons.
			* HB_TAG_MAX used to be unsigned, but that was invalid Ansi C, so was changed
			* to _case HB_SCRIPT_MAX_VALUE to be equal to HB_TAG_MAX_SIGNED as well.
			*
			* See this thread for technicalities:
			*
			*   https://lists.freedesktop.org/archives/harfbuzz/2014-March/004150.html
			*/
			case _HB_SCRIPT_MAX_VALUE				= HB_TAG_MAX_SIGNED; /*< skip >*/
			case _HB_SCRIPT_MAX_VALUE_SIGNED			= HB_TAG_MAX_SIGNED; /*< skip >*/	
		}

		[CLink]
		public static extern hb_script_t hb_script_from_iso15924_tag(hb_tag_t tag);
		
		[CLink]
		public static extern hb_script_t hb_script_from_string(c_char* str, c_int len);
		
		[CLink]
		public static extern hb_script_t hb_script_to_iso15924_tag(hb_script_t script);

		[CLink]
		public static extern hb_direction_t hb_script_get_horizontal_direction(hb_script_t script);

		[CRepr]
		public struct hb_user_data_key_t
		{
		  /*< private >*/
		  private char8 unused;
		}

		public typealias hb_destroy_func_t = function void(void* user_data);

		public const c_uint HB_FEATURE_GLOBAL_START = 0;

		public const c_uint HB_FEATURE_GLOBAL_END = ((c_uint)-1);

		[CRepr]
		public struct hb_feature_t
		{
			public hb_tag_t tag;
			public uint32 value;
			public c_uint start;
			public c_uint end;
		}

		[CLink]
		public static extern hb_bool_t hb_feature_from_string(c_char* str, c_int len, hb_feature_t* feature);

		[CLink]
		public static extern void hb_feature_to_string(hb_feature_t *feature, c_char* buf, c_uint size);

		public struct hb_variation_t
		{
			public hb_tag_t tag;
			public float value;
		}

		[CLink]
		public static extern hb_bool_t hb_variation_from_string(c_char *str, c_int len, hb_variation_t* variation);

		[CLink]
		public static extern void hb_variation_to_string(hb_variation_t* variation, c_char* buf, c_uint size);

		public typealias hb_color_t = uint32;

		public static hb_color_t HB_COLOR(uint8 r, uint8 g, uint8 b, uint8 a)
		{
			return (hb_color_t) HB_TAG ((.)b,(.)g,(.)r,(.)a);
		}

		[CLink]
		public static extern uint8 hb_color_get_alpha(hb_color_t color);

		[CLink]
		public static extern uint8 hb_color_get_red(hb_color_t color);

		[CLink]
		public static extern uint8 hb_color_get_green(hb_color_t color);

		[CLink]
		public static extern uint8 hb_color_get_blue(hb_color_t color);



		// hb-blob.h TODO!!!



		public enum hb_memory_mode_t
		{
			HB_MEMORY_MODE_DUPLICATE,
			HB_MEMORY_MODE_READONLY,
			HB_MEMORY_MODE_WRITABLE,
			HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE
		}

		public struct hb_blob_t;
		
		[CLink]
		public static extern hb_blob_t* hb_blob_create(uint8* data, uint32 length, hb_memory_mode_t mode, void* user_data, hb_destroy_func_t destroy);
		
		[CLink]
		public static extern hb_blob_t* hb_blob_create_or_fail(uint8* data, uint32 length, hb_memory_mode_t mode, void* user_data, hb_destroy_func_t destroy);

		[CLink]
		public static extern hb_blob_t* hb_blob_create_from_file(char8* file_name);

		[CLink]
		public static extern hb_blob_t* hb_blob_create_from_file_or_fail(char8* file_name);

		[CLink]
		public static extern void hb_blob_destroy(hb_blob_t* blob);



		// hb-buffer.h // TODO!!!



		public struct hb_buffer_t;

		[CLink]
		public static extern hb_buffer_t* hb_buffer_create();

		[CLink]
		public static extern void hb_buffer_add_utf8(hb_buffer_t* buffer, [MangleConst]char8* text, int32 text_length, uint32 item_offset, int32 item_length);
		
		[CLink]
		public static extern void hb_buffer_add_utf16(hb_buffer_t* buffer, [MangleConst]char16* text, int32 text_length, uint32 item_offset, int32 item_length);
		
		[CLink]
		public static extern void hb_buffer_add_utf32(hb_buffer_t* buffer, [MangleConst]char32* text, int32 text_length, uint32 item_offset, int32 item_length);

		[CLink]
		public static extern void hb_buffer_set_direction(hb_buffer_t* buffer, hb_direction_t direction);
		
		[CLink]
		public static extern void hb_buffer_set_script(hb_buffer_t* buffer, hb_script_t  script);

		[CLink]
		public static extern void hb_buffer_set_language(hb_buffer_t* buffer, hb_language_t language);

		[CLink]
		public static extern void hb_buffer_clear_contents(hb_buffer_t* buffer);
		
		public struct hb_face_t;

		[CLink]
		public static extern hb_face_t* hb_face_create(hb_blob_t* blob, uint32 index);
		
		public struct hb_font_t;
		
		[CLink]
		public static extern hb_font_t* hb_font_create(hb_face_t* face);

		[CLink]
		public static extern void hb_shape(hb_font_t* font, hb_buffer_t* buffer, [MangleConst]hb_feature_t* features, uint32 num_features);

		/*
		typedef struct hb_glyph_info_t {
		  hb_codepoint_t codepoint;
		  /*< private >*/
		  hb_mask_t      mask;
		  /*< public >*/
		  uint32_t       cluster;

		  /*< private >*/
		  hb_var_int_t   var1;
		  hb_var_int_t   var2;
		} hb_glyph_info_t;
		*/

		[CRepr]
		public struct hb_glyph_info_t
		{
		  public hb_codepoint_t codepoint;
		  /*< private >*/
		  private hb_mask_t      mask;
		  /*< public >*/
		  public uint32       cluster;
		
		  /*< private >*/
		  private hb_var_int_t   var1;
		  private hb_var_int_t   var2;
		};

		[CLink]
		public static extern hb_glyph_info_t* hb_buffer_get_glyph_infos(hb_buffer_t* buffer, uint32* length);

		[CRepr]
		public struct hb_glyph_position_t
		{
		  public hb_position_t  x_advance;
		  public hb_position_t  y_advance;
		  public hb_position_t  x_offset;
		  public hb_position_t  y_offset;

		  /*< private >*/
		  private hb_var_int_t @var;
		}

		[CLink]
		public static extern hb_glyph_position_t* hb_buffer_get_glyph_positions(hb_buffer_t* buffer, uint32* length);
		
		[CLink]
		public static extern void hb_buffer_destroy(hb_buffer_t* buffer);

		[CLink]
		public static extern void hb_font_destroy(hb_font_t* font);
		
		[CLink]
		public static extern void hb_face_destroy(hb_face_t* face);
		
		[CLink]
		public static extern void hb_font_set_scale(hb_font_t* font, int32 x_scale, int y_scale);

		[CLink]
		public static extern void hb_font_get_scale(hb_font_t* font, out int32 x_scale, out int32 y_scale);
		
		[CLink]
		public static extern hb_font_t* hb_ft_font_create_referenced(FT_Face ft_face);

		public static void Test()
		{
			String str = "Hallo";
			String filename = "C:\\Windows\\Fonts\\arial.ttf";
			
			// 1. Create a buffer and put your text in it:

			/*
			#include <hb.h>
 
			hb_buffer_t *buf;
			buf = hb_buffer_create();
			hb_buffer_add_utf8(buf, text, -1, 0, -1);
			*/
			hb_buffer_t *buf;
			buf = hb_buffer_create();
			hb_buffer_add_utf8(buf, str.CStr(), -1, 0, -1);

			// 2. Set the script, language and direction of the buffer.
			/*
			hb_buffer_set_direction(buf, HB_DIRECTION_LTR);
			hb_buffer_set_script(buf, HB_SCRIPT_LATIN);
			hb_buffer_set_language(buf, hb_language_from_string("en", -1));
			*/
			hb_buffer_set_direction(buf, .HB_DIRECTION_LTR);
			hb_buffer_set_script(buf, .HB_SCRIPT_LATIN);
			hb_buffer_set_language(buf, hb_language_from_string("en".CStr(), -1));

			// 3. Create a face and a font from a font file.
			/*
			hb_blob_t *blob = hb_blob_create_from_file(filename); /* or hb_blob_create_from_file_or_fail() */
			hb_face_t *face = hb_face_create(blob, 0);
			hb_font_t *font = hb_font_create(face);
			*/
			hb_blob_t* blob = hb_blob_create_from_file(filename.CStr()); /* or hb_blob_create_from_file_or_fail() */
			hb_face_t* face = hb_face_create(blob, 0);
			hb_font_t* font = hb_font_create(face);

			// 4. Shape:
			// hb_shape(font, buf, NULL, 0);
			hb_shape(font, buf, null, 0);

			// 5. Get the glyph and position information.
			/*
			unsigned int glyph_count;
			hb_glyph_info_t *glyph_info    = hb_buffer_get_glyph_infos(buf, &glyph_count);
			hb_glyph_position_t *glyph_pos = hb_buffer_get_glyph_positions(buf, &glyph_count);
			*/
			uint32 glyph_count = ?;
			hb_glyph_info_t* glyph_info    = hb_buffer_get_glyph_infos(buf, &glyph_count);
			hb_glyph_position_t* glyph_pos = hb_buffer_get_glyph_positions(buf, &glyph_count);

			// 6. Iterate over each glyph.
			/*
			hb_position_t cursor_x = 0;
			hb_position_t cursor_y = 0;
			for (unsigned int i = 0; i < glyph_count; i++) {
			    hb_codepoint_t glyphid  = glyph_info[i].codepoint;
			    hb_position_t x_offset  = glyph_pos[i].x_offset;
			    hb_position_t y_offset  = glyph_pos[i].y_offset;
			    hb_position_t x_advance = glyph_pos[i].x_advance;
			    hb_position_t y_advance = glyph_pos[i].y_advance;
			 /* draw_glyph(glyphid, cursor_x + x_offset, cursor_y + y_offset); */
			    cursor_x += x_advance;
			    cursor_y += y_advance;
			}
			*/
			hb_position_t cursor_x = 0;
			hb_position_t cursor_y = 0;
			for (uint32 i = 0; i < glyph_count; i++) {
			    hb_codepoint_t glyphid  = glyph_info[i].codepoint;
			    hb_position_t x_offset  = glyph_pos[i].x_offset;
			    hb_position_t y_offset  = glyph_pos[i].y_offset;
			    hb_position_t x_advance = glyph_pos[i].x_advance;
			    hb_position_t y_advance = glyph_pos[i].y_advance;
			 /* draw_glyph(glyphid, cursor_x + x_offset, cursor_y + y_offset); */
			    cursor_x += x_advance;
			    cursor_y += y_advance;
			}

			// 7. Tidy up.
			/*
			hb_buffer_destroy(buf);
			hb_font_destroy(font);
			hb_face_destroy(face);
			hb_blob_destroy(blob);
			*/
			hb_buffer_destroy(buf);
			hb_font_destroy(font);
			hb_face_destroy(face);
			hb_blob_destroy(blob);
		}

		public static void TestCompact()
		{
			String str = "Hallo";
			String filename = "C:\\Windows\\Fonts\\arial.ttf";

			// 1. Create a buffer and put your text in it:
			hb_buffer_t *buf;
			buf = hb_buffer_create();
			hb_buffer_add_utf8(buf, str.CStr(), -1, 0, -1);

			// 2. Set the script, language and direction of the buffer.
			hb_buffer_set_direction(buf, .HB_DIRECTION_LTR);
			hb_buffer_set_script(buf, .HB_SCRIPT_LATIN);
			hb_buffer_set_language(buf, hb_language_from_string("en".CStr(), -1));

			// 3. Create a face and a font from a font file.
			hb_blob_t* blob = hb_blob_create_from_file(filename.CStr()); /* or hb_blob_create_from_file_or_fail() */
			hb_face_t* face = hb_face_create(blob, 0);
			hb_font_t* font = hb_font_create(face);

			// 4. Shape:
			hb_shape(font, buf, null, 0);

			// 5. Get the glyph and position information.
			uint32 glyph_count = ?;
			hb_glyph_info_t* glyph_info    = hb_buffer_get_glyph_infos(buf, &glyph_count);
			hb_glyph_position_t* glyph_pos = hb_buffer_get_glyph_positions(buf, &glyph_count);

			// 6. Iterate over each glyph.
			hb_position_t cursor_x = 0;
			hb_position_t cursor_y = 0;
			for (uint32 i = 0; i < glyph_count; i++) {
			    hb_codepoint_t glyphid  = glyph_info[i].codepoint;
			    hb_position_t x_offset  = glyph_pos[i].x_offset;
			    hb_position_t y_offset  = glyph_pos[i].y_offset;
			    hb_position_t x_advance = glyph_pos[i].x_advance;
			    hb_position_t y_advance = glyph_pos[i].y_advance;
			 /* draw_glyph(glyphid, cursor_x + x_offset, cursor_y + y_offset); */
			    cursor_x += x_advance;
			    cursor_y += y_advance;
			}

			// 7. Tidy up.
			hb_buffer_destroy(buf);
			hb_font_destroy(font);
			hb_face_destroy(face);
			hb_blob_destroy(blob);
		}
	}
}