#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from motorola sdm632-common
-include device/motorola/sdm632-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/channel

# Assertions
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/configs/board-info.txt
TARGET_OTA_ASSERT_DEVICE := channel

# Display
TARGET_SCREEN_DENSITY := 320

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Init
SOONG_CONFIG_NAMESPACES += MOTOROLA_SDM632_INIT
SOONG_CONFIG_MOTOROLA_SDM632_INIT := DEVICE_LIB
SOONG_CONFIG_MOTOROLA_SDM632_INIT_DEVICE_LIB := //$(DEVICE_PATH):libinit_channel

# Kernel
TARGET_KERNEL_CONFIG := channel_defconfig
BOARD_RAMDISK_USE_XZ := true

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/power_supply/battery/battery_charging_enabled

# Low Memory
MALLOC_SVELTE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        # 32 MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2466250752    # 2352 MB
BOARD_VENDORIMAGE_PARTITION_SIZE := 335544320     # 320 MB

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Inherit from the proprietary version
include vendor/motorola/channel/BoardConfigVendor.mk
