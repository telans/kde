# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
KFMIN=5.88.0
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="Plasma integration for gphoto2 cameras"
HOMEPAGE="https://apps.kde.org/kamera/"

LICENSE="GPL-2+ handbook? ( FDL-1.2 )"
SLOT="5"
KEYWORDS=""
IUSE=""

BDEPEND="
	sys-devel/gettext
"
DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	media-libs/libgphoto2:=
"
RDEPEND="${DEPEND}"
