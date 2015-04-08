#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product-if-exists, vendor/lge/vs980/vs980-vendor.mk)
$(call inherit-product, device/lge/g2-common/g2.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnCdmaDevice=1 \
	ro.telephony.default_network=10 \
	ro.cdma.home.operator.numeric=311480 \
	ro.cdma.home.operator.alpha=Verizon \
	ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
	ro.ril.force_eri_from_xml=true \
	ro.telephony.get_imsi_from_sim=true \
	ril.subscription.types=NV,RUIM

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.bcm2079x.default \
    NfcNci

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf
