LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	mtdutils.c \
	mounts.c

ifeq ($(BOARD_USES_BML_OVER_MTD),true)
LOCAL_SRC_FILES += bml_over_mtd.c
endif

LOCAL_MODULE := libmtdutils

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := flash_image.c
LOCAL_MODULE := flash_image
LOCAL_MODULE_TAGS := eng
LOCAL_STATIC_LIBRARIES := libmtdutils
LOCAL_SHARED_LIBRARIES := libcutils libc
include $(BUILD_EXECUTABLE)
