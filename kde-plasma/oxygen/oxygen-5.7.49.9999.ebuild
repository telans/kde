# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit kde5

DESCRIPTION="KDE window manager theme"
HOMEPAGE="https://projects.kde.org/projects/kde/workspace/oxygen"
KEYWORDS=""
IUSE="wayland"

RDEPEND="
	$(add_frameworks_dep frameworkintegration)
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kguiaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_plasma_dep kdecoration)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	x11-libs/libxcb
	wayland? ( $(add_frameworks_dep kwayland) )
	!kde-base/kdebase-cursors:4
	!kde-base/oxygen:4
"
DEPEND="${RDEPEND}
	$(add_frameworks_dep kservice)
"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package wayland KF5Wayland)
	)

	kde5_src_configure
}
