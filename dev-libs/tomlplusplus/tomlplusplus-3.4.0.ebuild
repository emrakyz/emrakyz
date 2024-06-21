EAPI=8

inherit cmake

DESCRIPTION="A header-only TOML parser and serializer for C++."
HOMEPAGE="https://github.com/marzer/tomlplusplus"
SRC_URI="https://github.com/marzer/tomlplusplus/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_configure() {
    cmake_src_configure
}
