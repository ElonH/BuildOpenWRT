#!/bin/bash
SCRIPT_ABS_PATH="$(cd $(dirname "$0"); pwd)"

cd $SCRIPT_ABS_PATH/ctcgfw

cat>feeds.conf<<EOF
src-link packages ${SCRIPT_ABS_PATH}/feeds/ctcgfw/packages
src-link luci ${SCRIPT_ABS_PATH}/feeds/ctcgfw/luci
src-link routing ${SCRIPT_ABS_PATH}/feeds/openwrt/routing
src-link telephony ${SCRIPT_ABS_PATH}/feeds/openwrt/telephony
EOF

# just enable/disable feeds update and install
source $SCRIPT_ABS_PATH/scripts/feeds.sh

cat>.config<<'EOF'
CONFIG_TARGET_ROOTFS_EXT4FS=y
CONFIG_TARGET_ROOTFS_SQUASHFS=y
CONFIG_VMDK_IMAGES=y
CONFIG_TARGET_IMAGES_GZIP=y
CONFIG_TARGET_IMAGES_PAD=n
CONFIG_TARGET_KERNEL_PARTSIZE=32
CONFIG_TARGET_ROOTFS_PARTSIZE=1024

CONFIG_DEVEL=y
# CONFIG_CCACHE=y
CONFIG_BUILD_LOG=y

# CONFIG_PACKAGE_sudo=y
# CONFIG_PACKAGE_vim-runtime=y
# CONFIG_PACKAGE_zsh=y
# #ssh
# CONFIG_PACKAGE_autossh=y
# CONFIG_PACKAGE_openssh-client-utils=y
# CONFIG_PACKAGE_openssh-moduli=y
# CONFIG_PACKAGE_openssh-server=y
# CONFIG_PACKAGE_openssh-server-pam=y
# CONFIG_PACKAGE_openssh-sftp-avahi-service=y
# CONFIG_PACKAGE_openssh-sftp-client=y
# CONFIG_PACKAGE_sshtunnel=y
# #git
# CONFIG_PACKAGE_git-http=y
# #web server
# CONFIG_PACKAGE_nginx-all-module=y

# LUCI
# theme
CONFIG_PACKAGE_luci-theme-opentomato=y
CONFIG_PACKAGE_luci-theme-material=m
CONFIG_PACKAGE_luci-theme-argon=m
CONFIG_PACKAGE_luci-theme-argon-mc=m
CONFIG_PACKAGE_luci-theme-argon-mod=m
CONFIG_PACKAGE_luci-theme-argonv2=m
CONFIG_PACKAGE_luci-theme-argonv3=m
CONFIG_PACKAGE_luci-theme-atmaterial=m
CONFIG_PACKAGE_luci-theme-bootstrap-mc=m
CONFIG_PACKAGE_luci-theme-bootstrap-mod=m
CONFIG_PACKAGE_luci-theme-darkmatter=m
CONFIG_PACKAGE_luci-theme-my=m
CONFIG_PACKAGE_luci-theme-netgear=m
CONFIG_PACKAGE_luci-theme-netgear-mc=m
CONFIG_PACKAGE_luci-theme-netgearv2=m
CONFIG_PACKAGE_luci-theme-opentomcat=m

CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-clash=y

CONFIG_PACKAGE_luci-app-cifs=y
CONFIG_PACKAGE_luci-app-cifsd=y

CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-filebrowser=y
CONFIG_PACKAGE_luci-app-kodexplorer=y
CONFIG_PACKAGE_luci-app-rclone=y
CONFIG_PACKAGE_luci-app-transmission=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-serverchan=y

CONFIG_PACKAGE_luci-app-ssr-plus=n
CONFIG_PACKAGE_luci-app-vssr=y
CONFIG_PACKAGE_luci-app-advanced-reboot=y
# CONFIG_PACKAGE_luci-app-cshark=y
CONFIG_PACKAGE_luci-app-familycloud=y

# mutil-wan
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-mwan3helper=y
CONFIG_PACKAGE_luci-app-macvlan=y
CONFIG_PACKAGE_luci-app-minidlna=y
CONFIG_PACKAGE_luci-app-syncdial=y

# addon
CONFIG_PACKAGE_luci-app-amule=y
CONFIG_PACKAGE_luci-app-baidupcs-web=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-ngrokc=y
# CONFIG_PACKAGE_luci-app-docker=y
# CONFIG_PACKAGE_luci-app-dockerman=y
CONFIG_PACKAGE_luci-app-cpulimit=y
CONFIG_PACKAGE_luci-app-chinadns=y
CONFIG_PACKAGE_luci-app-simple-adblock=y
CONFIG_PACKAGE_luci-app-netdata=y

CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_Shadowsocks_Socks=y
CONFIG_PACKAGE_luci-app-vssr_INCLUDE_ShadowsocksR_Server=y
CONFIG_PACKAGE_luci-app-travelmate=y
CONFIG_PACKAGE_luci-app-verysync=y
CONFIG_PACKAGE_luci-app-smartinfo=y

CONFIG_PACKAGE_luci-app-samba4=m

CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Shadowsocks_socks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_ShadowsocksR_socks=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Brook=y
CONFIG_PACKAGE_luci-app-passwall_INCLUDE_kcptun=y

CONFIG_PACKAGE_luci-app-ssr-plus=m
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Kcptun=y

CONFIG_PACKAGE_luci-app-ssr-plus-Jo=m
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Trojan=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Kcptun=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Shadowsocks_Server=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_Shadowsocks_Socks=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_dnscrypt_proxy=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_dnsforwarder=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_ChinaDNS=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_haproxy=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_privoxy=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_simple-obfs=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_simple-obfs-server=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_ipt2socks=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_GoQuiet-client=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_GoQuiet-server=y
CONFIG_PACKAGE_luci-app-ssr-plus-Jo_INCLUDE_v2ray-plugin=y

EOF

make defconfig

