# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_TEST="forceoptional"
PYTHON_COMPAT=( python3_{8..10} )
KFMIN=5.82.0
QTMIN=5.15.2
VIRTUALX_REQUIRED="test"
inherit ecm kde.org python-single-r1

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${PN}/${PV}/${P}.tar.xz"
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
fi

DESCRIPTION="Free digital painting application. Digital Painting, Creative Freedom!"
HOMEPAGE="https://apps.kde.org/krita/ https://krita.org/en/"

LICENSE="GPL-3"
SLOT="5"
IUSE="color-management fftw gif +gsl heif +jpeg +mypaint-brush-engine openexr pdf qtmedia +raw vc webp"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# bug 630508
RESTRICT="test"

BDEPEND="
	dev-cpp/eigen:3
	dev-lang/perl
	sys-devel/gettext
"
RDEPEND="${PYTHON_DEPS}
	dev-libs/boost:=
	dev-libs/quazip:0=
	$(python_gen_cond_dep '
		dev-python/PyQt5[${PYTHON_USEDEP}]
		dev-python/sip:=[${PYTHON_USEDEP}]
	')
	>=dev-qt/qtconcurrent-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5=[-gles2-only]
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtprintsupport-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtx11extras-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	>=kde-frameworks/kcompletion-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/kguiaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kiconthemes-${KFMIN}:5
	>=kde-frameworks/kitemmodels-${KFMIN}:5
	>=kde-frameworks/kitemviews-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	media-gfx/exiv2:=
	media-libs/lcms
	media-libs/libpng:0=
	media-libs/tiff:0
	sys-libs/zlib
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXi
	color-management? ( >=media-libs/opencolorio-2.0.0 )
	fftw? ( sci-libs/fftw:3.0= )
	gif? ( media-libs/giflib )
	gsl? ( sci-libs/gsl:= )
	jpeg? ( virtual/jpeg:0 )
	heif? ( media-libs/libheif:= )
	mypaint-brush-engine? ( media-libs/libmypaint:= )
	openexr? ( media-libs/openexr:= )
	pdf? ( app-text/poppler[qt5] )
	qtmedia? ( >=dev-qt/qtmultimedia-${QTMIN}:5 )
	raw? ( media-libs/libraw:= )
	webp? ( >=media-libs/libwebp-1.2.0:= )
"
DEPEND="${RDEPEND}
	vc? ( >=dev-libs/vc-1.1.0 )
"

PATCHES=( "${FILESDIR}"/${PN}-4.3.1-tests-optional.patch )

pkg_setup() {
	python-single-r1_pkg_setup
	ecm_pkg_setup
}

src_configure() {
	# Prevent sandbox violation from FindPyQt5.py module
	# See Gentoo-bug 655918
	addpredict /dev/dri

	local mycmakeargs=(
		-DENABLE_UPDATERS=OFF
		-DFETCH_TRANSLATIONS=OFF
		-DCMAKE_DISABLE_FIND_PACKAGE_KSeExpr=ON # not packaged
		$(cmake_use_find_package color-management OpenColorIO)
		$(cmake_use_find_package fftw FFTW3)
		$(cmake_use_find_package gif GIF)
		$(cmake_use_find_package gsl GSL)
		$(cmake_use_find_package heif HEIF)
		$(cmake_use_find_package jpeg JPEG)
		$(cmake_use_find_package mypaint-brush-engine LibMyPaint)
		$(cmake_use_find_package openexr OpenEXR)
		$(cmake_use_find_package pdf Poppler)
		$(cmake_use_find_package qtmedia Qt5Multimedia)
		$(cmake_use_find_package raw LibRaw)
		$(cmake_use_find_package vc Vc)
		$(cmake_use_find_package webp WebP)
	)

	ecm_src_configure
}
