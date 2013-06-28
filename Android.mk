LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

base_sources = \
	ccache.c mdfour.c hash.c execute.c util.c args.c stats.c version.c \
	cleanup.c snprintf.c unify.c manifest.c hashtable.c hashtable_itr.c \
	murmurhashneutral2.c hashutil.c getopt_long.c exitfn.c lockfile.c \
	counters.c language.c compopt.c conf.c

zlib_sources = \
	zlib/adler32.c zlib/crc32.c zlib/deflate.c zlib/gzclose.c zlib/gzlib.c \
	zlib/gzread.c zlib/gzwrite.c zlib/inffast.c zlib/inflate.c \
	zlib/inftrees.c zlib/trees.c zlib/zutil.c

LOCAL_SRC_FILES := \
	main.c $(base_sources) $(zlib_sources)

LOCAL_C_INCLUDES := external/zlib

LOCAL_CFLAGS := -g -O2 -Wall -W -DHAVE_CONFIG_H

LOCAL_MODULE := ccache

include $(BUILD_HOST_EXECUTABLE)

ccache-install: ccache | $(ACP)
	$(ACP) -fp $(HOST_OUT)/bin/ccache $(ANDROID_BUILD_TOP)/prebuilts/misc/$(HOST_PREBUILT_TAG)/ccache/ccache
	@echo "Installed ccache to $(ANDROID_BUILD_TOP)/prebuilts/misc/$(HOST_PREBUILT_TAG)/ccache/ccache"
