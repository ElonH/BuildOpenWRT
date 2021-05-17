---
title: "compile.17"
date: 2021-05-14 00:37:24.699981
hidden: false
draft: false
weight: -17
---

build number: `17`

#### re-implement command 

```bash
docker pull elonh/opde:sdk
docker run -it --rm elonh/opde:sdk zsh # or bash
export http_proxy= # [your proxy], do not use localhost or 127.0.0.1
export https_proxy=$http_proxy
opde feeds && opde config -a
make package/feeds/base/rtl8812au-ac/compile -j$(nproc) || make package/feeds/base/rtl8812au-ac/compile V=s
```

#### Compile.txt

``` bash
Applying ./patches/001-use-kernel-byteorder.patch using plaintext: 
patching file include/drv_types.h

Applying ./patches/010-disable-default-build-x86.patch using plaintext: 
patching file Makefile

Applying ./patches/020-change-value-of-vht-enable-and-usb-mode.patch using plaintext: 
patching file os_dep/linux/os_intfs.c

Applying ./patches/030-add-missing-code-for-concurrent-mode.patch using plaintext: 
patching file os_dep/linux/os_intfs.c
make[3]: *** No rule to make target '/openwrt/staging_dir/target-aarch64_cortex-a72_musl/usr/include/mac80211-backport/backport/autoconf.h', needed by '/openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/rtl8812au-ac-2021-03-27-c0ce8174/.configured_68b329da9893e34099c7d8ad5cb9c940'.  Stop.
```