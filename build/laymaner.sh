#VOLUME ["${PORTAGE}:/usr/portage:ro", "${PORTAGE}/distfiles:/usr/portage/distfiles:rw"]

mkdir /etc/portage/package.accept_keywords
mkdir -p /etc/portage/package.use
# avoid a Python 2 dependency
echo 'dev-vcs/git -python' >> /etc/portage/package.use/layman
echo 'app-portage/layman ~amd64' >> /etc/portage/package.accept_keywords/layman
# required by app-portage/layman-2.1.0-r2
# =dev-python/ssl-fetch-0.2.1 ~amd64
echo 'dev-python/ssl-fetch ~amd64' >> /etc/portage/package.accept_keywords/layman

emerge -v layman
eselect news read new
layman-updater --rebuild
sed -i 's/^check_official.*/check_official : no/' /etc/layman/layman.cfg
layman --sync-all