# inherit from the proprietary version
-include vendor/lge/p970/BoardConfigVendor.mk

# Board configuration
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a8
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a8
TARGET_ARCH_LOWMEM := true
ARCH_ARM_HAVE_ARMV7A := true

TARGET_BOOTLOADER_BOARD_NAME := p970
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_NO_BOOTLOADER := true
TARGET_OMAP3 := true
OMAP_ENHANCEMENT := true

ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT -DTARGET_OMAP3 -DOMAP_ENHANCEMENT_CPCAM -DOMAP_ENHANCEMENT_VTC
endif

TARGET_SPECIFIC_HEADER_PATH := device/lge/p970/include

#Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true

#Partitioning
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 665681920
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1170259968
BOARD_FLASH_BLOCK_SIZE := 131072

#Kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x80000000
BOARD_PAGE_SIZE := 0x00000800
TARGET_KERNEL_SOURCE := kernel/lge/p970
TARGET_KERNEL_CONFIG := cyanogenmod_p970_defconfig

BOARD_NEEDS_CUTILS_LOG := true

#Storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/omap/musb-omap2430/musb-hdrc/gadget/lun%d/file"

BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
#BOARD_HAS_LARGE_FILESYSTEM := true

#Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/p970/bluetooth

# OMX
HARDWARE_OMX := true

#Mobiledata
BOARD_MOBILEDATA_INTERFACE_NAME := "vsnet0"

#Wifi
BOARD_WLAN_DEVICE := bcm4329
WIFI_DRIVER_FW_PATH_STA         := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP          := "/system/etc/firmware/fw_bcm4329_ap.bin"
WIFI_DRIVER_FW_PATH_P2P         := "/system/etc/firmware/fw_bcm4329_p2p.bin"
WIFI_DRIVER_FW_PATH_MFG         := "/system/etc/firmware/fw_bcm4329_mfg.bin"
WIFI_DRIVER_MODULE_NAME         := "wireless"
WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/wireless.ko"
WIFI_DRIVER_MODULE_ARG          := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/system/etc/wifi/nvram.txt config_path=/data/misc/wifi/config"
WPA_SUPPLICANT_VERSION          := VER_0_8_X
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_HOSTAPD_DRIVER := WEXT

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# HW Graphics (EGL fixes + webkit fix)
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/lge/p970/egl.cfg
ENABLE_WEBGL := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Recovery
#BOARD_TOUCH_RECOVERY := true
BOARD_CUSTOM_GRAPHICS := ../../../device/lge/p970/recovery/graphics.c
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := device/lge/p970/configs/fstab.p970
TARGET_RECOVERY_INITRC := device/lge/p970/init.recovery.p970.rc
RECOVERY_FSTAB_VERSION := 2

BOARD_HAS_VIBRATOR_IMPLEMENTATION := ../../device/lge/p970/vibrator.c

# for legacy blobs
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB -DICS_CAMERA_BLOB -DOMAP_ICS_CAMERA -DNEEDS_VECTORIMPL_SYMBOLS -DP970_ICS_CAMERA -DP970_ICS_AUDIO

# for frameworks/native/services/surfaceflinger
# use EGL_IMG_context_priority extension, which helps performance
COMMON_GLOBAL_CFLAGS += -DHAS_CONTEXT_PRIORITY

# for frameworks/native/libs/gui
# disable use of EGL_KHR_fence_sync extension, since it slows things down
COMMON_GLOBAL_CFLAGS += -DDONT_USE_FENCE_SYNC

LG_CAMERA_HARDWARE := true

BOARD_SYSFS_LIGHT_SENSOR := "/sys/devices/platform/omap/omap_i2c.2/i2c-2/2-0060/leds/lcd-backlight/als"

# Charger mode
COMMON_GLOBAL_CFLAGS += -DBOARD_CHARGING_CMDLINE_NAME='"rs"' -DBOARD_CHARGING_CMDLINE_VALUE='"c"'
BOARD_ALLOW_SUSPEND_IN_CHARGER := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true

## Radio fixes
BOARD_RIL_CLASS := ../../../device/lge/p970/ril/

#KitKat specific flags
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
SENSORS_NEED_SETRATE_ON_ENABLE := true
USE_SET_METADATA := false
