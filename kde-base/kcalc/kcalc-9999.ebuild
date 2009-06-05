# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="kdeutils"
CPPUNIT_REQUIRED="optional"
inherit kde4-meta

DESCRIPTION="KDE calculator"
KEYWORDS=""
IUSE="debug +handbook"

DEPEND="
	dev-libs/gmp
"
RDEPEND="${DEPEND}"
