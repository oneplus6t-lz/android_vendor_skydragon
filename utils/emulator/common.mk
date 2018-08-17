PRODUCT_BRAND ?= skydragon

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# general properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.build.selinux=1

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/skydragon/prebuilt/common/addon.d/50-skydragon.sh:system/addon.d/50-skydragon.sh \
    vendor/skydragon/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/skydragon/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions

# Init script file with omni extras
PRODUCT_COPY_FILES += \
    vendor/skydragon/prebuilt/common/init.d/init.d.rc:root/init.d.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/omni/utils/emulator/packages.mk

# Add our overlays
DEVICE_PACKAGE_OVERLAYS += vendor/skydragon/overlay/common
