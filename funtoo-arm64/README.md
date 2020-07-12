1) https://www.funtoo.org/Arm64_generic

Base Arm64 Image.  from scratch

2) ADD https://github.com/multiarch/qemu-user-static/releases/download/v5.0.0-2/x86_64_qemu-aarch64-static.tar.gz  /usr/bin/qemu-aarch64-static

#Add EMU
3) ADD https://github.com/balena-io-library/armv7hf-debian-qemu/archive/master.zip / 

4) ADD https://github.com/necrose99/Docker-Gentoo-ARM64/raw/master/tools/resin-xbuild-arm64.zip /bin/
 #add resin-xbuild wraps sh etc to be more stable
 
 these tools can be pruned if on native arm64 , however add some value for runing in dockerhub or etc.. 
 
 ''' echo ':aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\xfc\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xf:/usr/bin/qemu-arm64-static:' > /proc/sys/fs/binfmt_misc/register '''
