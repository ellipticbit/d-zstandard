module zstd;
public:

extern (C)
{
	alias __uint32_t = uint;
	alias __uint64_t = ulong;
	alias errno_t = int;
	nothrow @nogc __uint32_t ZSTD_versionNumber();
	nothrow @nogc const(char)* ZSTD_versionString();
	nothrow @nogc size_t ZSTD_compress(void* dst, size_t dstCapacity, const(void)* src, size_t srcSize, errno_t compressionLevel);
	nothrow @nogc size_t ZSTD_decompress(void* dst, size_t dstCapacity, const(void)* src, size_t compressedSize);
	nothrow @nogc __uint64_t ZSTD_getFrameContentSize(const(void)* src, size_t srcSize);
	deprecated("Replaced by ZSTD_getFrameContentSize") deprecated nothrow @nogc __uint64_t ZSTD_getDecompressedSize(const(void)* src, size_t srcSize);
	nothrow @nogc size_t ZSTD_findFrameCompressedSize(const(void)* src, size_t srcSize);
	nothrow @nogc size_t ZSTD_compressBound(size_t srcSize);
	nothrow @nogc __uint32_t ZSTD_isError(size_t code);
	nothrow @nogc const(char)* ZSTD_getErrorName(size_t code);
	nothrow @nogc errno_t ZSTD_minCLevel();
	nothrow @nogc errno_t ZSTD_maxCLevel();
	nothrow @nogc errno_t ZSTD_defaultCLevel();
	struct ZSTD_CCtx_s;
	alias ZSTD_CCtx = const(ZSTD_CCtx_s);
	nothrow @nogc ZSTD_CCtx* ZSTD_createCCtx();
	nothrow @nogc size_t ZSTD_freeCCtx(ZSTD_CCtx* cctx);
	nothrow @nogc size_t ZSTD_compressCCtx(ZSTD_CCtx* cctx, void* dst, size_t dstCapacity, const(void)* src, size_t srcSize, errno_t compressionLevel);
	struct ZSTD_DCtx_s;
	alias ZSTD_DCtx = const(ZSTD_DCtx_s);
	nothrow @nogc ZSTD_DCtx* ZSTD_createDCtx();
	nothrow @nogc size_t ZSTD_freeDCtx(ZSTD_DCtx* dctx);
	nothrow @nogc size_t ZSTD_decompressDCtx(ZSTD_DCtx* dctx, void* dst, size_t dstCapacity, const(void)* src, size_t srcSize);
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
		size_t error = void;
		errno_t lowerBound = void;
		errno_t upperBound = void;
	}
	nothrow @nogc ZSTD_bounds ZSTD_cParam_getBounds(ZSTD_cParameter cParam);
	nothrow @nogc size_t ZSTD_CCtx_setParameter(ZSTD_CCtx* cctx, ZSTD_cParameter param, errno_t value);
	nothrow @nogc size_t ZSTD_CCtx_setPledgedSrcSize(ZSTD_CCtx* cctx, __uint64_t pledgedSrcSize);
	enum ZSTD_ResetDirective
	{
		ZSTD_reset_session_only = 1,
		ZSTD_reset_parameters = 2,
		ZSTD_reset_session_and_parameters = 3,
	}
	alias ZSTD_reset_session_only = ZSTD_ResetDirective.ZSTD_reset_session_only;
	alias ZSTD_reset_parameters = ZSTD_ResetDirective.ZSTD_reset_parameters;
	alias ZSTD_reset_session_and_parameters = ZSTD_ResetDirective.ZSTD_reset_session_and_parameters;
	nothrow @nogc size_t ZSTD_CCtx_reset(ZSTD_CCtx* cctx, ZSTD_ResetDirective reset);
	nothrow @nogc size_t ZSTD_compress2(ZSTD_CCtx* cctx, void* dst, size_t dstCapacity, const(void)* src, size_t srcSize);
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
	nothrow @nogc ZSTD_bounds ZSTD_dParam_getBounds(ZSTD_dParameter dParam);
	nothrow @nogc size_t ZSTD_DCtx_setParameter(ZSTD_DCtx* dctx, ZSTD_dParameter param, errno_t value);
	nothrow @nogc size_t ZSTD_DCtx_reset(ZSTD_DCtx* dctx, ZSTD_ResetDirective reset);
	struct ZSTD_inBuffer_s
	{
		const(void)* src = void;
		size_t size = void;
		size_t pos = void;
	}
	alias ZSTD_inBuffer = ZSTD_inBuffer_s;
	struct ZSTD_outBuffer_s
	{
		void* dst = void;
		size_t size = void;
		size_t pos = void;
	}
	alias ZSTD_outBuffer = ZSTD_outBuffer_s;
	alias ZSTD_CStream = const(ZSTD_CCtx_s);
	nothrow @nogc ZSTD_CStream* ZSTD_createCStream();
	nothrow @nogc size_t ZSTD_freeCStream(ZSTD_CStream* zcs);
	enum ZSTD_EndDirective
	{
		ZSTD_e_continue = 0,
		ZSTD_e_flush = 1,
		ZSTD_e_end = 2,
	}
	alias ZSTD_e_continue = ZSTD_EndDirective.ZSTD_e_continue;
	alias ZSTD_e_flush = ZSTD_EndDirective.ZSTD_e_flush;
	alias ZSTD_e_end = ZSTD_EndDirective.ZSTD_e_end;
	nothrow @nogc size_t ZSTD_compressStream2(ZSTD_CCtx* cctx, ZSTD_outBuffer* output, ZSTD_inBuffer* input, ZSTD_EndDirective endOp);
	nothrow @nogc size_t ZSTD_CStreamInSize();
	nothrow @nogc size_t ZSTD_CStreamOutSize();
	nothrow @nogc size_t ZSTD_initCStream(ZSTD_CStream* zcs, errno_t compressionLevel);
	nothrow @nogc size_t ZSTD_compressStream(ZSTD_CStream* zcs, ZSTD_outBuffer* output, ZSTD_inBuffer* input);
	nothrow @nogc size_t ZSTD_flushStream(ZSTD_CStream* zcs, ZSTD_outBuffer* output);
	nothrow @nogc size_t ZSTD_endStream(ZSTD_CStream* zcs, ZSTD_outBuffer* output);
	alias ZSTD_DStream = const(ZSTD_DCtx_s);
	nothrow @nogc ZSTD_DStream* ZSTD_createDStream();
	nothrow @nogc size_t ZSTD_freeDStream(ZSTD_DStream* zds);
	nothrow @nogc size_t ZSTD_initDStream(ZSTD_DStream* zds);
	nothrow @nogc size_t ZSTD_decompressStream(ZSTD_DStream* zds, ZSTD_outBuffer* output, ZSTD_inBuffer* input);
	nothrow @nogc size_t ZSTD_DStreamInSize();
	nothrow @nogc size_t ZSTD_DStreamOutSize();
	nothrow @nogc size_t ZSTD_compress_usingDict(ZSTD_CCtx* ctx, void* dst, size_t dstCapacity, const(void)* src, size_t srcSize, const(void)* dict, size_t dictSize, errno_t compressionLevel);
	nothrow @nogc size_t ZSTD_decompress_usingDict(ZSTD_DCtx* dctx, void* dst, size_t dstCapacity, const(void)* src, size_t srcSize, const(void)* dict, size_t dictSize);
	struct ZSTD_CDict_s;
	alias ZSTD_CDict = const(ZSTD_CDict_s);
	nothrow @nogc ZSTD_CDict* ZSTD_createCDict(const(void)* dictBuffer, size_t dictSize, errno_t compressionLevel);
	nothrow @nogc size_t ZSTD_freeCDict(ZSTD_CDict* CDict);
	nothrow @nogc size_t ZSTD_compress_usingCDict(ZSTD_CCtx* cctx, void* dst, size_t dstCapacity, const(void)* src, size_t srcSize, ZSTD_CDict* cdict);
	struct ZSTD_DDict_s;
	alias ZSTD_DDict = const(ZSTD_DDict_s);
	nothrow @nogc ZSTD_DDict* ZSTD_createDDict(const(void)* dictBuffer, size_t dictSize);
	nothrow @nogc size_t ZSTD_freeDDict(ZSTD_DDict* ddict);
	nothrow @nogc size_t ZSTD_decompress_usingDDict(ZSTD_DCtx* dctx, void* dst, size_t dstCapacity, const(void)* src, size_t srcSize, ZSTD_DDict* ddict);
	nothrow @nogc __uint32_t ZSTD_getDictID_fromDict(const(void)* dict, size_t dictSize);
	nothrow @nogc __uint32_t ZSTD_getDictID_fromCDict(ZSTD_CDict* cdict);
	nothrow @nogc __uint32_t ZSTD_getDictID_fromDDict(ZSTD_DDict* ddict);
	nothrow @nogc __uint32_t ZSTD_getDictID_fromFrame(const(void)* src, size_t srcSize);
	nothrow @nogc size_t ZSTD_CCtx_loadDictionary(ZSTD_CCtx* cctx, const(void)* dict, size_t dictSize);
	nothrow @nogc size_t ZSTD_CCtx_refCDict(ZSTD_CCtx* cctx, ZSTD_CDict* cdict);
	nothrow @nogc size_t ZSTD_CCtx_refPrefix(ZSTD_CCtx* cctx, const(void)* prefix, size_t prefixSize);
	nothrow @nogc size_t ZSTD_DCtx_loadDictionary(ZSTD_DCtx* dctx, const(void)* dict, size_t dictSize);
	nothrow @nogc size_t ZSTD_DCtx_refDDict(ZSTD_DCtx* dctx, ZSTD_DDict* ddict);
	nothrow @nogc size_t ZSTD_DCtx_refPrefix(ZSTD_DCtx* dctx, const(void)* prefix, size_t prefixSize);
	nothrow @nogc size_t ZSTD_sizeof_CCtx(ZSTD_CCtx* cctx);
	nothrow @nogc size_t ZSTD_sizeof_DCtx(ZSTD_DCtx* dctx);
	nothrow @nogc size_t ZSTD_sizeof_CStream(ZSTD_CStream* zcs);
	nothrow @nogc size_t ZSTD_sizeof_DStream(ZSTD_DStream* zds);
	nothrow @nogc size_t ZSTD_sizeof_CDict(ZSTD_CDict* cdict);
	nothrow @nogc size_t ZSTD_sizeof_DDict(ZSTD_DDict* ddict);
	enum errno_t ZSTD_VERSION_RELEASE = 6;
	enum errno_t ZSTD_CLEVEL_DEFAULT = 3;
	enum errno_t ZSTD_VERSION_MINOR = 5;
	enum errno_t ZSTD_BLOCKSIZELOG_MAX = 17;
	auto ZSTD_VERSION_NUMBER()()
	{
		return ZSTD_VERSION_MAJOR * 100 * 100 + ZSTD_VERSION_MINOR * 100 + ZSTD_VERSION_RELEASE;
	}
	enum errno_t ZSTD_VERSION_MAJOR = 1;
	auto ZSTD_CONTENTSIZE_ERROR()()
	{
		return 0LU - 2;
	}
	auto ZSTD_MAX_INPUT_SIZE()()
	{
		return (size_t).sizeof == 8 ? 18374966859414961920LU : 4278255360u;
	}
	enum __uint32_t ZSTD_MAGIC_SKIPPABLE_MASK = 4294967280u;
	enum __uint32_t ZSTD_MAGICNUMBER = 4247762216u;
	auto ZSTD_COMPRESSBOUND(__MP1356)(__MP1356 srcSize)
	{
		return cast(size_t)srcSize >= ZSTD_MAX_INPUT_SIZE ? 0 : srcSize + (srcSize >> 8) + (srcSize < 128 << 10 ? (128 << 10) - srcSize >> 11 : 0);
	}
	auto ZSTD_BLOCKSIZE_MAX()()
	{
		return 1 << ZSTD_BLOCKSIZELOG_MAX;
	}
	enum errno_t ZSTD_MAGIC_SKIPPABLE_START = 407710288;
	enum __uint32_t ZSTD_MAGIC_DICTIONARY = 3962610743u;
	auto ZSTD_CONTENTSIZE_UNKNOWN()()
	{
		return 0LU - 1;
	}
}
