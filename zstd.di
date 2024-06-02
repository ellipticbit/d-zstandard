module zstd;
nothrow:
@nogc:

// D import file generated from 'source/zstd_posix.c'
extern (C)
{
	alias __uint16_t = ushort;
	alias __uint32_t = uint;
	alias __uint64_t = ulong;
	alias ptrdiff_t = long;
	alias size_t = ulong;
	alias wchar_t = int;
	struct max_align_t
	{
		long __max_align_ll = void;
		real __max_align_ld = void;
	}
	uint ZSTD_versionNumber();
	const(char)* ZSTD_versionString();
	ulong ZSTD_compress(void* dst, ulong dstCapacity, const(void)* src, ulong srcSize, int compressionLevel);
	ulong ZSTD_decompress(void* dst, ulong dstCapacity, const(void)* src, ulong compressedSize);
	ulong ZSTD_getFrameContentSize(const(void)* src, ulong srcSize);
	deprecated ulong ZSTD_getDecompressedSize(const(void)* src, ulong srcSize);
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
	enum int __STDC__ = 1;
	enum long __STDC_VERSION__ = 201710L;
	enum int __STDC_UTF_16__ = 1;
	enum int __STDC_UTF_32__ = 1;
	enum int __STDC_HOSTED__ = 1;
	enum int __GNUC__ = 11;
	enum int __GNUC_MINOR__ = 4;
	enum int __GNUC_PATCHLEVEL__ = 0;
	/+enum __VERSION__ = "11.4.0"+/;
	enum int __ATOMIC_RELAXED = 0;
	enum int __ATOMIC_SEQ_CST = 5;
	enum int __ATOMIC_ACQUIRE = 2;
	enum int __ATOMIC_RELEASE = 3;
	enum int __ATOMIC_ACQ_REL = 4;
	enum int __ATOMIC_CONSUME = 1;
	enum int __pic__ = 2;
	enum int __PIC__ = 2;
	enum int __pie__ = 2;
	enum int __PIE__ = 2;
	enum int __FINITE_MATH_ONLY__ = 0;
	enum int _LP64 = 1;
	enum int __LP64__ = 1;
	enum int __SIZEOF_INT__ = 4;
	enum int __SIZEOF_LONG__ = 8;
	enum int __SIZEOF_LONG_LONG__ = 8;
	enum int __SIZEOF_SHORT__ = 2;
	enum int __SIZEOF_FLOAT__ = 4;
	enum int __SIZEOF_DOUBLE__ = 8;
	enum int __SIZEOF_LONG_DOUBLE__ = 16;
	enum int __SIZEOF_SIZE_T__ = 8;
	enum int __CHAR_BIT__ = 8;
	enum int __BIGGEST_ALIGNMENT__ = 16;
	enum int __ORDER_LITTLE_ENDIAN__ = 1234;
	enum int __ORDER_BIG_ENDIAN__ = 4321;
	enum int __ORDER_PDP_ENDIAN__ = 3412;
	enum int __SIZEOF_POINTER__ = 8;
	enum __GNUC_EXECUTION_CHARSET_NAME = "UTF-8";
	enum __GNUC_WIDE_EXECUTION_CHARSET_NAME = "UTF-32LE";
	enum int __GXX_ABI_VERSION = 1016;
	enum int __SCHAR_MAX__ = 127;
	enum int __SHRT_MAX__ = 32767;
	enum int __INT_MAX__ = 2147483647;
	enum long __LONG_MAX__ = 9223372036854775807L;
	enum long __LONG_LONG_MAX__ = 9223372036854775807L;
	enum int __WCHAR_MAX__ = 2147483647;
	auto __WCHAR_MIN__()()
	{
		return -__WCHAR_MAX__ - 1;
	}
	enum uint __WINT_MAX__ = 4294967295u;
	enum uint __WINT_MIN__ = 0u;
	enum long __PTRDIFF_MAX__ = 9223372036854775807L;
	enum ulong __SIZE_MAX__ = 18446744073709551615LU;
	enum int __SCHAR_WIDTH__ = 8;
	enum int __SHRT_WIDTH__ = 16;
	enum int __INT_WIDTH__ = 32;
	enum int __LONG_WIDTH__ = 64;
	enum int __LONG_LONG_WIDTH__ = 64;
	enum int __WCHAR_WIDTH__ = 32;
	enum int __WINT_WIDTH__ = 32;
	enum int __PTRDIFF_WIDTH__ = 64;
	enum int __SIZE_WIDTH__ = 64;
	enum long __INTMAX_MAX__ = 9223372036854775807L;
	enum ulong __UINTMAX_MAX__ = 18446744073709551615LU;
	enum int __INTMAX_WIDTH__ = 64;
	enum int __SIG_ATOMIC_MAX__ = 2147483647;
	auto __SIG_ATOMIC_MIN__()()
	{
		return -__SIG_ATOMIC_MAX__ - 1;
	}
	enum int __SIG_ATOMIC_WIDTH__ = 32;
	enum int __INT8_MAX__ = 127;
	enum int __INT16_MAX__ = 32767;
	enum int __INT32_MAX__ = 2147483647;
	enum long __INT64_MAX__ = 9223372036854775807L;
	enum int __UINT8_MAX__ = 255;
	enum int __UINT16_MAX__ = 65535;
	enum uint __UINT32_MAX__ = 4294967295u;
	enum ulong __UINT64_MAX__ = 18446744073709551615LU;
	enum int __INT_LEAST8_MAX__ = 127;
	auto __INT8_C(__MP3)(__MP3 c)
	{
		return c;
	}
	enum int __INT_LEAST8_WIDTH__ = 8;
	enum int __INT_LEAST16_MAX__ = 32767;
	auto __INT16_C(__MP4)(__MP4 c)
	{
		return c;
	}
	enum int __INT_LEAST16_WIDTH__ = 16;
	enum int __INT_LEAST32_MAX__ = 2147483647;
	auto __INT32_C(__MP5)(__MP5 c)
	{
		return c;
	}
	enum int __INT_LEAST32_WIDTH__ = 32;
	enum long __INT_LEAST64_MAX__ = 9223372036854775807L;
	enum int __INT_LEAST64_WIDTH__ = 64;
	enum int __UINT_LEAST8_MAX__ = 255;
	auto __UINT8_C(__MP7)(__MP7 c)
	{
		return c;
	}
	enum int __UINT_LEAST16_MAX__ = 65535;
	auto __UINT16_C(__MP8)(__MP8 c)
	{
		return c;
	}
	enum uint __UINT_LEAST32_MAX__ = 4294967295u;
	enum ulong __UINT_LEAST64_MAX__ = 18446744073709551615LU;
	enum int __INT_FAST8_MAX__ = 127;
	enum int __INT_FAST8_WIDTH__ = 8;
	enum long __INT_FAST16_MAX__ = 9223372036854775807L;
	enum int __INT_FAST16_WIDTH__ = 64;
	enum long __INT_FAST32_MAX__ = 9223372036854775807L;
	enum int __INT_FAST32_WIDTH__ = 64;
	enum long __INT_FAST64_MAX__ = 9223372036854775807L;
	enum int __INT_FAST64_WIDTH__ = 64;
	enum int __UINT_FAST8_MAX__ = 255;
	enum ulong __UINT_FAST16_MAX__ = 18446744073709551615LU;
	enum ulong __UINT_FAST32_MAX__ = 18446744073709551615LU;
	enum ulong __UINT_FAST64_MAX__ = 18446744073709551615LU;
	enum long __INTPTR_MAX__ = 9223372036854775807L;
	enum int __INTPTR_WIDTH__ = 64;
	enum ulong __UINTPTR_MAX__ = 18446744073709551615LU;
	enum int __GCC_IEC_559 = 2;
	enum int __GCC_IEC_559_COMPLEX = 2;
	enum int __FLT_EVAL_METHOD__ = 0;
	enum int __FLT_EVAL_METHOD_TS_18661_3__ = 0;
	enum int __DEC_EVAL_METHOD__ = 2;
	enum int __FLT_RADIX__ = 2;
	enum int __FLT_MANT_DIG__ = 24;
	enum int __FLT_DIG__ = 6;
	auto __FLT_MIN_EXP__()()
	{
		return -125;
	}
	auto __FLT_MIN_10_EXP__()()
	{
		return -37;
	}
	enum int __FLT_MAX_EXP__ = 128;
	enum int __FLT_MAX_10_EXP__ = 38;
	enum int __FLT_DECIMAL_DIG__ = 9;
	enum float __FLT_MAX__ = 0xf.fffffp+124F;
	enum float __FLT_NORM_MAX__ = 0xf.fffffp+124F;
	enum float __FLT_MIN__ = 0x8p-129F;
	enum float __FLT_EPSILON__ = 0x8p-26F;
	enum float __FLT_DENORM_MIN__ = 0x8p-152F;
	enum int __FLT_HAS_DENORM__ = 1;
	enum int __FLT_HAS_INFINITY__ = 1;
	enum int __FLT_HAS_QUIET_NAN__ = 1;
	enum int __FLT_IS_IEC_60559__ = 2;
	enum int __DBL_MANT_DIG__ = 53;
	enum int __DBL_DIG__ = 15;
	auto __DBL_MIN_EXP__()()
	{
		return -1021;
	}
	auto __DBL_MIN_10_EXP__()()
	{
		return -307;
	}
	enum int __DBL_MAX_EXP__ = 1024;
	enum int __DBL_MAX_10_EXP__ = 308;
	enum int __DBL_DECIMAL_DIG__ = 17;
	auto __DBL_MAX__()()
	{
		return cast(double)0xf.ffffffffffff8p+1020L;
	}
	auto __DBL_NORM_MAX__()()
	{
		return cast(double)0xf.ffffffffffff8p+1020L;
	}
	auto __DBL_MIN__()()
	{
		return cast(double)0x8p-1025L;
	}
	auto __DBL_EPSILON__()()
	{
		return cast(double)0x8p-55L;
	}
	auto __DBL_DENORM_MIN__()()
	{
		return cast(double)0x8p-1077L;
	}
	enum int __DBL_HAS_DENORM__ = 1;
	enum int __DBL_HAS_INFINITY__ = 1;
	enum int __DBL_HAS_QUIET_NAN__ = 1;
	enum int __DBL_IS_IEC_60559__ = 2;
	enum int __LDBL_MANT_DIG__ = 64;
	enum int __LDBL_DIG__ = 18;
	auto __LDBL_MIN_EXP__()()
	{
		return -16381;
	}
	auto __LDBL_MIN_10_EXP__()()
	{
		return -4931;
	}
	enum int __LDBL_MAX_EXP__ = 16384;
	enum int __LDBL_MAX_10_EXP__ = 4932;
	enum int __DECIMAL_DIG__ = 21;
	enum int __LDBL_DECIMAL_DIG__ = 21;
	enum real __LDBL_MAX__ = 0xf.fffffffffffffffp+16380L;
	enum real __LDBL_NORM_MAX__ = 0xf.fffffffffffffffp+16380L;
	enum real __LDBL_MIN__ = 0x8p-16385L;
	enum real __LDBL_EPSILON__ = 0x8p-66L;
	enum real __LDBL_DENORM_MIN__ = 3.6452e-4951L;
	enum int __LDBL_HAS_DENORM__ = 1;
	enum int __LDBL_HAS_INFINITY__ = 1;
	enum int __LDBL_HAS_QUIET_NAN__ = 1;
	enum int __LDBL_IS_IEC_60559__ = 2;
	enum int __FLT32_MANT_DIG__ = 24;
	enum int __FLT32_DIG__ = 6;
	auto __FLT32_MIN_EXP__()()
	{
		return -125;
	}
	auto __FLT32_MIN_10_EXP__()()
	{
		return -37;
	}
	enum int __FLT32_MAX_EXP__ = 128;
	enum int __FLT32_MAX_10_EXP__ = 38;
	enum int __FLT32_DECIMAL_DIG__ = 9;
	enum int __FLT32_HAS_DENORM__ = 1;
	enum int __FLT32_HAS_INFINITY__ = 1;
	enum int __FLT32_HAS_QUIET_NAN__ = 1;
	enum int __FLT32_IS_IEC_60559__ = 2;
	enum int __FLT64_MANT_DIG__ = 53;
	enum int __FLT64_DIG__ = 15;
	auto __FLT64_MIN_EXP__()()
	{
		return -1021;
	}
	auto __FLT64_MIN_10_EXP__()()
	{
		return -307;
	}
	enum int __FLT64_MAX_EXP__ = 1024;
	enum int __FLT64_MAX_10_EXP__ = 308;
	enum int __FLT64_DECIMAL_DIG__ = 17;
	enum int __FLT64_HAS_DENORM__ = 1;
	enum int __FLT64_HAS_INFINITY__ = 1;
	enum int __FLT64_HAS_QUIET_NAN__ = 1;
	enum int __FLT64_IS_IEC_60559__ = 2;
	enum int __FLT128_MANT_DIG__ = 113;
	enum int __FLT128_DIG__ = 33;
	auto __FLT128_MIN_EXP__()()
	{
		return -16381;
	}
	auto __FLT128_MIN_10_EXP__()()
	{
		return -4931;
	}
	enum int __FLT128_MAX_EXP__ = 16384;
	enum int __FLT128_MAX_10_EXP__ = 4932;
	enum int __FLT128_DECIMAL_DIG__ = 36;
	enum int __FLT128_HAS_DENORM__ = 1;
	enum int __FLT128_HAS_INFINITY__ = 1;
	enum int __FLT128_HAS_QUIET_NAN__ = 1;
	enum int __FLT128_IS_IEC_60559__ = 2;
	enum int __FLT32X_MANT_DIG__ = 53;
	enum int __FLT32X_DIG__ = 15;
	auto __FLT32X_MIN_EXP__()()
	{
		return -1021;
	}
	auto __FLT32X_MIN_10_EXP__()()
	{
		return -307;
	}
	enum int __FLT32X_MAX_EXP__ = 1024;
	enum int __FLT32X_MAX_10_EXP__ = 308;
	enum int __FLT32X_DECIMAL_DIG__ = 17;
	enum int __FLT32X_HAS_DENORM__ = 1;
	enum int __FLT32X_HAS_INFINITY__ = 1;
	enum int __FLT32X_HAS_QUIET_NAN__ = 1;
	enum int __FLT32X_IS_IEC_60559__ = 2;
	enum int __FLT64X_MANT_DIG__ = 64;
	enum int __FLT64X_DIG__ = 18;
	auto __FLT64X_MIN_EXP__()()
	{
		return -16381;
	}
	auto __FLT64X_MIN_10_EXP__()()
	{
		return -4931;
	}
	enum int __FLT64X_MAX_EXP__ = 16384;
	enum int __FLT64X_MAX_10_EXP__ = 4932;
	enum int __FLT64X_DECIMAL_DIG__ = 21;
	enum int __FLT64X_HAS_DENORM__ = 1;
	enum int __FLT64X_HAS_INFINITY__ = 1;
	enum int __FLT64X_HAS_QUIET_NAN__ = 1;
	enum int __FLT64X_IS_IEC_60559__ = 2;
	enum int __DEC32_MANT_DIG__ = 7;
	auto __DEC32_MIN_EXP__()()
	{
		return -94;
	}
	enum int __DEC32_MAX_EXP__ = 97;
	enum int __DEC64_MANT_DIG__ = 16;
	auto __DEC64_MIN_EXP__()()
	{
		return -382;
	}
	enum int __DEC64_MAX_EXP__ = 385;
	enum int __DEC128_MANT_DIG__ = 34;
	auto __DEC128_MIN_EXP__()()
	{
		return -6142;
	}
	enum int __DEC128_MAX_EXP__ = 6145;
	enum int __GNUC_STDC_INLINE__ = 1;
	enum int __NO_INLINE__ = 1;
	enum int __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
	enum int __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
	enum int __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
	enum int __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
	enum int __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_INT_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_LONG_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
	enum int __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
	enum int __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
	enum int __HAVE_SPECULATION_SAFE_VALUE = 1;
	enum int __GCC_HAVE_DWARF2_CFI_ASM = 1;
	enum int __PRAGMA_REDEFINE_EXTNAME = 1;
	enum int __SSP_STRONG__ = 3;
	enum int __SIZEOF_INT128__ = 16;
	enum int __SIZEOF_WCHAR_T__ = 4;
	enum int __SIZEOF_WINT_T__ = 4;
	enum int __SIZEOF_PTRDIFF_T__ = 8;
	enum int __amd64 = 1;
	enum int __amd64__ = 1;
	enum int __x86_64 = 1;
	enum int __x86_64__ = 1;
	enum int __SIZEOF_FLOAT80__ = 16;
	enum int __SIZEOF_FLOAT128__ = 16;
	enum int __ATOMIC_HLE_ACQUIRE = 65536;
	enum int __ATOMIC_HLE_RELEASE = 131072;
	enum int __GCC_ASM_FLAG_OUTPUTS__ = 1;
	enum int __k8 = 1;
	enum int __k8__ = 1;
	enum int __code_model_small__ = 1;
	enum int __MMX__ = 1;
	enum int __SSE__ = 1;
	enum int __SSE2__ = 1;
	enum int __FXSR__ = 1;
	enum int __SSE_MATH__ = 1;
	enum int __SSE2_MATH__ = 1;
	enum int __MMX_WITH_SSE__ = 1;
	enum int __SEG_FS = 1;
	enum int __SEG_GS = 1;
	enum int __CET__ = 3;
	enum int __gnu_linux__ = 1;
	enum int __linux = 1;
	enum int __linux__ = 1;
	enum int linux = 1;
	enum int __unix = 1;
	enum int __unix__ = 1;
	enum int unix = 1;
	enum int __ELF__ = 1;
	enum int __DECIMAL_BID_FORMAT__ = 1;
	enum int _STDC_PREDEF_H = 1;
	enum int __STDC_IEC_559__ = 1;
	enum long __STDC_IEC_60559_BFP__ = 201404L;
	enum int __STDC_IEC_559_COMPLEX__ = 1;
	enum long __STDC_IEC_60559_COMPLEX__ = 201404L;
	enum long __STDC_ISO_10646__ = 201706L;
	enum int __IMPORTC__ = 1;
	auto __builtin_isnan(__MP11)(__MP11 x)
	{
		return isnan(x);
	}
	auto __builtin_isfinite(__MP12)(__MP12 x)
	{
		return finite(x);
	}
	auto __builtin_alloca(__MP13)(__MP13 x)
	{
		return alloca(x);
	}
	auto __has_feature(__MP14)(__MP14 x)
	{
		return 0;
	}
	auto __has_extension(__MP15)(__MP15 x)
	{
		return 0;
	}
	enum int __STDC_NO_VLA__ = 1;
	enum int _LIBC_LIMITS_H_ = 1;
	enum int _FEATURES_H = 1;
	auto __GNUC_PREREQ(__MP20, __MP21)(__MP20 maj, __MP21 min)
	{
		return (__GNUC__ << 16) + __GNUC_MINOR__ >= (maj << 16) + min;
	}
	auto __glibc_clang_prereq(__MP22, __MP23)(__MP22 maj, __MP23 min)
	{
		return 0;
	}
	enum int _DEFAULT_SOURCE = 1;
	enum int __GLIBC_USE_ISOC2X = 0;
	enum int __USE_ISOC11 = 1;
	enum int __USE_ISOC99 = 1;
	enum int __USE_ISOC95 = 1;
	enum int __USE_POSIX_IMPLICITLY = 1;
	enum int _POSIX_SOURCE = 1;
	enum long _POSIX_C_SOURCE = 200809L;
	enum int __USE_POSIX = 1;
	enum int __USE_POSIX2 = 1;
	enum int __USE_POSIX199309 = 1;
	enum int __USE_POSIX199506 = 1;
	enum int __USE_XOPEN2K = 1;
	enum int __USE_XOPEN2K8 = 1;
	enum int _ATFILE_SOURCE = 1;
	enum int __WORDSIZE = 64;
	enum int __WORDSIZE_TIME64_COMPAT32 = 1;
	enum int __SYSCALL_WORDSIZE = 64;
	enum int __USE_MISC = 1;
	enum int __USE_ATFILE = 1;
	enum int __USE_FORTIFY_LEVEL = 0;
	enum int __GLIBC_USE_DEPRECATED_GETS = 0;
	enum int __GLIBC_USE_DEPRECATED_SCANF = 0;
	enum int __GNU_LIBRARY__ = 6;
	enum int __GLIBC__ = 2;
	enum int __GLIBC_MINOR__ = 35;
	auto __GLIBC_PREREQ(__MP25, __MP26)(__MP25 maj, __MP26 min)
	{
		return (__GLIBC__ << 16) + __GLIBC_MINOR__ >= (maj << 16) + min;
	}
	enum int _SYS_CDEFS_H = 1;
	auto __glibc_has_attribute(__MP27)(__MP27 attr)
	{
		return __has_attribute(attr);
	}
	auto __glibc_has_builtin(__MP28)(__MP28 name)
	{
		return __has_builtin(name);
	}
	auto __glibc_has_extension(__MP29)(__MP29 ext)
	{
		return __has_extension(ext);
	}
	auto __P(__MP32)(__MP32 args)
	{
		return args;
	}
	auto __PMT(__MP33)(__MP33 args)
	{
		return args;
	}
	auto __bos(__MP37)(__MP37 ptr)
	{
		return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > 1);
	}
	auto __bos0(__MP38)(__MP38 ptr)
	{
		return __builtin_object_size(ptr, 0);
	}
	auto __glibc_objsize0(__MP39)(__MP39 __o)
	{
		return __bos0(__o);
	}
	auto __glibc_objsize(__MP40)(__MP40 __o)
	{
		return __bos(__o);
	}
	auto __glibc_safe_len_cond(__MP41, __MP42, __MP43)(__MP41 __l, __MP42 __s, __MP43 __osz)
	{
		return __l <= __osz / __s;
	}
	auto __glibc_safe_or_unknown_len(__MP45, __MP46, __MP47)(__MP45 __l, __MP46 __s, __MP47 __osz)
	{
		return __glibc_unsigned_or_positive(__l) && __builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) && __glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz);
	}
	auto __glibc_unsafe_len(__MP48, __MP49, __MP50)(__MP48 __l, __MP49 __s, __MP50 __osz)
	{
		return __glibc_unsigned_or_positive(__l) && __builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) && !__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz);
	}
	enum int __glibc_c99_flexarr_available = 1;
	auto __ASMNAME(__MP63)(__MP63 cname)
	{
		return __ASMNAME2(__USER_LABEL_PREFIX__, cname);
	}
	auto __nonnull(__MP73)(__MP73 params)
	{
		return __attribute_nonnull__(params);
	}
	auto __va_arg_pack()()
	{
		return __builtin_va_arg_pack();
	}
	auto __va_arg_pack_len()()
	{
		return __builtin_va_arg_pack_len();
	}
	auto __glibc_unlikely(__MP74)(__MP74 cond)
	{
		return __builtin_expect(cond, 0);
	}
	auto __glibc_likely(__MP75)(__MP75 cond)
	{
		return __builtin_expect(cond, 1);
	}
	enum int __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = 0;
	auto __REDIRECT_LDBL(__MP89, __MP90, __MP91)(__MP89 name, __MP90 proto, __MP91 alias)
	{
		return __REDIRECT(name, proto, alias);
	}
	auto __REDIRECT_NTH_LDBL(__MP92, __MP93, __MP94)(__MP92 name, __MP93 proto, __MP94 alias)
	{
		return __REDIRECT_NTH(name, proto, alias);
	}
	enum int __HAVE_GENERIC_SELECTION = 1;
	auto __fortified_attr_access(__MP98, __MP99, __MP100)(__MP98 a, __MP99 o, __MP100 s)
	{
		return __attr_access((a , o , s));
	}
	enum int __GLIBC_USE_LIB_EXT2 = 0;
	enum int __GLIBC_USE_IEC_60559_BFP_EXT = 0;
	enum int __GLIBC_USE_IEC_60559_BFP_EXT_C2X = 0;
	enum int __GLIBC_USE_IEC_60559_EXT = 0;
	enum int __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;
	enum int __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = 0;
	enum int __GLIBC_USE_IEC_60559_TYPES_EXT = 0;
	enum int MB_LEN_MAX = 16;
	auto LLONG_MIN()()
	{
		return -LLONG_MAX - 1L;
	}
	auto ULLONG_MAX()()
	{
		return LLONG_MAX * 2LU + 1LU;
	}
	enum int _BITS_POSIX1_LIM_H = 1;
	enum int _POSIX_AIO_LISTIO_MAX = 2;
	enum int _POSIX_AIO_MAX = 1;
	enum int _POSIX_ARG_MAX = 4096;
	enum int _POSIX_CHILD_MAX = 25;
	enum int _POSIX_DELAYTIMER_MAX = 32;
	enum int _POSIX_HOST_NAME_MAX = 255;
	enum int _POSIX_LINK_MAX = 8;
	enum int _POSIX_LOGIN_NAME_MAX = 9;
	enum int _POSIX_MAX_CANON = 255;
	enum int _POSIX_MAX_INPUT = 255;
	enum int _POSIX_MQ_OPEN_MAX = 8;
	enum int _POSIX_MQ_PRIO_MAX = 32;
	enum int _POSIX_NAME_MAX = 14;
	enum int _POSIX_NGROUPS_MAX = 8;
	enum int _POSIX_OPEN_MAX = 20;
	enum int _POSIX_PATH_MAX = 256;
	enum int _POSIX_PIPE_BUF = 512;
	enum int _POSIX_RE_DUP_MAX = 255;
	enum int _POSIX_RTSIG_MAX = 8;
	enum int _POSIX_SEM_NSEMS_MAX = 256;
	enum int _POSIX_SEM_VALUE_MAX = 32767;
	enum int _POSIX_SIGQUEUE_MAX = 32;
	enum int _POSIX_SSIZE_MAX = 32767;
	enum int _POSIX_STREAM_MAX = 8;
	enum int _POSIX_SYMLINK_MAX = 255;
	enum int _POSIX_SYMLOOP_MAX = 8;
	enum int _POSIX_TIMER_MAX = 32;
	enum int _POSIX_TTY_NAME_MAX = 9;
	enum int _POSIX_TZNAME_MAX = 6;
	enum int _POSIX_CLOCKRES_MIN = 20000000;
	enum int NR_OPEN = 1024;
	enum int NGROUPS_MAX = 65536;
	enum int ARG_MAX = 131072;
	enum int LINK_MAX = 127;
	enum int MAX_CANON = 255;
	enum int MAX_INPUT = 255;
	enum int NAME_MAX = 255;
	enum int PATH_MAX = 4096;
	enum int PIPE_BUF = 4096;
	enum int XATTR_NAME_MAX = 255;
	enum int XATTR_SIZE_MAX = 65536;
	enum int XATTR_LIST_MAX = 65536;
	enum int RTSIG_MAX = 32;
	enum int _POSIX_THREAD_KEYS_MAX = 128;
	enum int PTHREAD_KEYS_MAX = 1024;
	enum int _POSIX_THREAD_DESTRUCTOR_ITERATIONS = 4;
	enum int _POSIX_THREAD_THREADS_MAX = 64;
	enum int AIO_PRIO_DELTA_MAX = 20;
	enum int PTHREAD_STACK_MIN = 16384;
	enum int DELAYTIMER_MAX = 2147483647;
	enum int TTY_NAME_MAX = 32;
	enum int LOGIN_NAME_MAX = 256;
	enum int HOST_NAME_MAX = 64;
	enum int MQ_PRIO_MAX = 32768;
	auto SEM_VALUE_MAX()()
	{
		return 2147483647;
	}
	enum int _BITS_POSIX2_LIM_H = 1;
	enum int _POSIX2_BC_BASE_MAX = 99;
	enum int _POSIX2_BC_DIM_MAX = 2048;
	enum int _POSIX2_BC_SCALE_MAX = 99;
	enum int _POSIX2_BC_STRING_MAX = 1000;
	enum int _POSIX2_COLL_WEIGHTS_MAX = 2;
	enum int _POSIX2_EXPR_NEST_MAX = 32;
	enum int _POSIX2_LINE_MAX = 2048;
	enum int _POSIX2_RE_DUP_MAX = 255;
	enum int _POSIX2_CHARCLASS_NAME_MAX = 14;
	enum int COLL_WEIGHTS_MAX = 255;
	enum int CHARCLASS_NAME_MAX = 2048;
	auto RE_DUP_MAX()()
	{
		return 32767;
	}
	auto SCHAR_MIN()()
	{
		return -SCHAR_MAX - 1;
	}
	auto UCHAR_MAX()()
	{
		return SCHAR_MAX * 2 + 1;
	}
	auto SHRT_MIN()()
	{
		return -SHRT_MAX - 1;
	}
	auto USHRT_MAX()()
	{
		return SHRT_MAX * 2 + 1;
	}
	auto INT_MIN()()
	{
		return -INT_MAX - 1;
	}
	auto UINT_MAX()()
	{
		return INT_MAX * 2u + 1u;
	}
	auto LONG_MIN()()
	{
		return -LONG_MAX - 1L;
	}
	auto ULONG_MAX()()
	{
		return LONG_MAX * 2LU + 1LU;
	}
	auto NULL()()
	{
		return cast(void*)0;
	}
	auto offsetof(__MP104, __MP105)(__MP104 TYPE, __MP105 MEMBER)
	{
		return __builtin_offsetof(TYPE, MEMBER);
	}
	enum int ZSTD_VERSION_MAJOR = 1;
	enum int ZSTD_VERSION_MINOR = 5;
	enum int ZSTD_VERSION_RELEASE = 6;
	auto ZSTD_VERSION_NUMBER()()
	{
		return ZSTD_VERSION_MAJOR * 100 * 100 + ZSTD_VERSION_MINOR * 100 + ZSTD_VERSION_RELEASE;
	}
	auto ZSTD_EXPAND_AND_QUOTE(__MP108)(__MP108 str)
	{
		return ZSTD_QUOTE(str);
	}
	enum int ZSTD_CLEVEL_DEFAULT = 3;
	enum uint ZSTD_MAGICNUMBER = 4247762216u;
	enum uint ZSTD_MAGIC_DICTIONARY = 3962610743u;
	enum int ZSTD_MAGIC_SKIPPABLE_START = 407710288;
	enum uint ZSTD_MAGIC_SKIPPABLE_MASK = 4294967280u;
	enum int ZSTD_BLOCKSIZELOG_MAX = 17;
	auto ZSTD_BLOCKSIZE_MAX()()
	{
		return 1 << ZSTD_BLOCKSIZELOG_MAX;
	}
	auto ZSTD_CONTENTSIZE_UNKNOWN()()
	{
		return 0LU - 1;
	}
	auto ZSTD_CONTENTSIZE_ERROR()()
	{
		return 0LU - 2;
	}
	auto ZSTD_MAX_INPUT_SIZE()()
	{
		return (ulong).sizeof == 8 ? 18374966859414961920LU : 4278255360u;
	}
	auto ZSTD_COMPRESSBOUND(__MP109)(__MP109 srcSize)
	{
		return cast(ulong)srcSize >= ZSTD_MAX_INPUT_SIZE ? 0 : srcSize + (srcSize >> 8) + (srcSize < 128 << 10 ? (128 << 10) - srcSize >> 11 : 0);
	}
}
import __builtins;

