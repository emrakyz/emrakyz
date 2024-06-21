EAPI=8

inherit cmake git-r3

DESCRIPTION="A small C++ library for utilities used across the Hypr* ecosystem"
HOMEPAGE="https://github.com/hyprwm/hyprutils"
EGIT_REPO_URI="https://github.com/hyprwm/hyprutils.git"

LICENSE="BSD"
SLOT="0"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_INSTALL_PREFIX=/usr
	)

	cmake_src_configure
}
