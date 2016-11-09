# proot-start.sh  ,
# Supporting crossbuilding etc with qemu-aarch64-binfmt (qemu-aarch64-userstatic) also umeq is a micro qemu static.
# however QEMU may yeild more stability however for cloud use ie dockerhub to build I'll invoke via script... 
# SET build items for QEMU
  mkdir /etc/binfmt.d/
# Supporting crossbuilding with binfmt
cat >> /chroot/etc/binfmt.d/qemu-arm64.conf <<EOF
# AArch64 binaries.
:qemu-arm64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/qemu-arm64:OC
EOF
# Supporting crossbuilding with binfmt Chroot too... 
cat >> /etc/binfmt.d/qemu-arm64.conf <<EOL
# AArch64 binaries.
:qemu-arm64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/qemu-arm64:OC
EOL
# Supporting crossbuilding etc with qemu-aarch64-binfmt (qemu-aarch64-userstatic) also umeq is a micro qemu static.

# Setup the rc_sys
sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /chroot/etc/rc.conf
