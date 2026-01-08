LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.gts28velte
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/fstab.gts28velte
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.gts28velte.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/init.gts28velte.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)/init
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := ueventd.gts28velte.rc
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := etc/ueventd.gts28velte.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_VENDOR_ETC)
include $(BUILD_PREBUILT)
