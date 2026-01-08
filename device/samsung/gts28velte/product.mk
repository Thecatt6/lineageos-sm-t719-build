# Product definition for LineageOS 22.2 (Android 15)
PRODUCT_NAME := lineage_gts28velte
PRODUCT_DEVICE := gts28velte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T719
PRODUCT_MANUFACTURER := samsung

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/samsung/gts28velte \
    vendor/samsung/gts28velte

# Base product (64-bit, telephony)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# LineageOS common config
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device-specific config
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Properties
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Shipping API level (SM-T719 originally Android 6.0)
PRODUCT_SHIPPING_API_LEVEL := 23
