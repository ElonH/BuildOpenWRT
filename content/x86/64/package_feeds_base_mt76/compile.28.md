---
title: "compile.28"
date: 2021-06-03 14:30:33.602612
hidden: false
draft: false
weight: -28
---

build number: `28`

#### re-implement command 

```bash
docker pull elonh/opde:sdk
docker run -it --rm elonh/opde:sdk zsh # or bash
export http_proxy= # [your proxy], do not use localhost or 127.0.0.1
export https_proxy=$http_proxy
opde feeds && opde config -a
make package/feeds/base/mt76/compile -j$(nproc) || make package/feeds/base/mt76/compile V=s
```

#### Compile.txt

``` bash
Applying ./patches/0001-mt76-allow-VHT-rate-on-2.4GHz.patch using plaintext: 
patching file mac80211.c
Hunk #1 succeeded at 176 (offset 16 lines).
Hunk #2 succeeded at 239 (offset 16 lines).
Hunk #3 succeeded at 374 (offset 16 lines).
Hunk #4 succeeded at 484 (offset 30 lines).
make[3]: *** No rule to make target '/openwrt/staging_dir/target-x86_64_musl/usr/include/mac80211-backport/backport/autoconf.h', needed by '/openwrt/build_dir/target-x86_64_musl/linux-x86_64/mt76-2021-06-02-b9f09f53/.configured_98efdcd916b181aef82ec860dfcf9dd8'.  Stop.
```