module zstd;
nothrow:
@nogc:

// D import file generated from 'source\zstd_win.c'
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
	const(ZSTD_CCtx_s*) ZSTD_createCCtx();
	ulong ZSTD_freeCCtx(const ZSTD_CCtx_s* cctx);
	ulong ZSTD_compressCCtx(const ZSTD_CCtx_s* cctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, int compressionLevel);
	struct ZSTD_DCtx_s;
	alias ZSTD_DCtx = const ZSTD_DCtx_s;
	const(ZSTD_DCtx_s*) ZSTD_createDCtx();
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
	//struct ZSTD_CCtx_s;
	alias ZSTD_CStream = const ZSTD_CCtx_s;
	const(ZSTD_CCtx_s*) ZSTD_createCStream();
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
	//struct ZSTD_DCtx_s;
	alias ZSTD_DStream = const ZSTD_DCtx_s;
	const(ZSTD_DCtx_s*) ZSTD_createDStream();
	ulong ZSTD_freeDStream(const ZSTD_DCtx_s* zds);
	ulong ZSTD_initDStream(const ZSTD_DCtx_s* zds);
	ulong ZSTD_decompressStream(const ZSTD_DCtx_s* zds, ZSTD_outBuffer_s* output, ZSTD_inBuffer_s* input);
	ulong ZSTD_DStreamInSize();
	ulong ZSTD_DStreamOutSize();
	ulong ZSTD_compress_usingDict(const ZSTD_CCtx_s* ctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, const(void)* dict, ulong dictSize, int compressionLevel);
	ulong ZSTD_decompress_usingDict(const ZSTD_DCtx_s* dctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, const(void)* dict, ulong dictSize);
	struct ZSTD_CDict_s;
	alias ZSTD_CDict = const ZSTD_CDict_s;
	const(ZSTD_CDict_s*) ZSTD_createCDict(const(void)* dictBuffer, ulong dictSize, int compressionLevel);
	ulong ZSTD_freeCDict(const ZSTD_CDict_s* CDict);
	ulong ZSTD_compress_usingCDict(const ZSTD_CCtx_s* cctx, void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, const ZSTD_CDict_s* cdict);
	struct ZSTD_DDict_s;
	alias ZSTD_DDict = const ZSTD_DDict_s;
	const(ZSTD_DDict_s*) ZSTD_createDDict(const(void)* dictBuffer, ulong dictSize);
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
	auto _Inout_bytecount_c_(__MP11)(__MP11 size)
	{
		return _SAL1_1_Source_(_Inout_bytecount_c_, size, _Prepost_bytecount_c_(size));
	}
	auto RSIZE_MAX()()
	{
		return SIZE_MAX >> 1;
	}
	auto __deref_out_ecount_nz(__MP30)(__MP30 size)
	{
		return _SAL1_Source_(__deref_out_ecount_nz, size, __deref_out_ecount(size));
	}
	auto _I16_MIN()()
	{
		return -32767 - 1;
	}
	enum int CHAR_BIT = 8;
	enum int __IMPORTC__ = 1;
	auto __in_ecount(__MP34)(__MP34 size)
	{
		return _SAL1_Source_(__in_ecount, size, _In_reads_(size));
	}
	auto __crt_va_end(__MP42)(__MP42 ap)
	{
		return cast(void)(ap = cast(char*)0);
	}
	enum int ZSTD_CLEVEL_DEFAULT = 3;
	auto __deref_inout_ecount_nz(__MP56)(__MP56 size)
	{
		return _SAL1_Source_(__deref_inout_ecount_nz, size, __deref_inout_ecount(size));
	}
	enum int LONG_MAX = 2147483647;
	auto __inout_bcount_full(__MP76)(__MP76 size)
	{
		return _SAL1_Source_(__inout_bcount_full, size, _Inout_updates_bytes_all_(size));
	}
	enum int _M_X64 = 100;
	auto _Inout_ptrdiff_count_(__MP78)(__MP78 size)
	{
		return _SAL1_1_Source_(_Inout_ptrdiff_count_, size, _Pre_ptrdiff_count_(size));
	}
	auto SHRT_MIN()()
	{
		return -32768;
	}
	enum int _MSC_EXTENSIONS = 1;
	auto __in_bcount(__MP108)(__MP108 size)
	{
		return _SAL1_Source_(__in_bcount, size, _In_reads_bytes_(size));
	}
	auto _Called_from_function_class_(__MP111)(__MP111 x)
	{
		return _In_function_class_(x);
	}
	auto __blocksOn(__MP115)(__MP115 resource)
	{
		return _SAL_L_Source_(__blocksOn, resource, __inner_blocksOn(resource));
	}
	enum int _HAS_CXX17 = 0;
	auto __in_bcount_opt(__MP117)(__MP117 size)
	{
		return _SAL1_Source_(__in_bcount_opt, size, _In_reads_bytes_opt_(size));
	}
	enum int _USE_ATTRIBUTES_FOR_SAL = 0;
	auto ZSTD_EXPAND_AND_QUOTE(__MP122)(__MP122 str)
	{
		return ZSTD_QUOTE(str);
	}
	auto _Inout_bytecount_(__MP130)(__MP130 size)
	{
		return _SAL1_1_Source_(_Inout_bytecount_, size, _Prepost_bytecount_(size));
	}
	enum ulong _UI64_MAX = 18446744073709551615LU;
	auto __out_bcount_opt(__MP132)(__MP132 size)
	{
		return _SAL1_Source_(__out_bcount_opt, size, _Out_writes_bytes_opt_(size));
	}
	auto __inout_bcount_z_opt(__MP134)(__MP134 size)
	{
		return _SAL1_Source_(__inout_bcount_z_opt, size, __inout_bcount_opt(size));
	}
	auto _Inout_opt_count_(__MP137)(__MP137 size)
	{
		return _SAL1_1_Source_(_Inout_opt_count_, size, _Prepost_opt_count_(size));
	}
	enum int USHRT_MAX = 65535;
	enum int ZSTD_VERSION_MINOR = 5;
	auto __crt_va_start_a(__MP157, __MP158)(__MP157 ap, __MP158 x)
	{
		return cast(void)__va_start(&ap, x);
	}
	auto __in_ecount_nz_opt(__MP160)(__MP160 size)
	{
		return _SAL1_Source_(__in_ecount_nz_opt, size, __in_ecount_opt(size));
	}
	auto __deref_opt_inout_ecount_nz_opt(__MP164)(__MP164 size)
	{
		return _SAL1_Source_(__deref_opt_inout_ecount_nz_opt, size, __deref_opt_inout_ecount_opt(size));
	}
	auto _Inout_count_(__MP176)(__MP176 size)
	{
		return _SAL1_1_Source_(_Inout_count_, size, _Prepost_count_(size));
	}
	auto _Inout_opt_bytecount_(__MP177)(__MP177 size)
	{
		return _SAL1_1_Source_(_Inout_opt_bytecount_, size, _Prepost_opt_bytecount_(size));
	}
	enum int _MSC_BUILD = 0;
	auto __builtin_alloca(__MP190)(__MP190 x)
	{
		return alloca(x);
	}
	auto __out_ecount_full(__MP191)(__MP191 size)
	{
		return _SAL1_Source_(__out_ecount_full, size, _Out_writes_all_(size));
	}
	enum ulong ULLONG_MAX = 18446744073709551615LU;
	auto _CRT_STRINGIZE(__MP206)(__MP206 x)
	{
		return _CRT_STRINGIZE_(x);
	}
	auto __deref_out_bcount_full(__MP219)(__MP219 size)
	{
		return _SAL1_Source_(__deref_out_bcount_full, size, __deref_out_bcount_part(size, size));
	}
	auto _Post_cap_(__MP234)(__MP234 size)
	{
		return _SAL1_1_Source_(_Post_cap_, size, _Post1_impl_(__cap_impl(size)));
	}
	auto _Inout_opt_bytecount_x_(__MP237)(__MP237 size)
	{
		return _SAL1_1_Source_(_Inout_opt_bytecount_x_, size, _Prepost_opt_bytecount_x_(size));
	}
	auto __inout_ecount_z(__MP240)(__MP240 size)
	{
		return _SAL1_Source_(__inout_ecount_z, size, _Inout_updates_z_(size));
	}
	auto __deref_inout_bcount_nz_opt(__MP241)(__MP241 size)
	{
		return _SAL1_Source_(__deref_inout_bcount_nz_opt, size, __deref_inout_bcount_opt(size));
	}
	enum long LLONG_MAX = 9223372036854775807L;
	auto __deref_inout_bcount_nz(__MP255)(__MP255 size)
	{
		return _SAL1_Source_(__deref_inout_bcount_nz, size, __deref_inout_ecount(size));
	}
	auto __has_extension(__MP260)(__MP260 x)
	{
		return 0;
	}
	enum int ZSTD_BLOCKSIZELOG_MAX = 17;
	enum int MB_LEN_MAX = 5;
	auto __vcrt_free_normal(__MP290)(__MP290 _Memory)
	{
		return free(_Memory);
	}
	enum long _I64_MAX = 9223372036854775807L;
	auto __crt_countof(__MP308)(__MP308 _Array)
	{
		return _Array.sizeof / _Array[0].sizeof;
	}
	enum int _WIN64 = 1;
	auto __deref_out_ecount(__MP313)(__MP313 size)
	{
		return _SAL1_Source_(__deref_out_ecount, size, _Outptr_result_buffer_(size));
	}
	auto _I8_MIN()()
	{
		return -127 - 1;
	}
	enum int UCHAR_MAX = 255;
	auto __vcrt_calloc_normal(__MP319, __MP320)(__MP319 _Count, __MP320 _Size)
	{
		return calloc(_Count, _Size);
	}
	auto __vcrt_malloc_normal(__MP336)(__MP336 _Size)
	{
		return malloc(_Size);
	}
	auto __in_ecount_z(__MP337)(__MP337 size)
	{
		return _SAL1_Source_(__in_ecount_z, size, _In_reads_z_(size));
	}
	enum int _IS_ASSIGNABLE_NOCHECK_SUPPORTED = 1;
	auto _CRT_WIDE(__MP345)(__MP345 s)
	{
		return _CRT_WIDE_(s);
	}
	auto __deref_opt_out_bcount_nz_opt(__MP351)(__MP351 size)
	{
		return _SAL1_Source_(__deref_opt_out_bcount_nz_opt, size, __deref_opt_out_bcount_opt(size));
	}
	enum int _CRT_SECURE_NO_WARNINGS = 1;
	auto __deref_out_ecount_nz_opt(__MP354)(__MP354 size)
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
	auto __in_bcount_nz_opt(__MP372)(__MP372 size)
	{
		return _SAL1_Source_(__in_bcount_nz_opt, size, __in_bcount_opt(size));
	}
	enum int __STDC_NO_VLA__ = 1;
	auto _ADDRESSOF(__MP381)(__MP381 v)
	{
		return &v;
	}
	auto __data_entrypoint(__MP383)(__MP383 category)
	{
		return _SAL_L_Source_(__data_entrypoint, category, __inner_data_entrypoint(category));
	}
	enum int _CRT_NONSTDC_NO_DEPRECATE = 1;
	auto _Inout_opt_bytecount_c_(__MP411)(__MP411 size)
	{
		return _SAL1_1_Source_(_Inout_opt_bytecount_c_, size, _Prepost_opt_bytecount_c_(size));
	}
	enum int _M_AMD64 = 100;
	enum int SCHAR_MAX = 127;
	enum uint _UI32_MAX = 4294967295u;
	enum int ZSTD_VERSION_MAJOR = 1;
	enum int __SAL_H_VERSION = 180000000;
	enum int _USE_DECLSPECS_FOR_SAL = 0;
	auto __builtin_isnan(__MP443)(__MP443 x)
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
	auto __deref_opt_inout_bcount_nz_opt(__MP459)(__MP459 size)
	{
		return _SAL1_Source_(__deref_opt_inout_bcount_nz_opt, size, __deref_opt_inout_bcount_opt(size));
	}
	auto __deref_out_bcount_nz_opt(__MP466)(__MP466 size)
	{
		return _SAL1_Source_(__deref_out_bcount_nz_opt, size, __deref_out_bcount_opt(size));
	}
	auto _Inout_opt_count_x_(__MP470)(__MP470 size)
	{
		return _SAL1_1_Source_(_Inout_opt_count_x_, size, _Prepost_opt_count_x_(size));
	}
	auto __inout_ecount_full(__MP479)(__MP479 size)
	{
		return _SAL1_Source_(__inout_ecount_full, size, _Inout_updates_all_(size));
	}
	auto __deref_inout_ecount_nz_opt(__MP480)(__MP480 size)
	{
		return _SAL1_Source_(__deref_inout_ecount_nz_opt, size, __deref_inout_ecount_opt(size));
	}
	auto ZSTD_MAX_INPUT_SIZE()()
	{
		return (ulong).sizeof == 8 ? 18374966859414961920LU : 4278255360u;
	}
	auto __deref_out_ecount_full(__MP498)(__MP498 size)
	{
		return _SAL1_Source_(__deref_out_ecount_full, size, __deref_out_ecount_part(size, size));
	}
	auto __in_ecount_opt(__MP512)(__MP512 size)
	{
		return _SAL1_Source_(__in_ecount_opt, size, _In_reads_opt_(size));
	}
	enum uint _UI8_MAX = 255u;
	auto _I32_MIN()()
	{
		return -2147483647 - 1;
	}
	auto __out_ecount_opt(__MP527)(__MP527 size)
	{
		return _SAL1_Source_(__out_ecount_opt, size, _Out_writes_opt_(size));
	}
	auto __inout_bcount_nz(__MP533)(__MP533 size)
	{
		return _SAL1_Source_(__inout_bcount_nz, size, __inout_bcount(size));
	}
	auto __deref_opt_inout_ecount_nz(__MP540)(__MP540 size)
	{
		return _SAL1_Source_(__deref_opt_inout_ecount_nz, size, __deref_opt_inout_ecount(size));
	}
	enum uint ULONG_MAX = 4294967295u;
	enum int _NO_CRT_STDIO_INLINE = 1;
	auto _Format_string_impl_(__MP583, __MP584)(__MP583 kind, __MP584 where)
	{
		return _SA_annotes2(SAL_IsFormatString2, kind, where);
	}
	enum int _MT = 1;
	enum uint ZSTD_MAGIC_SKIPPABLE_MASK = 4294967280u;
	auto __inout_bcount(__MP604)(__MP604 size)
	{
		return _SAL1_Source_(__inout_bcount, size, _Inout_updates_bytes_(size));
	}
	auto INT_MIN()()
	{
		return -2147483647 - 1;
	}
	auto __in_bcount_nz(__MP606)(__MP606 size)
	{
		return _SAL1_Source_(__in_bcount_nz, size, __in_bcount(size));
	}
	auto __inout_bcount_nz_opt(__MP623)(__MP623 size)
	{
		return _SAL1_Source_(__inout_bcount_nz_opt, size, __inout_bcount_opt(size));
	}
	enum uint ZSTD_MAGICNUMBER = 4247762216u;
	enum int _MSVC_WARNING_LEVEL = 1;
	auto __deref_opt_inout_bcount_nz(__MP644)(__MP644 size)
	{
		return _SAL1_Source_(__deref_opt_inout_bcount_nz, size, __deref_opt_inout_bcount(size));
	}
	auto __in_ecount_nz(__MP649)(__MP649 size)
	{
		return _SAL1_Source_(__in_ecount_nz, size, __in_ecount(size));
	}
	enum ulong SIZE_MAX = 18446744073709551615LU;
	auto __deref_inout_bcount_full(__MP669)(__MP669 size)
	{
		return _SAL1_Source_(__deref_inout_bcount_full, size, __deref_inout_bcount_part(size, size));
	}
	auto __crt_va_start(__MP676, __MP677)(__MP676 ap, __MP677 x)
	{
		return __crt_va_start_a(ap, x);
	}
	auto __inout_ecount_nz(__MP693)(__MP693 size)
	{
		return _SAL1_Source_(__inout_ecount_nz, size, __inout_ecount(size));
	}
	auto _Inout_opt_ptrdiff_count_(__MP695)(__MP695 size)
	{
		return _SAL1_1_Source_(_Inout_opt_ptrdiff_count_, size, _Pre_opt_ptrdiff_count_(size));
	}
	auto __deref_out_bcount_part(__MP697, __MP698)(__MP697 size, __MP698 length)
	{
		return _SAL1_Source_(__deref_out_bcount_part, (size , length), _Outptr_result_bytebuffer_to_(size, length));
	}
	enum int __STDC_HOSTED__ = 1;
	auto __out_bcount_part(__MP699, __MP700)(__MP699 size, __MP700 length)
	{
		return _SAL1_Source_(__out_bcount_part, (size , length), _Out_writes_bytes_to_(size, length));
	}
	auto __out_bcount_full(__MP703)(__MP703 size)
	{
		return _SAL1_Source_(__out_bcount_full, size, _Out_writes_bytes_all_(size));
	}
	auto __inout_ecount_part(__MP713, __MP714)(__MP713 size, __MP714 length)
	{
		return _SAL1_Source_(__inout_ecount_part, (size , length), _Inout_updates_to_(size, length));
	}
	auto ZSTD_COMPRESSBOUND(__MP719)(__MP719 srcSize)
	{
		return cast(ulong)srcSize >= ZSTD_MAX_INPUT_SIZE ? 0 : srcSize + (srcSize >> 8) + (srcSize < 128 << 10 ? (128 << 10) - srcSize >> 11 : 0);
	}
	auto _Inout_opt_count_c_(__MP723)(__MP723 size)
	{
		return _SAL1_1_Source_(_Inout_opt_count_c_, size, _Prepost_opt_count_c_(size));
	}
	auto __deref_out_bcount_nz(__MP726)(__MP726 size)
	{
		return _SAL1_Source_(__deref_out_bcount_nz, size, __deref_out_ecount(size));
	}
	auto ZSTD_BLOCKSIZE_MAX()()
	{
		return 1 << ZSTD_BLOCKSIZELOG_MAX;
	}
	auto __GENSYM(__MP736)(__MP736 x)
	{
		return __MKID(x, __COUNTER__);
	}
	auto __MKID(__MP738, __MP739)(__MP738 x, __MP739 y)
	{
		return ___MKID(x, y);
	}
	enum int _I8_MAX = 127;
	auto __deref_inout_ecount_full(__MP750)(__MP750 size)
	{
		return _SAL1_Source_(__deref_inout_ecount_full, size, __deref_inout_ecount_part(size, size));
	}
	auto __has_feature(__MP758)(__MP758 x)
	{
		return 0;
	}
	enum int _HAS_CXX23 = 0;
	enum int ZSTD_MAGIC_SKIPPABLE_START = 407710288;
	auto __inout_ecount(__MP789)(__MP789 size)
	{
		return _SAL1_Source_(__inout_ecount, size, _Inout_updates_(size));
	}
	enum int _HAS_NODISCARD = 0;
	auto __inout_bcount_part(__MP793, __MP794)(__MP793 size, __MP794 length)
	{
		return _SAL1_Source_(__inout_bcount_part, (size , length), _Inout_updates_bytes_to_(size, length));
	}
	auto __deref_out_ecount_part(__MP796, __MP797)(__MP796 size, __MP797 length)
	{
		return _SAL1_Source_(__deref_out_ecount_part, (size , length), _Outptr_result_buffer_to_(size, length));
	}
	auto _Inout_count_x_(__MP801)(__MP801 size)
	{
		return _SAL1_1_Source_(_Inout_count_x_, size, _Prepost_count_x_(size));
	}
	auto __typefix(__MP802)(__MP802 ctype)
	{
		return _SAL1_Source_(__typefix, ctype, __inner_typefix(ctype));
	}
	auto _SLOTSIZEOF(__MP808)(__MP808 t)
	{
		return t.sizeof;
	}
	auto __deref_opt_out_ecount_nz_opt(__MP809)(__MP809 size)
	{
		return _SAL1_Source_(__deref_opt_out_ecount_nz_opt, size, __deref_opt_out_ecount_opt(size));
	}
	auto _Inout_count_c_(__MP818)(__MP818 size)
	{
		return _SAL1_1_Source_(_Inout_count_c_, size, _Prepost_count_c_(size));
	}
	auto NULL()()
	{
		return cast(void*)0;
	}
	enum int _MSC_FULL_VER = 194234436;
	enum int _I32_MAX = 2147483647;
	enum int _I16_MAX = 32767;
	enum int _HAS_CXX20 = 0;
	enum int _MSC_VER = 1942;
	enum int _MSVC_TRADITIONAL = 0;
	auto __builtin_isfinite(__MP848)(__MP848 x)
	{
		return finite(x);
	}
	enum int _HAS_EXCEPTIONS = 1;
	enum int INT_MAX = 2147483647;
	auto __deref_out_bcount(__MP875)(__MP875 size)
	{
		return _SAL1_Source_(__deref_out_bcount, size, _Outptr_result_bytebuffer_(size));
	}
	auto SCHAR_MIN()()
	{
		return -128;
	}
	auto _Inout_bytecount_x_(__MP889)(__MP889 size)
	{
		return _SAL1_1_Source_(_Inout_bytecount_x_, size, _Prepost_bytecount_x_(size));
	}
	enum uint ZSTD_MAGIC_DICTIONARY = 3962610743u;
	auto LLONG_MIN()()
	{
		return -9223372036854775807L - 1;
	}
	auto _CRT_CONCATENATE(__MP904, __MP905)(__MP904 a, __MP905 b)
	{
		return _CRT_CONCATENATE_(a, b);
	}
	enum uint UINT_MAX = 4294967295u;
	auto _Deref_ret_range_(__MP910, __MP911)(__MP910 lb, __MP911 ub)
	{
		return _SAL2_Source_(_Deref_ret_range_, (lb , ub), _Deref_ret_range_impl_(lb, ub));
	}
	auto __success(__MP916)(__MP916 expr)
	{
		return _SAL1_1_Source_(__success, expr, _Success_(expr));
	}
	auto __out_ecount(__MP917)(__MP917 size)
	{
		return _SAL1_Source_(__out_ecount, size, _Out_writes_(size));
	}
	auto __out_bcount(__MP937)(__MP937 size)
	{
		return _SAL1_Source_(__out_bcount, size, _Out_writes_bytes_(size));
	}
	enum int _MSVC_EXECUTION_CHARACTER_SET = 65001;
	auto ZSTD_CONTENTSIZE_UNKNOWN()()
	{
		return 0LU - 1;
	}
	enum int _SAL_VERSION = 20;
	enum int _INTEGRAL_MAX_BITS = 64;
	enum int _UTF8 = 1;
	auto __out_ecount_part(__MP954, __MP955)(__MP954 size, __MP955 length)
	{
		return _SAL1_Source_(__out_ecount_part, (size , length), _Out_writes_to_(size, length));
	}
	auto _APALIGN(__MP962, __MP963)(__MP962 t, __MP963 ap)
	{
		return __alignof(t);
	}
	auto __inout_ecount_nz_opt(__MP972)(__MP972 size)
	{
		return _SAL1_Source_(__inout_ecount_nz_opt, size, __inout_ecount_opt(size));
	}
	enum int _WIN32 = 1;
	enum int _VCRT_COMPILER_PREPROCESSOR = 1;
	enum int _CRT_PACKING = 8;
}
import __importc_builtins;

