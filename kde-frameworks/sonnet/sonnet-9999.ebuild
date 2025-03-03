# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_DESIGNERPLUGIN="true"
QTMIN=5.15.2
VIRTUALX_REQUIRED="test"
inherit ecm kde.org

DESCRIPTION="Framework for providing spell-checking through abstraction of popular backends"

LICENSE="LGPL-2+ LGPL-2.1+"
KEYWORDS=""
IUSE="aspell +hunspell nls qml"

DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	aspell? ( app-text/aspell )
	hunspell? ( app-text/hunspell:= )
	qml? ( >=dev-qt/qtdeclarative-${QTMIN}:5 )
"
RDEPEND="${DEPEND}"
BDEPEND="
	nls? ( >=dev-qt/linguist-tools-${QTMIN}:5 )
"

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package aspell ASPELL)
		$(cmake_use_find_package hunspell HUNSPELL)
		-DSONNET_USE_QML=$(usex qml)
	)

	ecm_src_configure
}

src_test() {
	# sonnet-test_settings: bug 680032
	# sonnet-test_autodetect: bug 779994
	local myctestargs=(
		-E "(sonnet-test_autodetect|sonnet-test_settings|sonnet-test_highlighter)"
	)

	ecm_src_test
}
