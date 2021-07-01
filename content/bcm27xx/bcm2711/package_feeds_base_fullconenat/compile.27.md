---
title: "compile.27"
date: 2021-06-03 07:43:02.897424
hidden: false
draft: false
weight: -27
---

build number: `27`

#### re-implement command 

```bash
docker pull elonh/opde:sdk
docker run -it --rm elonh/opde:sdk zsh # or bash
export http_proxy= # [your proxy], do not use localhost or 127.0.0.1
export https_proxy=$http_proxy
opde feeds && opde config -a
make package/feeds/base/fullconenat/compile -j$(nproc) || make package/feeds/base/fullconenat/compile V=s
```

#### Compile.txt

``` bash
Applying ./patches/000-printk.patch using plaintext: 
patching file xt_FULLCONENAT.c
Hunk #1 succeeded at 702 (offset 5 lines).
make[4]: Entering directory '/openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/linux-5.4.123'
  CC [M]  /openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/fullconenat-2019-10-21-0cf3b48f/xt_FULLCONENAT.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC [M]  /openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/fullconenat-2019-10-21-0cf3b48f/xt_FULLCONENAT.mod.o
  LD [M]  /openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/fullconenat-2019-10-21-0cf3b48f/xt_FULLCONENAT.ko
make[4]: Leaving directory '/openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/linux-5.4.123'
make[4]: Entering directory '/openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/fullconenat-2019-10-21-0cf3b48f'
ccache_cc -Os -pipe -fno-caller-saves -fno-plt -fhonour-copts -Wno-error=unused-but-set-variable -Wno-error=unused-result -fmacro-prefix-map=/openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/fullconenat-2019-10-21-0cf3b48f=fullconenat-2019-10-21-0cf3b48f -Wformat -Werror=format-security -fstack-protector -D_FORTIFY_SOURCE=1 -Wl,-z,now -Wl,-z,relro  -I/openwrt/staging_dir/toolchain-aarch64_cortex-a72_gcc-8.4.0_musl/usr/include -I/openwrt/staging_dir/toolchain-aarch64_cortex-a72_gcc-8.4.0_musl/include/fortify -I/openwrt/staging_dir/toolchain-aarch64_cortex-a72_gcc-8.4.0_musl/include  -fPIC -D_INIT=libipt_FULLCONENAT_init -c -o libipt_FULLCONENAT.o libipt_FULLCONENAT.c;
ccache_cc -shared -lxtables -o libipt_FULLCONENAT.so libipt_FULLCONENAT.o;
make[4]: Leaving directory '/openwrt/build_dir/target-aarch64_cortex-a72_musl/linux-bcm27xx_bcm2711/fullconenat-2019-10-21-0cf3b48f'
Package kmod-ipt-fullconenat is missing dependencies for the following libraries:
nf_conntrack.ko
nf_nat.ko
x_tables.ko
make[3]: *** [Makefile:76: /openwrt/bin/targets/bcm27xx/bcm2711/packages/kmod-ipt-fullconenat_5.4.123+2019-10-21-0cf3b48f-1_aarch64_cortex-a72.ipk] Error 1
```