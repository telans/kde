# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PVCUT=$(ver_cut 1-2)
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="ModemManager bindings for Qt"
LICENSE="LGPL-2"
KEYWORDS=""
IUSE=""

# requires running environment
RESTRICT="test"

BDEPEND="
	virtual/pkgconfig
"
DEPEND="
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	net-misc/modemmanager
"
RDEPEND="${DEPEND}"
