# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

KMNAME="kde-baseapps"
VIRTUALX_REQUIRED=test
inherit kde4-meta

DESCRIPTION="KDE's bookmarks editor"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep libkonq)
"
RDEPEND="${DEPEND}"

RESTRICT=test
# 1 test, 1 fail

KMEXTRACTONLY="
	lib/konq/
"
