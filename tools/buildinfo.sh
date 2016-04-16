#!/bin/bash

echo "# begin build properties"
echo "# autogenerated by buildinfo.sh"

echo "ro.build.id=$BUILD_ID"
echo "ro.build.display.id=$BUILD_DISPLAY_ID"
echo "ro.build.version.incremental=$BUILD_NUMBER"
echo "ro.build.version.sdk=$PLATFORM_SDK_VERSION"
echo "ro.build.version.preview_sdk=$PLATFORM_PREVIEW_SDK_VERSION"
echo "ro.build.version.codename=$PLATFORM_VERSION_CODENAME"
echo "ro.build.version.all_codenames=$PLATFORM_VERSION_ALL_CODENAMES"
echo "ro.build.version.release=$PLATFORM_VERSION"
echo "ro.build.version.security_patch=$PLATFORM_SECURITY_PATCH"
echo "ro.build.version.base_os=$PLATFORM_BASE_OS"
if [ "$TARGET_DEVICE" == "bullhead" ]; then
  echo "ro.build.date=Wed Mar 23 03:40:46 UTC 2016"
  echo "ro.build.date.utc=1458704446"
else
  echo "ro.build.date=`date`"
  echo "ro.build.date.utc=`date +%s`"
fi
echo "ro.build.type=$TARGET_BUILD_TYPE"
echo "ro.build.user=$USER"
echo "ro.build.host=`hostname`"
echo "ro.build.tags=$BUILD_VERSION_TAGS"
echo "ro.build.flavor=$TARGET_BUILD_FLAVOR"
echo "ro.product.model=$PRODUCT_MODEL"
echo "ro.product.brand=$PRODUCT_BRAND"
echo "ro.product.name=$PRODUCT_NAME"
echo "ro.product.device=$TARGET_DEVICE"
echo "ro.product.board=$TARGET_BOOTLOADER_BOARD_NAME"

# These values are deprecated, use "ro.product.cpu.abilist"
# instead (see below).
echo "# ro.product.cpu.abi and ro.product.cpu.abi2 are obsolete,"
echo "# use ro.product.cpu.abilist instead."
echo "ro.product.cpu.abi=$TARGET_CPU_ABI"
if [ -n "$TARGET_CPU_ABI2" ] ; then
  echo "ro.product.cpu.abi2=$TARGET_CPU_ABI2"
fi
echo "ro.product.cpu.abilist=$TARGET_CPU_ABI_LIST"
echo "ro.product.cpu.abilist32=$TARGET_CPU_ABI_LIST_32_BIT"
echo "ro.product.cpu.abilist64=$TARGET_CPU_ABI_LIST_64_BIT"

echo "ro.product.manufacturer=$PRODUCT_MANUFACTURER"
if [ -n "$PRODUCT_DEFAULT_LOCALE" ] ; then
  echo "ro.product.locale=$PRODUCT_DEFAULT_LOCALE"
fi
echo "ro.wifi.channels=$PRODUCT_DEFAULT_WIFI_CHANNELS"
echo "ro.board.platform=$TARGET_BOARD_PLATFORM"

echo "# ro.build.product is obsolete; use ro.product.device"
echo "ro.build.product=$TARGET_DEVICE"

echo "# Do not try to parse description, fingerprint, or thumbprint"
echo "ro.build.description=$PRIVATE_BUILD_DESC"
if [ "$TARGET_DEVICE" == "bullhead" ]; then
  echo "ro.build.fingerprint=google/bullhead/bullhead:6.0.1/MHC19Q/2705526:user/release-keys"
else
  echo "ro.build.fingerprint=$BUILD_FINGERPRINT"
fi
if [ -n "$BUILD_THUMBPRINT" ] ; then
  echo "ro.build.thumbprint=$BUILD_THUMBPRINT"
fi
echo "ro.build.characteristics=$TARGET_AAPT_CHARACTERISTICS"

echo "# end build properties"
