# Copyright (C) 2016 The CyanogenMod Project
# Licensed under the Apache License, Version 2.0

# Inherit from common msm8976 configuration
-include device/samsung/msm8976-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/gts28velte

# Assert
TARGET_OTA_ASSERT_DEVICE := gts28velte

# HIDL / AIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := gts28velte_defconfig

# Modern Android kernel flags
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r416183b
TARGET_USES_BINDERFS := true
TARGET_ENABLE_CGROUPV2 := true

# Boot image format (Android 12+ requirement)
BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Include DTB in boot image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true

# System properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Filesystem support
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# AVB (disabled for legacy Samsung)
BOARD_AVB_MAKE_VBMETA_IMAGE := false

# SELinux enforcing (required for Android 14+)
BOARD_KERNEL_CMDLINE += androidboot.selinux=enforcing

# Inherit vendor configuration
-include vendor/samsung/gts28velte/BoardConfigVendor.mk
