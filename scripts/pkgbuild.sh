# build packages
emerge  --buildpkg ${dev-vcs} ${buildme} ${sabayon-build} ${boot}
# Wrap packages
equo smart quickpkg  ${dev-vcs} ${buildme} ${sabayon-build} ${boot}

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
	 )

xfce-base/xfce4-meta
