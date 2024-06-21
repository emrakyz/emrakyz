EAPI=8

inherit git-r3 cmake

DESCRIPTION="The hyprland cursor format, library and utilities"
HOMEPAGE="https://github.com/hyprwm/hyprcursor"
EGIT_REPO_URI="https://github.com/hyprwm/hyprcursor.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~riscv"

# Disable tests since as per upstream, tests require a theme to be installed
# See also https://github.com/hyprwm/hyprcursor/commit/94361fd8a75178b92c4bb24dcd8c7fac8423acf3
#RESTRICT="test"

RDEPEND="
	dev-cpp/tomlplusplus
	>=dev-libs/hyprlang-0.4.2
	dev-libs/libzip
	gnome-base/librsvg:2
	"
