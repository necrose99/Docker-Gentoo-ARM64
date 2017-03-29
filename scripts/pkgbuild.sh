# build packages
## Its not all that much but should be Enough to get a working basic ISO
emerge  --buildpkg ${dev-vcs} ${buildme} ${sabayon-build} ${boot} ${x11}
# Wrap packages
equo pkg quickpkg  ${dev-vcs} ${buildme} ${sabayon-build} ${boot} */* xfce-base/*
# package any system atoms also */* 

boot=(
sys-boot/gnu-efi
sys-libs/efivar
sys-boot/efibootmgr
app-admin/eclean-kernel
sys-kernel/dracut
sys-kernel/genkernel
sys-kernel/linux-headers
sys-kernel/linux-firmware
sys-kernel/kccmp
sys-kernel/linux-sabayon
sys-kernel/sabayon-sources
sys-boot/grub
)

buildme=(
sys-fs/cachefilesd
    app-admin/sudo 
    net-misc/openssh 
    net-misc/ntp
    sys-apps/keyboard-configuration-helpers
    sys-apps/systemd
    net-misc/networkmanager
    sys-process/vixie-cron
    app-crypt/gnupg
    sys-process/procps
	dev-python/pyGPG
	sys-apps/portage
	dev-python/ssl-fetch
	app-portage/eix
	virtual/libintl
	sys-devel/gettext
	app-portage/euses
	app-portage/distpatch
	app-portage/gentoolkit-dev
	app-portage/metagen
	app-portage/repoman
	app-portage/smart-live-rebuild
	app-portage/ufed
	sys-apps/dbus
	app-portage/cfg-update
	app-portage/deltup
	app-portage/epkg
	app-arch/alien
	app-portage/g-cpan
	dev-util/catalyst
	dev-util/catalyst
	app-portage/gpytage
	=dev-lang/python-2.7  
	dev-lang/python 
	sys-fs/squashfs-tools 
	app-arch/p7zip
)

dev-vcs=(
dev-ruby/git
dev-vcs/bzr
dev-vcs/cvs
dev-vcs/darcs
dev-vcs/mercurial
dev-vcs/subversion
)
## app-portage/g-sorcery would be nice to have but of late its busted. but well try anyhowz..

sabayon-build=(
	app-admin/packagekit-base
	app-admin/equo
	sys-apps/entropy
	sys-apps/entropy-server
	dev-util/bsdiff
	app-admin/matter 
	dev-util/molecule
	dev-util/molecule-plugins
	dev-util/molecule-core
	app-misc/sabayon-version
	app-misc/sabayon-live
    app-misc/sabayon-skel
	app-misc/sabayon-devkit
	app-admin/anaconda
	 )

## Arm64 add Nvidia stock 10XX Geforce compact ... 
dev-vcs=(
xfce-base/xfce4-meta
dev-util/nvidia-cuda-sdk
dev-util/nvidia-cuda-toolkit
media-gfx/nvidia-cg-toolkit
x11-drivers/nvidia-drivers
x11-misc/lightdm
)
