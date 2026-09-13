# SableOS Panther product wrapper.
#
# Keep the generated GrapheneOS/adevtool Panther product authoritative for
# hardware/vendor integration, then add the common Sable product composition.

$(call inherit-product, vendor/google_devices/panther/panther.mk)
$(call inherit-product, vendor/sable/config/common.mk)

PRODUCT_NAME := sable_panther
PRODUCT_DEVICE := panther
