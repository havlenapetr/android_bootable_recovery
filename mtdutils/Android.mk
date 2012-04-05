LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	mtdutils.c \
	mounts.c

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),aries)
LOCAL_SRC_FILES += bml_over_mtd.c
LOCAL_CFLAGS := -DUSES_BML_OVER_MTD
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
