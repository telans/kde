# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
KDE_ORG_CATEGORY="network"
QTMIN=5.15.2
inherit ecm kde.org python-any-r1

DESCRIPTION="Qt bindings for the Telepathy logger"
HOMEPAGE="https://invent.kde.org/network/telepathy-logger-qt"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/telepathy-logger-qt/${PV%.*}/src/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm64 ~riscv ~x86"
fi

LICENSE="LGPL-2.1"
SLOT="5"
IUSE=""

BDEPEND="${PYTHON_DEPS}"
DEPEND="
	dev-libs/dbus-glib
	dev-libs/glib:2
	dev-libs/libxml2
	>=dev-qt/qtdbus-${QTMIN}:5
	net-im/telepathy-logger
	net-libs/telepathy-glib
	>=net-libs/telepathy-qt-0.9.8
	sys-apps/dbus
"
RDEPEND="${DEPEND}"
