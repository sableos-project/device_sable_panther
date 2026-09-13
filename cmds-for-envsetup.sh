# Reuse the generated Panther substrate target identity for the Sable
# derivative product. GrapheneOS envsetup sources this file before product
# configuration for TARGET_PRODUCT=sable_panther when this repository is
# checked out at vendor/sable_devices/sable_panther.

source vendor/google_devices/panther/cmds-for-envsetup.sh

export BUILD_ID_sable_panther="$BUILD_ID_panther"
unset PLATFORM_SECURITY_PATCH_sable_panther
