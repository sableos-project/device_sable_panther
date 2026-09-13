# SableOS product adapter for Google Pixel 7 (panther).
#
# The generated GrapheneOS/adevtool Panther product remains the substrate.
# Common Sable package composition is inherited from vendor/sable.

$(call inherit-product, vendor/google_devices/panther/panther.mk)
$(call inherit-product, vendor/sable/config/common.mk)

PRODUCT_NAME := sable_panther
PRODUCT_DEVICE := panther
