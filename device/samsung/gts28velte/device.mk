# Device configuration for Samsung Galaxy Tab S2 8.0 LTE (gts28velte)

DEVICE_PATH := device/samsung/gts28velte
LOCAL_PATH := $(call my-dir)

# Device characteristics
PRODUCT_CHARACTERISTICS := tablet

# Dalvik heap config (tablet, 3GB RAM)
$(call inherit-product, frameworks/native/build/tablet-2560-dalvik-heap.mk)

# Inherit vendor blobs
$(call inherit-product-if-exists, vendor/samsung/gts28velte/gts28velte-vendor.mk)

# Inherit common msm8976 configuration
$(call inherit-product, device/samsung/msm8976-common/msm8976.mk)

# AAPT config
PRODUCT_AAPT_CONFIG := normal PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Shipping API level (Android 6.0 originally)
PRODUCT_SHIPPING_API_LEVEL := 23

# Runtime / APEX
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_USE_DYNAMIC_PARTITIONS := false

# Audio HAL (modern)
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.common@7.0-util \
    android.hardware.soundtrigger@2.3-impl

# Audio configs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/mixer_paths_wcd9330.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9330.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-service

# Display / Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@4.0-impl \
    android.hardware.graphics.allocator@4.0-service \
    android.hardware.graphics.composer@2.4-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

# GPS / GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-service

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.samsung

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.samsung

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.samsung

# Vibrator (modern)
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.samsung

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service

# RRO Overlays (Android 14+)
PRODUCT_PACKAGES += \
    Gts28velteFrameworkOverlay \
    Gts28velteSettingsOverlay \
    Gts28velteSystemUIOverlay \
    framework-res \
    Settings \
    SystemUI

# Init scripts (must go to vendor/etc/init)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/etc/init/init.gts28velte.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.gts28velte.rc \
    $(DEVICE_PATH)/rootdir/etc/fstab.gts28velte:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.gts28velte

# Permissions (modern)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    $(DEVICE_PATH)/configs/permissions/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/tablet_core_hardware.xml

# Dalvik VM configuration
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
