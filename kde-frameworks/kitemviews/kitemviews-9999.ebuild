# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_DESIGNERPLUGIN="true"
QTMIN=5.15.2
VIRTUALX_REQUIRED="test"
inherit ecm kde.org

DESCRIPTION="Framework providing additional widgets for item models"
LICENSE="LGPL-2+"
KEYWORDS=""
IUSE="nls"

BDEPEND="
	nls? ( >=dev-qt/linguist-tools-${QTMIN}:5 )
"
DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_DISABLE_FIND_PACKAGE_PythonModuleGeneration=ON # bug 746866
	)
	ecm_src_configure
}
