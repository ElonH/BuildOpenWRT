#!/bin/bash
SCRIPT_ABS_PATH="$(cd $(dirname "$0"); pwd)"

cd $SCRIPT_ABS_PATH/ctcgfw-latest

cat>feeds.conf<<EOF
src-link packages ${SCRIPT_ABS_PATH}/feeds/openwrt/packages
src-link luci ${SCRIPT_ABS_PATH}/feeds/openwrt/luci
src-link routing ${SCRIPT_ABS_PATH}/feeds/openwrt/routing
src-link telephony ${SCRIPT_ABS_PATH}/feeds/openwrt/telephony
EOF

# just enable/disable feeds update and install
source $SCRIPT_ABS_PATH/scripts/feeds.sh

cat>.config<<'EOF'
CONFIG_TARGET_ath79=n
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_ROOTFS_EXT4FS=y
CONFIG_TARGET_ROOTFS_SQUASHFS=y
CONFIG_VMDK_IMAGES=n
CONFIG_TARGET_IMAGES_GZIP=y
CONFIG_TARGET_IMAGES_PAD=n
CONFIG_TARGET_KERNEL_PARTSIZE=32
CONFIG_TARGET_ROOTFS_PARTSIZE=1024

CONFIG_DEVEL=y
# CONFIG_CCACHE=y
CONFIG_BUILD_LOG=y

EOF

make defconfig
