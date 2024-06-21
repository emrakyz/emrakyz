EAPI=8

inherit cmake git-r3

DESCRIPTION="Hyprlang - a programming language from HyprWM"
HOMEPAGE="https://github.com/hyprwm/hyprlang"
EGIT_REPO_URI="https://github.com/hyprwm/hyprlang.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${P}"

src_configure() {
    local mycmakeargs=(
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX:PATH=/usr
        -S "${S}"
        -B "${WORKDIR}/${P}_build"
    )
    cmake_src_configure
}

src_compile() {
    cmake --build "${WORKDIR}/${P}_build" --config Release --target hyprlang -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
}

src_install() {
    cmake --install "${WORKDIR}/${P}_build" --prefix "${D}/usr"
}
