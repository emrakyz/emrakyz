EAPI=8

inherit meson toolchain-funcs git-r3

DESCRIPTION="A dynamic tiling Wayland compositor that doesn't sacrifice on its looks"
HOMEPAGE="https://github.com/hyprwm/Hyprland"
EGIT_REPO_URI="https://github.com/hyprwm/${PN^}.git"

LICENSE="BSD"
SLOT="0"
IUSE="X legacy-renderer systemd"

# hyprpm (hyprland plugin manager) requires the dependencies at runtime
# so that it can clone, compile and install plugins.
HYPRPM_RDEPEND="
	app-alternatives/ninja
	dev-build/cmake
	dev-build/meson
	dev-libs/libliftoff
	dev-vcs/git
	virtual/pkgconfig
"
# bundled wlroots has the following dependency string according to included headers.
# wlroots[drm,gles2-renderer,libinput,x11-backend?,X?]
# enable x11-backend with X and vice versa
WLROOTS_DEPEND="
	dev-libs/wayland
	media-libs/libglvnd
	|| (
		>=media-libs/mesa-24.1.0_rc1[opengl]
		<media-libs/mesa-24.1.0_rc1[egl(+),gles2]
	)
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/pixman
	media-libs/libdisplay-info
	sys-apps/hwdata
	dev-libs/libinput
	sys-auth/seatd
	virtual/libudev
	X? (
		x11-libs/libxcb
		x11-libs/xcb-util
		x11-libs/xcb-util-errors
		x11-libs/xcb-util-renderutil
		x11-libs/xcb-util-wm
		x11-base/xwayland
	)
"
WLROOTS_RDEPEND="
	${WLROOTS_DEPEND}
"
WLROOTS_BDEPEND="
	dev-libs/wayland-protocols
	dev-util/hyprwayland-scanner
	virtual/pkgconfig
"
RDEPEND="
	${HYPRPM_RDEPEND}
	${WLROOTS_RDEPEND}
	dev-cpp/tomlplusplus
	dev-libs/glib:2
	dev-libs/libinput
	dev-libs/wayland
	gui-libs/hyprcursor
	=gui-libs/hyprutils-${PV}
	media-libs/libglvnd
	x11-libs/cairo
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/pixman
	X? (
		x11-libs/libxcb:0=
	)
"
DEPEND="
	${RDEPEND}
	${WLROOTS_DEPEND}
	dev-libs/hyprland-protocols
	dev-libs/hyprlang
	dev-libs/wayland-protocols
"
BDEPEND="
	${WLROOTS_BDEPEND}
	app-misc/jq
	dev-build/cmake
	dev-util/hyprwayland-scanner
	virtual/pkgconfig
"

pkg_setup() {
	[[ ${MERGE_TYPE} == binary ]] && return

	if tc-is-gcc && ver_test $(gcc-version) -lt 13; then
		eerror "Hyprland requires >=sys-devel/gcc-13 to build"
		eerror "Please upgrade GCC: emerge -v1 sys-devel/gcc"
		die "GCC version is too old to compile Hyprland!"
	elif tc-is-clang && ver_test $(clang-version) -lt 16; then
		eerror "Hyprland requires >=sys-devel/clang-16 to build"
		eerror "Please upgrade Clang: emerge -v1 sys-devel/clang"
		die "Clang version is too old to compile Hyprland!"
	fi
}

src_prepare() {
	# skip version.h
	sed -i -e "s|scripts/generateVersion.sh|echo|g" meson.build || die
	default
}

src_configure() {
	local emesonargs=(
		$(meson_feature legacy-renderer legacy_renderer)
		$(meson_feature systemd)
		$(meson_feature X xwayland)
		$(meson_feature X wlroots:xwayland)
		-Dwlroots:backends=drm,libinput$(usev X ',x11')
		-Dwlroots:xcb-errors=disabled
	)

	meson_src_configure
}

src_install() {
	# First install everything except wlroots to avoid conflicts.
	meson_src_install --skip-subprojects wlroots
	# Then install development files (mainly wlroots) for bug #916760.
	meson_src_install --tags devel
}
