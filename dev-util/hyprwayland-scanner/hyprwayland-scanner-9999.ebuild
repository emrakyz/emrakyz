EAPI=8

inherit git-r3 cmake toolchain-funcs

DESCRIPTION="Wayland Scanner for Hyprland"
HOMEPAGE="https://github.com/hyprwm/hyprwayland-scanner"
EGIT_REPO_URI="https://github.com/hyprwm/hyprwayland-scanner.git"

LICENSE="BSD"
SLOT="0"

RDEPEND=">=dev-libs/pugixml-1.14"
DEPEND="${RDEPEND}"

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
