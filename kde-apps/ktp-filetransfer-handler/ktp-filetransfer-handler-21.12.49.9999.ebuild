# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PVCUT=$(ver_cut 1-3)
KFMIN=5.88.0
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="KDE Telepathy file transfer handler"
HOMEPAGE="https://community.kde.org/KTp"

LICENSE="GPL-2+ LGPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=kde-apps/ktp-common-internals-${PVCUT}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=net-libs/telepathy-qt-0.9.8
"
RDEPEND="${DEPEND}"
