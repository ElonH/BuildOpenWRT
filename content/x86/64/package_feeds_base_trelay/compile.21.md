---
title: "compile.21"
date: 2021-05-17 21:39:44.938484
hidden: false
draft: false
weight: -21
---

build number: `21`

#### re-implement command 

```bash
docker pull elonh/opde:sdk
docker run -it --rm elonh/opde:sdk zsh # or bash
export http_proxy= # [your proxy], do not use localhost or 127.0.0.1
export https_proxy=$http_proxy
opde feeds && opde config -a
make package/feeds/base/trelay/compile -j$(nproc) || make package/feeds/base/trelay/compile V=s
```

#### Compile.txt

``` bash
make[4]: Entering directory '/openwrt/build_dir/target-x86_64_musl/linux-x86_64/linux-5.4.117'
scripts/Makefile.build:42: arch/x86/entry/syscalls/Makefile: No such file or directory
make[5]: *** No rule to make target 'arch/x86/entry/syscalls/Makefile'.  Stop.
make[4]: *** [arch/x86/Makefile:242: archheaders] Error 2
make[4]: Leaving directory '/openwrt/build_dir/target-x86_64_musl/linux-x86_64/linux-5.4.117'
make[3]: *** [Makefile:51: /openwrt/build_dir/target-x86_64_musl/linux-x86_64/trelay/.built] Error 2
```