# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
KFMIN=9999
QTMIN=5.15.2
inherit ecm kde.org

DESCRIPTION="Plasma applet for audio volume management using PulseAudio"

LICENSE="GPL-2" # TODO: CHECK
SLOT="5"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/glib:2
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kglobalaccel-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/plasma-${KFMIN}:5
	media-libs/libcanberra
	media-sound/pulseaudio
"
RDEPEND="${DEPEND}
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	|| (
		media-video/pipewire
		media-sound/pulseaudio-daemon
		media-sound/pulseaudio[daemon(+)]
	)
	x11-themes/sound-theme-freedesktop
"
