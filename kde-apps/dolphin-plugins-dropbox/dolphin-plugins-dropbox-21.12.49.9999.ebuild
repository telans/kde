# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="false"
KDE_ORG_NAME="dolphin-plugins"
MY_PLUGIN_NAME="dropbox"
PVCUT=$(ver_cut 1-3)
KFMIN=5.88.0
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="Dolphin plugin for Dropbox service integration"
HOMEPAGE="https://apps.kde.org/dolphin_plugins/"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-apps/dolphin-${PVCUT}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/ktextwidgets-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
"
RDEPEND="${DEPEND}
	net-misc/dropbox-cli
"

src_prepare() {
	ecm_src_prepare
	# solid, qtdbus only required by mountiso
	ecm_punt_bogus_dep Qt5 DBus
	ecm_punt_bogus_dep KF5 Solid
	# delete non-${PN} translations
	if [[ ${KDE_BUILD_TYPE} = release ]]; then
		find po -type f -name "*po" -and -not -name "*${MY_PLUGIN_NAME}plugin" -delete || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_${MY_PLUGIN_NAME}=ON
		-DBUILD_bazaar=OFF
		-DBUILD_git=OFF
		-DBUILD_hg=OFF
		-DBUILD_mountiso=OFF
		-DBUILD_svn=OFF
	)
	ecm_src_configure
}

src_install() {
	ecm_src_install
	rm "${D}"/usr/share/metainfo/org.kde.dolphin-plugins.metainfo.xml || die
}
