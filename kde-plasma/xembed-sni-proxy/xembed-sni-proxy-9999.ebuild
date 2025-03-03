# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KDE_ORG_NAME="plasma-workspace"
KFMIN=9999
PVCUT=$(ver_cut 1-3)
QTMIN=5.15.2
inherit cmake kde.org

DESCRIPTION="Legacy xembed tray icons support for SNI-only system trays"
HOMEPAGE="https://invent.kde.org/plasma/plasma-workspace/-/blob/master/xembed-sni-proxy/Readme.md"

LICENSE="GPL-2"
SLOT="5"
KEYWORDS=""

DEPEND="
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtx11extras-${QTMIN}:5
	>=kde-frameworks/extra-cmake-modules-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5[X]
	x11-libs/libxcb
	x11-libs/libXtst
	x11-libs/xcb-util-image
"
RDEPEND="${DEPEND}
	!kde-plasma/xembed-sni-proxy:0
"

S="${S}/${PN}"

PATCHES=( "${FILESDIR}/${PN}-5.20.80-standalone.patch" )

src_prepare() {
	cmake_src_prepare

	sed -e "/set/s/GENTOO_PV/$(ver_cut 1-3)/" \
		-i CMakeLists.txt || die "Failed to prepare CMakeLists.txt"
}
