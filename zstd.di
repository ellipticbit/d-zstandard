module zstd;
nothrow:
@nogc:

// D import file generated from 'source\zstd.c'
extern (C)
{
	alias __uint16_t = ushort;
	alias __uint32_t = uint;
	alias __uint64_t = ulong;
	align alias uintptr_t = ulong;
	align alias va_list = char*;
	align void __va_start(char**, ...);
	alias size_t = ulong;
	alias ptrdiff_t = long;
	alias intptr_t = long;
	alias __vcrt_bool = bool;
	alias wchar_t = ushort;
	void __security_init_cookie();
	void __security_check_cookie(ulong _StackCookie);
	void __report_gsfailure(ulong _StackCookie);
	extern __gshared ulong __security_cookie;
	alias __crt_bool = bool;
	void _invalid_parameter_noinfo();
	void _invalid_parameter_noinfo_noreturn();
	void _invoke_watson(const(ushort)* _Expression, const(ushort)* _FunctionName, const(ushort)* _FileName, uint _LineNo, ulong _Reserved);
	alias errno_t = int;
	alias wint_t = ushort;
	alias wctype_t = ushort;
	alias __time32_t = int;
	alias __time64_t = long;
	struct __crt_locale_data_public
	{
		const(ushort)* _locale_pctype = void;
		int _locale_mb_cur_max = void;
		uint _locale_lc_codepage = void;
	}
	struct __crt_locale_pointers
	{
		__crt_locale_data* locinfo = void;
		__crt_multibyte_data* mbcinfo = void;
	}
	alias _locale_t = __crt_locale_pointers*;
	struct _Mbstatet
	{
		uint _Wchar = void;
		ushort _Byte = void;
		ushort _State = void;
	}
	struct _Mbstatet;
	alias mbstate_t = _Mbstatet;
	alias time_t = long;
	alias rsize_t = ulong;
	int* _errno();
	int _set_errno(int _Value);
	int _get_errno(int* _Value);
	extern uint __threadid();
	extern ulong __threadhandle();
	uint ZSTD_versionNumber();
	const(char)* ZSTD_versionString();
	ulong ZSTD_compress(void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, int compressionLevel);
	ulong ZSTD_decompress(void* dst, ulong dstCapacity, const(void)* src, ulong compressedSize);
	ulong ZSTD_getFrameContentSize(const(void)* src, ulong srcSize);
	deprecated("Replaced by ZSTD_getFrameContentSize") deprecated ulong ZSTD_getDecompressedSize(const(void)* src, ulong srcSize);
	ulong ZSTD_findFrameCompressedSize(const(void)* src, ulong srcSize);
	ulong ZSTD_compressBound(ulong srcSize);
	uint ZSTD_isError(ulong code);
	const(char)* ZSTD_getErrorName(ulong code);
	int ZSTD_minCLevel();
	int ZSTD_maxCLevel();
	int ZSTD_defaultCLevel();
	struct ZSTD_CCtx_s;
	alias ZSTD_CCtx = const ZSTD_CCtx_s;
	const ZSTD_CCtx_s* ZSTD_createCCtx();
	ulong ZSTD_freeCCtx(const ZSTD_CCtx_s* cctx);
	ulong ZSTD_compressCCtx(const ZSTD_CCtx_s* cctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, int compressionLevel);
	struct ZSTD_DCtx_s;
	alias ZSTD_DCtx = const ZSTD_DCtx_s;
	const ZSTD_DCtx_s* ZSTD_createDCtx();
	ulong ZSTD_freeDCtx(const ZSTD_DCtx_s* dctx);
	ulong ZSTD_decompressDCtx(const ZSTD_DCtx_s* dctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize);
	enum ZSTD_strategy
	{
		ZSTD_fast = 1,
		ZSTD_dfast = 2,
		ZSTD_greedy = 3,
		ZSTD_lazy = 4,
		ZSTD_lazy2 = 5,
		ZSTD_btlazy2 = 6,
		ZSTD_btopt = 7,
		ZSTD_btultra = 8,
		ZSTD_btultra2 = 9,
	}
	alias ZSTD_fast = ZSTD_strategy.ZSTD_fast;
	alias ZSTD_dfast = ZSTD_strategy.ZSTD_dfast;
	alias ZSTD_greedy = ZSTD_strategy.ZSTD_greedy;
	alias ZSTD_lazy = ZSTD_strategy.ZSTD_lazy;
	alias ZSTD_lazy2 = ZSTD_strategy.ZSTD_lazy2;
	alias ZSTD_btlazy2 = ZSTD_strategy.ZSTD_btlazy2;
	alias ZSTD_btopt = ZSTD_strategy.ZSTD_btopt;
	alias ZSTD_btultra = ZSTD_strategy.ZSTD_btultra;
	alias ZSTD_btultra2 = ZSTD_strategy.ZSTD_btultra2;
	enum ZSTD_cParameter
	{
		ZSTD_c_compressionLevel = 100,
		ZSTD_c_windowLog = 101,
		ZSTD_c_hashLog = 102,
		ZSTD_c_chainLog = 103,
		ZSTD_c_searchLog = 104,
		ZSTD_c_minMatch = 105,
		ZSTD_c_targetLength = 106,
		ZSTD_c_strategy = 107,
		ZSTD_c_targetCBlockSize = 130,
		ZSTD_c_enableLongDistanceMatching = 160,
		ZSTD_c_ldmHashLog = 161,
		ZSTD_c_ldmMinMatch = 162,
		ZSTD_c_ldmBucketSizeLog = 163,
		ZSTD_c_ldmHashRateLog = 164,
		ZSTD_c_contentSizeFlag = 200,
		ZSTD_c_checksumFlag = 201,
		ZSTD_c_dictIDFlag = 202,
		ZSTD_c_nbWorkers = 400,
		ZSTD_c_jobSize = 401,
		ZSTD_c_overlapLog = 402,
		ZSTD_c_experimentalParam1 = 500,
		ZSTD_c_experimentalParam2 = 10,
		ZSTD_c_experimentalParam3 = 1000,
		ZSTD_c_experimentalParam4 = 1001,
		ZSTD_c_experimentalParam5 = 1002,
		ZSTD_c_experimentalParam7 = 1004,
		ZSTD_c_experimentalParam8 = 1005,
		ZSTD_c_experimentalParam9 = 1006,
		ZSTD_c_experimentalParam10 = 1007,
		ZSTD_c_experimentalParam11 = 1008,
		ZSTD_c_experimentalParam12 = 1009,
		ZSTD_c_experimentalParam13 = 1010,
		ZSTD_c_experimentalParam14 = 1011,
		ZSTD_c_experimentalParam15 = 1012,
		ZSTD_c_experimentalParam16 = 1013,
		ZSTD_c_experimentalParam17 = 1014,
		ZSTD_c_experimentalParam18 = 1015,
		ZSTD_c_experimentalParam19 = 1016,
	}
	alias ZSTD_c_compressionLevel = ZSTD_cParameter.ZSTD_c_compressionLevel;
	alias ZSTD_c_windowLog = ZSTD_cParameter.ZSTD_c_windowLog;
	alias ZSTD_c_hashLog = ZSTD_cParameter.ZSTD_c_hashLog;
	alias ZSTD_c_chainLog = ZSTD_cParameter.ZSTD_c_chainLog;
	alias ZSTD_c_searchLog = ZSTD_cParameter.ZSTD_c_searchLog;
	alias ZSTD_c_minMatch = ZSTD_cParameter.ZSTD_c_minMatch;
	alias ZSTD_c_targetLength = ZSTD_cParameter.ZSTD_c_targetLength;
	alias ZSTD_c_strategy = ZSTD_cParameter.ZSTD_c_strategy;
	alias ZSTD_c_targetCBlockSize = ZSTD_cParameter.ZSTD_c_targetCBlockSize;
	alias ZSTD_c_enableLongDistanceMatching = ZSTD_cParameter.ZSTD_c_enableLongDistanceMatching;
	alias ZSTD_c_ldmHashLog = ZSTD_cParameter.ZSTD_c_ldmHashLog;
	alias ZSTD_c_ldmMinMatch = ZSTD_cParameter.ZSTD_c_ldmMinMatch;
	alias ZSTD_c_ldmBucketSizeLog = ZSTD_cParameter.ZSTD_c_ldmBucketSizeLog;
	alias ZSTD_c_ldmHashRateLog = ZSTD_cParameter.ZSTD_c_ldmHashRateLog;
	alias ZSTD_c_contentSizeFlag = ZSTD_cParameter.ZSTD_c_contentSizeFlag;
	alias ZSTD_c_checksumFlag = ZSTD_cParameter.ZSTD_c_checksumFlag;
	alias ZSTD_c_dictIDFlag = ZSTD_cParameter.ZSTD_c_dictIDFlag;
	alias ZSTD_c_nbWorkers = ZSTD_cParameter.ZSTD_c_nbWorkers;
	alias ZSTD_c_jobSize = ZSTD_cParameter.ZSTD_c_jobSize;
	alias ZSTD_c_overlapLog = ZSTD_cParameter.ZSTD_c_overlapLog;
	alias ZSTD_c_experimentalParam1 = ZSTD_cParameter.ZSTD_c_experimentalParam1;
	alias ZSTD_c_experimentalParam2 = ZSTD_cParameter.ZSTD_c_experimentalParam2;
	alias ZSTD_c_experimentalParam3 = ZSTD_cParameter.ZSTD_c_experimentalParam3;
	alias ZSTD_c_experimentalParam4 = ZSTD_cParameter.ZSTD_c_experimentalParam4;
	alias ZSTD_c_experimentalParam5 = ZSTD_cParameter.ZSTD_c_experimentalParam5;
	alias ZSTD_c_experimentalParam7 = ZSTD_cParameter.ZSTD_c_experimentalParam7;
	alias ZSTD_c_experimentalParam8 = ZSTD_cParameter.ZSTD_c_experimentalParam8;
	alias ZSTD_c_experimentalParam9 = ZSTD_cParameter.ZSTD_c_experimentalParam9;
	alias ZSTD_c_experimentalParam10 = ZSTD_cParameter.ZSTD_c_experimentalParam10;
	alias ZSTD_c_experimentalParam11 = ZSTD_cParameter.ZSTD_c_experimentalParam11;
	alias ZSTD_c_experimentalParam12 = ZSTD_cParameter.ZSTD_c_experimentalParam12;
	alias ZSTD_c_experimentalParam13 = ZSTD_cParameter.ZSTD_c_experimentalParam13;
	alias ZSTD_c_experimentalParam14 = ZSTD_cParameter.ZSTD_c_experimentalParam14;
	alias ZSTD_c_experimentalParam15 = ZSTD_cParameter.ZSTD_c_experimentalParam15;
	alias ZSTD_c_experimentalParam16 = ZSTD_cParameter.ZSTD_c_experimentalParam16;
	alias ZSTD_c_experimentalParam17 = ZSTD_cParameter.ZSTD_c_experimentalParam17;
	alias ZSTD_c_experimentalParam18 = ZSTD_cParameter.ZSTD_c_experimentalParam18;
	alias ZSTD_c_experimentalParam19 = ZSTD_cParameter.ZSTD_c_experimentalParam19;
	struct ZSTD_bounds
	{
		ulong error = void;
		int lowerBound = void;
		int upperBound = void;
	}
	ZSTD_bounds ZSTD_cParam_getBounds(ZSTD_cParameter cParam);
	ulong ZSTD_CCtx_setParameter(const ZSTD_CCtx_s* cctx, ZSTD_cParameter param, int value);
	ulong ZSTD_CCtx_setPledgedSrcSize(const ZSTD_CCtx_s* cctx, ulong pledgedSrcSize);
	enum ZSTD_ResetDirective
	{
		ZSTD_reset_session_only = 1,
		ZSTD_reset_parameters = 2,
		ZSTD_reset_session_and_parameters = 3,
	}
	alias ZSTD_reset_session_only = ZSTD_ResetDirective.ZSTD_reset_session_only;
	alias ZSTD_reset_parameters = ZSTD_ResetDirective.ZSTD_reset_parameters;
	alias ZSTD_reset_session_and_parameters = ZSTD_ResetDirective.ZSTD_reset_session_and_parameters;
	ulong ZSTD_CCtx_reset(const ZSTD_CCtx_s* cctx, ZSTD_ResetDirective reset);
	ulong ZSTD_compress2(const ZSTD_CCtx_s* cctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize);
	enum ZSTD_dParameter
	{
		ZSTD_d_windowLogMax = 100,
		ZSTD_d_experimentalParam1 = 1000,
		ZSTD_d_experimentalParam2 = 1001,
		ZSTD_d_experimentalParam3 = 1002,
		ZSTD_d_experimentalParam4 = 1003,
		ZSTD_d_experimentalParam5 = 1004,
		ZSTD_d_experimentalParam6 = 1005,
	}
	alias ZSTD_d_windowLogMax = ZSTD_dParameter.ZSTD_d_windowLogMax;
	alias ZSTD_d_experimentalParam1 = ZSTD_dParameter.ZSTD_d_experimentalParam1;
	alias ZSTD_d_experimentalParam2 = ZSTD_dParameter.ZSTD_d_experimentalParam2;
	alias ZSTD_d_experimentalParam3 = ZSTD_dParameter.ZSTD_d_experimentalParam3;
	alias ZSTD_d_experimentalParam4 = ZSTD_dParameter.ZSTD_d_experimentalParam4;
	alias ZSTD_d_experimentalParam5 = ZSTD_dParameter.ZSTD_d_experimentalParam5;
	alias ZSTD_d_experimentalParam6 = ZSTD_dParameter.ZSTD_d_experimentalParam6;
	ZSTD_bounds ZSTD_dParam_getBounds(ZSTD_dParameter dParam);
	ulong ZSTD_DCtx_setParameter(const ZSTD_DCtx_s* dctx, ZSTD_dParameter param, int value);
	ulong ZSTD_DCtx_reset(const ZSTD_DCtx_s* dctx, ZSTD_ResetDirective reset);
	struct ZSTD_inBuffer_s
	{
		const(void)* src = void;
		ulong size = void;
		ulong pos = void;
	}
	alias ZSTD_inBuffer = ZSTD_inBuffer_s;
	struct ZSTD_outBuffer_s
	{
		void* dst = void;
		ulong size = void;
		ulong pos = void;
	}
	alias ZSTD_outBuffer = ZSTD_outBuffer_s;
	struct ZSTD_CCtx_s;
	alias ZSTD_CStream = const ZSTD_CCtx_s;
	const ZSTD_CCtx_s* ZSTD_createCStream();
	ulong ZSTD_freeCStream(const ZSTD_CCtx_s* zcs);
	enum ZSTD_EndDirective
	{
		ZSTD_e_continue = 0,
		ZSTD_e_flush = 1,
		ZSTD_e_end = 2,
	}
	alias ZSTD_e_continue = ZSTD_EndDirective.ZSTD_e_continue;
	alias ZSTD_e_flush = ZSTD_EndDirective.ZSTD_e_flush;
	alias ZSTD_e_end = ZSTD_EndDirective.ZSTD_e_end;
	ulong ZSTD_compressStream2(const ZSTD_CCtx_s* cctx, ZSTD_outBuffer_s* output, ZSTD_inBuffer_s* input, ZSTD_EndDirective endOp);
	ulong ZSTD_CStreamInSize();
	ulong ZSTD_CStreamOutSize();
	ulong ZSTD_initCStream(const ZSTD_CCtx_s* zcs, int compressionLevel);
	ulong ZSTD_compressStream(const ZSTD_CCtx_s* zcs, ZSTD_outBuffer_s* output, ZSTD_inBuffer_s* input);
	ulong ZSTD_flushStream(const ZSTD_CCtx_s* zcs, ZSTD_outBuffer_s* output);
	ulong ZSTD_endStream(const ZSTD_CCtx_s* zcs, ZSTD_outBuffer_s* output);
	struct ZSTD_DCtx_s;
	alias ZSTD_DStream = const ZSTD_DCtx_s;
	const ZSTD_DCtx_s* ZSTD_createDStream();
	ulong ZSTD_freeDStream(const ZSTD_DCtx_s* zds);
	ulong ZSTD_initDStream(const ZSTD_DCtx_s* zds);
	ulong ZSTD_decompressStream(const ZSTD_DCtx_s* zds, ZSTD_outBuffer_s* output, ZSTD_inBuffer_s* input);
	ulong ZSTD_DStreamInSize();
	ulong ZSTD_DStreamOutSize();
	ulong ZSTD_compress_usingDict(const ZSTD_CCtx_s* ctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, const(void)* dict, ulong dictSize, int compressionLevel);
	ulong ZSTD_decompress_usingDict(const ZSTD_DCtx_s* dctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, const(void)* dict, ulong dictSize);
	struct ZSTD_CDict_s;
	alias ZSTD_CDict = const ZSTD_CDict_s;
	const ZSTD_CDict_s* ZSTD_createCDict(const(void)* dictBuffer, ulong dictSize, int compressionLevel);
	ulong ZSTD_freeCDict(const ZSTD_CDict_s* CDict);
	ulong ZSTD_compress_usingCDict(const ZSTD_CCtx_s* cctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, const ZSTD_CDict_s* cdict);
	struct ZSTD_DDict_s;
	alias ZSTD_DDict = const ZSTD_DDict_s;
	const ZSTD_DDict_s* ZSTD_createDDict(const(void)* dictBuffer, ulong dictSize);
	ulong ZSTD_freeDDict(const ZSTD_DDict_s* ddict);
	ulong ZSTD_decompress_usingDDict(const ZSTD_DCtx_s* dctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, const ZSTD_DDict_s* ddict);
	uint ZSTD_getDictID_fromDict(const(void)* dict, ulong dictSize);
	uint ZSTD_getDictID_fromCDict(const ZSTD_CDict_s* cdict);
	uint ZSTD_getDictID_fromDDict(const ZSTD_DDict_s* ddict);
	uint ZSTD_getDictID_fromFrame(const(void)* src, ulong srcSize);
	ulong ZSTD_CCtx_loadDictionary(const ZSTD_CCtx_s* cctx, const(void)* dict, ulong dictSize);
	ulong ZSTD_CCtx_refCDict(const ZSTD_CCtx_s* cctx, const ZSTD_CDict_s* cdict);
	ulong ZSTD_CCtx_refPrefix(const ZSTD_CCtx_s* cctx, const(void)* prefix, ulong prefixSize);
	ulong ZSTD_DCtx_loadDictionary(const ZSTD_DCtx_s* dctx, const(void)* dict, ulong dictSize);
	ulong ZSTD_DCtx_refDDict(const ZSTD_DCtx_s* dctx, const ZSTD_DDict_s* ddict);
	ulong ZSTD_DCtx_refPrefix(const ZSTD_DCtx_s* dctx, const(void)* prefix, ulong prefixSize);
	ulong ZSTD_sizeof_CCtx(const ZSTD_CCtx_s* cctx);
	ulong ZSTD_sizeof_DCtx(const ZSTD_DCtx_s* dctx);
	ulong ZSTD_sizeof_CStream(const ZSTD_CCtx_s* zcs);
	ulong ZSTD_sizeof_DStream(const ZSTD_DCtx_s* zds);
	ulong ZSTD_sizeof_CDict(const ZSTD_CDict_s* cdict);
	ulong ZSTD_sizeof_DDict(const ZSTD_DDict_s* ddict);
	auto __control_entrypoint(__MP1)(__MP1 category)
	{
		return _SAL_L_Source_(__control_entrypoint, category, __inner_control_entrypoint(category));
	}
	auto _Post_bytecap_(__MP7)(__MP7 size)
	{
		return _SAL1_1_Source_(_Post_bytecap_, size, _Post1_impl_(__bytecap_impl(size)));
	}
	enum int ZSTD_VERSION_RELEASE = 6;
	auto _Inout_bytecount_c_(__MP21)(__MP21 size)
	{
		return _SAL1_1_Source_(_Inout_bytecount_c_, size, _Prepost_bytecount_c_(size));
	}
	enum int _CRT_HAS_C11 = 0;
	auto __deref_out_ecount_nz(__MP57)(__MP57 size)
	{
		return _SAL1_Source_(__deref_out_ecount_nz, size, __deref_out_ecount(size));
	}
	auto _I16_MIN()()
	{
		return -32767 - 1;
	}
	enum int CHAR_BIT = 8;
	enum int __IMPORTC__ = 1;
	auto __in_ecount(__MP61)(__MP61 size)
	{
		return _SAL1_Source_(__in_ecount, size, _In_reads_(size));
	}
	enum int _ARGMAX = 100;
	auto _TRUNCATE()()
	{
		return cast(ulong)-1;
	}
	auto __crt_va_end(__MP82)(__MP82 ap)
	{
		return cast(void)(ap = cast(char*)0);
	}
	enum int ZSTD_CLEVEL_DEFAULT = 3;
	auto __deref_inout_ecount_nz(__MP104)(__MP104 size)
	{
		return _SAL1_Source_(__deref_inout_ecount_nz, size, __deref_inout_ecount(size));
	}
	enum int LONG_MAX = 2147483647;
	auto __inout_bcount_full(__MP124)(__MP124 size)
	{
		return _SAL1_Source_(__inout_bcount_full, size, _Inout_updates_bytes_all_(size));
	}
	enum int _M_X64 = 100;
	auto _Inout_ptrdiff_count_(__MP126)(__MP126 size)
	{
		return _SAL1_1_Source_(_Inout_ptrdiff_count_, size, _Pre_ptrdiff_count_(size));
	}
	auto SHRT_MIN()()
	{
		return -32768;
	}
	enum int _MSC_EXTENSIONS = 1;
	auto __in_bcount(__MP169)(__MP169 size)
	{
		return _SAL1_Source_(__in_bcount, size, _In_reads_bytes_(size));
	}
	enum int _CRT_INTERNAL_NONSTDC_NAMES = 1;
	auto _Called_from_function_class_(__MP172)(__MP172 x)
	{
		return _In_function_class_(x);
	}
	auto __blocksOn(__MP176)(__MP176 resource)
	{
		return _SAL_L_Source_(__blocksOn, resource, __inner_blocksOn(resource));
	}
	enum int _HAS_CXX17 = 0;
	auto __in_bcount_opt(__MP178)(__MP178 size)
	{
		return _SAL1_Source_(__in_bcount_opt, size, _In_reads_bytes_opt_(size));
	}
	enum int _USE_ATTRIBUTES_FOR_SAL = 0;
	auto ZSTD_EXPAND_AND_QUOTE(__MP183)(__MP183 str)
	{
		return ZSTD_QUOTE(str);
	}
	auto _Inout_bytecount_(__MP203)(__MP203 size)
	{
		return _SAL1_1_Source_(_Inout_bytecount_, size, _Prepost_bytecount_(size));
	}
	enum ulong _UI64_MAX = 18446744073709551615LU;
	auto __out_bcount_opt(__MP205)(__MP205 size)
	{
		return _SAL1_Source_(__out_bcount_opt, size, _Out_writes_bytes_opt_(size));
	}
	auto __inout_bcount_z_opt(__MP207)(__MP207 size)
	{
		return _SAL1_Source_(__inout_bcount_z_opt, size, __inout_bcount_opt(size));
	}
	auto _Inout_opt_count_(__MP210)(__MP210 size)
	{
		return _SAL1_1_Source_(_Inout_opt_count_, size, _Prepost_opt_count_(size));
	}
	enum int USHRT_MAX = 65535;
	enum int ZSTD_VERSION_MINOR = 5;
	auto __crt_va_start_a(__MP253, __MP254)(__MP253 ap, __MP254 x)
	{
		return cast(void)__va_start(&ap, x);
	}
	auto __in_ecount_nz_opt(__MP256)(__MP256 size)
	{
		return _SAL1_Source_(__in_ecount_nz_opt, size, __in_ecount_opt(size));
	}
	auto __deref_opt_inout_ecount_nz_opt(__MP260)(__MP260 size)
	{
		return _SAL1_Source_(__deref_opt_inout_ecount_nz_opt, size, __deref_opt_inout_ecount_opt(size));
	}
	auto _Inout_count_(__MP310)(__MP310 size)
	{
		return _SAL1_1_Source_(_Inout_count_, size, _Prepost_count_(size));
	}
	auto _Inout_opt_bytecount_(__MP311)(__MP311 size)
	{
		return _SAL1_1_Source_(_Inout_opt_bytecount_, size, _Prepost_opt_bytecount_(size));
	}
	auto _CRT_INSECURE_DEPRECATE_GLOBALS(__MP312)(__MP312 replacement)
	{
		return _CRT_INSECURE_DEPRECATE(replacement);
	}
	enum int _MSC_BUILD = 0;
	auto __builtin_alloca(__MP325)(__MP325 x)
	{
		return alloca(x);
	}
	auto __out_ecount_full(__MP338)(__MP338 size)
	{
		return _SAL1_Source_(__out_ecount_full, size, _Out_writes_all_(size));
	}
	enum ulong ULLONG_MAX = 18446744073709551615LU;
	auto _CRT_STRINGIZE(__MP364)(__MP364 x)
	{
		return _CRT_STRINGIZE_(x);
	}
	auto __deref_out_bcount_full(__MP377)(__MP377 size)
	{
		return _SAL1_Source_(__deref_out_bcount_full, size, __deref_out_bcount_part(size, size));
	}
	enum int _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = 0;
	auto _Post_cap_(__MP392)(__MP392 size)
	{
		return _SAL1_1_Source_(_Post_cap_, size, _Post1_impl_(__cap_impl(size)));
	}
	auto _Inout_opt_bytecount_x_(__MP395)(__MP395 size)
	{
		return _SAL1_1_Source_(_Inout_opt_bytecount_x_, size, _Prepost_opt_bytecount_x_(size));
	}
	auto __inout_ecount_z(__MP398)(__MP398 size)
	{
		return _SAL1_Source_(__inout_ecount_z, size, _Inout_updates_z_(size));
	}
	auto __deref_inout_bcount_nz_opt(__MP399)(__MP399 size)
	{
		return _SAL1_Source_(__deref_inout_bcount_nz_opt, size, __deref_inout_bcount_opt(size));
	}
	enum long LLONG_MAX = 9223372036854775807L;
	auto __deref_inout_bcount_nz(__MP424)(__MP424 size)
	{
		return _SAL1_Source_(__deref_inout_bcount_nz, size, __deref_inout_ecount(size));
	}
	enum int _CRT_FUNCTIONS_REQUIRED = 1;
	auto __has_extension(__MP440)(__MP440 x)
	{
		return 0;
	}
	enum int _ARM_WINAPI_PARTITION_DESKTOP_SDK_AVAILABLE = 1;
	enum int ZSTD_BLOCKSIZELOG_MAX = 17;
	enum int MB_LEN_MAX = 5;
	enum int _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = 0;
	auto __vcrt_free_normal(__MP507)(__MP507 _Memory)
	{
		return free(_Memory);
	}
	enum long _I64_MAX = 9223372036854775807L;
	auto __crt_countof(__MP549)(__MP549 _Array)
	{
		return _Array.sizeof / _Array[0].sizeof;
	}
	enum int _WIN64 = 1;
	auto __deref_out_ecount(__MP556)(__MP556 size)
	{
		return _SAL1_Source_(__deref_out_ecount, size, _Outptr_result_buffer_(size));
	}
	auto _I8_MIN()()
	{
		return -127 - 1;
	}
	auto _CRT_SIZE_MAX()()
	{
		return cast(ulong)-1;
	}
	enum int UCHAR_MAX = 255;
	auto __vcrt_calloc_normal(__MP562, __MP563)(__MP562 _Count, __MP563 _Size)
	{
		return calloc(_Count, _Size);
	}
	auto __vcrt_malloc_normal(__MP611)(__MP611 _Size)
	{
		return malloc(_Size);
	}
	auto __in_ecount_z(__MP612)(__MP612 size)
	{
		return _SAL1_Source_(__in_ecount_z, size, _In_reads_z_(size));
	}
	enum int _SECURECRT_FILL_BUFFER_PATTERN = 254;
	enum int _IS_ASSIGNABLE_NOCHECK_SUPPORTED = 1;
	auto _CRT_WIDE(__MP641)(__MP641 s)
	{
		return _CRT_WIDE_(s);
	}
	auto __deref_opt_out_bcount_nz_opt(__MP647)(__MP647 size)
	{
		return _SAL1_Source_(__deref_opt_out_bcount_nz_opt, size, __deref_opt_out_bcount_opt(size));
	}
	enum int _CRT_SECURE_NO_WARNINGS = 1;
	auto __deref_out_ecount_nz_opt(__MP650)(__MP650 size)
	{
		return _SAL1_Source_(__deref_out_ecount_nz_opt, size, __deref_out_ecount_opt(size));
	}
	enum uint _UI16_MAX = 65535u;
	auto ZSTD_VERSION_NUMBER()()
	{
		return ZSTD_VERSION_MAJOR * 100 * 100 + ZSTD_VERSION_MINOR * 100 + ZSTD_VERSION_RELEASE;
	}
	enum int SHRT_MAX = 32767;
	auto LONG_MIN()()
	{
		return -2147483647 - 1;
	}
	auto __in_bcount_nz_opt(__MP688)(__MP688 size)
	{
		return _SAL1_Source_(__in_bcount_nz_opt, size, __in_bcount_opt(size));
	}
	enum int __STDC_NO_VLA__ = 1;
	auto _ADDRESSOF(__MP712)(__MP712 v)
	{
		return &v;
	}
	auto __data_entrypoint(__MP721)(__MP721 category)
	{
		return _SAL_L_Source_(__data_entrypoint, category, __inner_data_entrypoint(category));
	}
	enum int _CRT_NONSTDC_NO_DEPRECATE = 1;
	auto _Inout_opt_bytecount_c_(__MP758)(__MP758 size)
	{
		return _SAL1_1_Source_(_Inout_opt_bytecount_c_, size, _Prepost_opt_bytecount_c_(size));
	}
	enum int _M_AMD64 = 100;
	enum int SCHAR_MAX = 127;
	enum uint _UI32_MAX = 4294967295u;
	enum int ZSTD_VERSION_MAJOR = 1;
	enum int __SAL_H_VERSION = 180000000;
	enum int _USE_DECLSPECS_FOR_SAL = 0;
	auto __builtin_isnan(__MP801)(__MP801 x)
	{
		return isnan(x);
	}
	auto _I64_MIN()()
	{
		return -9223372036854775807L - 1;
	}
	auto ZSTD_CONTENTSIZE_ERROR()()
	{
		return 0LU - 2;
	}
	auto __deref_opt_inout_bcount_nz_opt(__MP817)(__MP817 size)
	{
		return _SAL1_Source_(__deref_opt_inout_bcount_nz_opt, size, __deref_opt_inout_bcount_opt(size));
	}
	auto __deref_out_bcount_nz_opt(__MP824)(__MP824 size)
	{
		return _SAL1_Source_(__deref_out_bcount_nz_opt, size, __deref_out_bcount_opt(size));
	}
	auto _Inout_opt_count_x_(__MP828)(__MP828 size)
	{
		return _SAL1_1_Source_(_Inout_opt_count_x_, size, _Prepost_opt_count_x_(size));
	}
	auto __inout_ecount_full(__MP851)(__MP851 size)
	{
		return _SAL1_Source_(__inout_ecount_full, size, _Inout_updates_all_(size));
	}
	auto __deref_inout_ecount_nz_opt(__MP852)(__MP852 size)
	{
		return _SAL1_Source_(__deref_inout_ecount_nz_opt, size, __deref_inout_ecount_opt(size));
	}
	auto ZSTD_MAX_INPUT_SIZE()()
	{
		return (ulong).sizeof == 8 ? 18374966859414961920LU : 4278255360u;
	}
	auto __deref_out_ecount_full(__MP916)(__MP916 size)
	{
		return _SAL1_Source_(__deref_out_ecount_full, size, __deref_out_ecount_part(size, size));
	}
	auto __in_ecount_opt(__MP938)(__MP938 size)
	{
		return _SAL1_Source_(__in_ecount_opt, size, _In_reads_opt_(size));
	}
	enum uint _UI8_MAX = 255u;
	auto _I32_MIN()()
	{
		return -2147483647 - 1;
	}
	auto __out_ecount_opt(__MP977)(__MP977 size)
	{
		return _SAL1_Source_(__out_ecount_opt, size, _Out_writes_opt_(size));
	}
	auto __inout_bcount_nz(__MP983)(__MP983 size)
	{
		return _SAL1_Source_(__inout_bcount_nz, size, __inout_bcount(size));
	}
	enum int _CRT_BUILD_DESKTOP_APP = 1;
	auto __deref_opt_inout_ecount_nz(__MP990)(__MP990 size)
	{
		return _SAL1_Source_(__deref_opt_inout_ecount_nz, size, __deref_opt_inout_ecount(size));
	}
	enum int _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = 0;
	enum uint ULONG_MAX = 4294967295u;
	enum int _NO_CRT_STDIO_INLINE = 1;
	enum int __STDC_WANT_SECURE_LIB__ = 1;
	auto _Format_string_impl_(__MP1053, __MP1054)(__MP1053 kind, __MP1054 where)
	{
		return _SA_annotes2(SAL_IsFormatString2, kind, where);
	}
	enum int _MT = 1;
	enum uint ZSTD_MAGIC_SKIPPABLE_MASK = 4294967280u;
	auto __inout_bcount(__MP1083)(__MP1083 size)
	{
		return _SAL1_Source_(__inout_bcount, size, _Inout_updates_bytes_(size));
	}
	auto INT_MIN()()
	{
		return -2147483647 - 1;
	}
	auto __in_bcount_nz(__MP1085)(__MP1085 size)
	{
		return _SAL1_Source_(__in_bcount_nz, size, __in_bcount(size));
	}
	enum int _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = 0;
	auto __inout_bcount_nz_opt(__MP1102)(__MP1102 size)
	{
		return _SAL1_Source_(__inout_bcount_nz_opt, size, __inout_bcount_opt(size));
	}
	enum uint ZSTD_MAGICNUMBER = 4247762216u;
	enum int _MSVC_WARNING_LEVEL = 1;
	auto __deref_opt_inout_bcount_nz(__MP1210)(__MP1210 size)
	{
		return _SAL1_Source_(__deref_opt_inout_bcount_nz, size, __deref_opt_inout_bcount(size));
	}
	auto __in_ecount_nz(__MP1215)(__MP1215 size)
	{
		return _SAL1_Source_(__in_ecount_nz, size, __in_ecount(size));
	}
	enum int _CRT_INT_MAX = 2147483647;
	enum ulong SIZE_MAX = 18446744073709551615LU;
	auto __deref_inout_bcount_full(__MP1242)(__MP1242 size)
	{
		return _SAL1_Source_(__deref_inout_bcount_full, size, __deref_inout_bcount_part(size, size));
	}
	auto __crt_va_start(__MP1261, __MP1262)(__MP1261 ap, __MP1262 x)
	{
		return __crt_va_start_a(ap, x);
	}
	auto _CRT_UNUSED(__MP1277)(__MP1277 x)
	{
		return cast(void)x;
	}
	auto __inout_ecount_nz(__MP1288)(__MP1288 size)
	{
		return _SAL1_Source_(__inout_ecount_nz, size, __inout_ecount(size));
	}
	auto _Inout_opt_ptrdiff_count_(__MP1290)(__MP1290 size)
	{
		return _SAL1_1_Source_(_Inout_opt_ptrdiff_count_, size, _Pre_opt_ptrdiff_count_(size));
	}
	auto __deref_out_bcount_part(__MP1313, __MP1314)(__MP1313 size, __MP1314 length)
	{
		return _SAL1_Source_(__deref_out_bcount_part, (size , length), _Outptr_result_bytebuffer_to_(size, length));
	}
	enum int __STDC_HOSTED__ = 1;
	auto __out_bcount_part(__MP1315, __MP1316)(__MP1315 size, __MP1316 length)
	{
		return _SAL1_Source_(__out_bcount_part, (size , length), _Out_writes_bytes_to_(size, length));
	}
	auto __out_bcount_full(__MP1319)(__MP1319 size)
	{
		return _SAL1_Source_(__out_bcount_full, size, _Out_writes_bytes_all_(size));
	}
	auto __inout_ecount_part(__MP1341, __MP1342)(__MP1341 size, __MP1342 length)
	{
		return _SAL1_Source_(__inout_ecount_part, (size , length), _Inout_updates_to_(size, length));
	}
	auto ZSTD_COMPRESSBOUND(__MP1358)(__MP1358 srcSize)
	{
		return cast(ulong)srcSize >= ZSTD_MAX_INPUT_SIZE ? 0 : srcSize + (srcSize >> 8) + (srcSize < 128 << 10 ? (128 << 10) - srcSize >> 11 : 0);
	}
	auto _Inout_opt_count_c_(__MP1362)(__MP1362 size)
	{
		return _SAL1_1_Source_(_Inout_opt_count_c_, size, _Prepost_opt_count_c_(size));
	}
	auto __deref_out_bcount_nz(__MP1365)(__MP1365 size)
	{
		return _SAL1_Source_(__deref_out_bcount_nz, size, __deref_out_ecount(size));
	}
	auto ZSTD_BLOCKSIZE_MAX()()
	{
		return 1 << ZSTD_BLOCKSIZELOG_MAX;
	}
	auto __GENSYM(__MP1375)(__MP1375 x)
	{
		return __MKID(x, __COUNTER__);
	}
	auto __MKID(__MP1377, __MP1378)(__MP1377 x, __MP1378 y)
	{
		return ___MKID(x, y);
	}
	enum int _I8_MAX = 127;
	auto __deref_inout_ecount_full(__MP1389)(__MP1389 size)
	{
		return _SAL1_Source_(__deref_inout_ecount_full, size, __deref_inout_ecount_part(size, size));
	}
	auto __has_feature(__MP1404)(__MP1404 x)
	{
		return 0;
	}
	enum int _HAS_CXX23 = 0;
	enum int ZSTD_MAGIC_SKIPPABLE_START = 407710288;
	auto __inout_ecount(__MP1453)(__MP1453 size)
	{
		return _SAL1_Source_(__inout_ecount, size, _Inout_updates_(size));
	}
	enum int _HAS_NODISCARD = 0;
	auto __inout_bcount_part(__MP1458, __MP1459)(__MP1458 size, __MP1459 length)
	{
		return _SAL1_Source_(__inout_bcount_part, (size , length), _Inout_updates_bytes_to_(size, length));
	}
	auto __deref_out_ecount_part(__MP1461, __MP1462)(__MP1461 size, __MP1462 length)
	{
		return _SAL1_Source_(__deref_out_ecount_part, (size , length), _Outptr_result_buffer_to_(size, length));
	}
	auto _Inout_count_x_(__MP1466)(__MP1466 size)
	{
		return _SAL1_1_Source_(_Inout_count_x_, size, _Prepost_count_x_(size));
	}
	auto __typefix(__MP1467)(__MP1467 ctype)
	{
		return _SAL1_Source_(__typefix, ctype, __inner_typefix(ctype));
	}
	auto _SLOTSIZEOF(__MP1473)(__MP1473 t)
	{
		return t.sizeof;
	}
	auto __deref_opt_out_ecount_nz_opt(__MP1474)(__MP1474 size)
	{
		return _SAL1_Source_(__deref_opt_out_ecount_nz_opt, size, __deref_opt_out_ecount_opt(size));
	}
	auto _Inout_count_c_(__MP1499)(__MP1499 size)
	{
		return _SAL1_1_Source_(_Inout_count_c_, size, _Prepost_count_c_(size));
	}
	auto NULL()()
	{
		return cast(void*)0;
	}
	enum int _MSC_FULL_VER = 193933523;
	enum int _I32_MAX = 2147483647;
	enum int _I16_MAX = 32767;
	enum int _HAS_CXX20 = 0;
	enum int _MSC_VER = 1939;
	enum int _MSVC_TRADITIONAL = 0;
	auto __builtin_isfinite(__MP1548)(__MP1548 x)
	{
		return finite(x);
	}
	enum int _CRT_HAS_CXX17 = 0;
	enum int _HAS_EXCEPTIONS = 1;
	enum int INT_MAX = 2147483647;
	auto errno()()
	{
		return *_errno();
	}
	auto __deref_out_bcount(__MP1590)(__MP1590 size)
	{
		return _SAL1_Source_(__deref_out_bcount, size, _Outptr_result_bytebuffer_(size));
	}
	auto SCHAR_MIN()()
	{
		return -128;
	}
	auto _Inout_bytecount_x_(__MP1641)(__MP1641 size)
	{
		return _SAL1_1_Source_(_Inout_bytecount_x_, size, _Prepost_bytecount_x_(size));
	}
	enum uint ZSTD_MAGIC_DICTIONARY = 3962610743u;
	auto LLONG_MIN()()
	{
		return -9223372036854775807L - 1;
	}
	auto _CRT_CONCATENATE(__MP1691, __MP1692)(__MP1691 a, __MP1692 b)
	{
		return _CRT_CONCATENATE_(a, b);
	}
	enum uint UINT_MAX = 4294967295u;
	auto _Deref_ret_range_(__MP1697, __MP1698)(__MP1697 lb, __MP1698 ub)
	{
		return _SAL2_Source_(_Deref_ret_range_, (lb , ub), _Deref_ret_range_impl_(lb, ub));
	}
	auto __success(__MP1703)(__MP1703 expr)
	{
		return _SAL1_1_Source_(__success, expr, _Success_(expr));
	}
	auto __out_ecount(__MP1704)(__MP1704 size)
	{
		return _SAL1_Source_(__out_ecount, size, _Out_writes_(size));
	}
	auto __out_bcount(__MP1724)(__MP1724 size)
	{
		return _SAL1_Source_(__out_bcount, size, _Out_writes_bytes_(size));
	}
	enum int _MSVC_EXECUTION_CHARACTER_SET = 65001;
	enum int __STDC_SECURE_LIB__ = 200411;
	auto ZSTD_CONTENTSIZE_UNKNOWN()()
	{
		return 0LU - 1;
	}
	enum int _SAL_VERSION = 20;
	enum int _INTEGRAL_MAX_BITS = 64;
	enum int _UTF8 = 1;
	auto __out_ecount_part(__MP1750, __MP1751)(__MP1750 size, __MP1751 length)
	{
		return _SAL1_Source_(__out_ecount_part, (size , length), _Out_writes_to_(size, length));
	}
	auto _APALIGN(__MP1758, __MP1759)(__MP1758 t, __MP1759 ap)
	{
		return __alignof(t);
	}
	auto __inout_ecount_nz_opt(__MP1777)(__MP1777 size)
	{
		return _SAL1_Source_(__inout_ecount_nz_opt, size, __inout_ecount_opt(size));
	}
	auto _threadid()()
	{
		return __threadid();
	}
	enum int _WIN32 = 1;
	enum int _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = 1;
	enum int _VCRT_COMPILER_PREPROCESSOR = 1;
	enum int _CRT_PACKING = 8;
}
import __builtins;

