EAPI=8

inherit meson

DESCRIPTION="A Fork of Rofi with wayland support"
HOMEPAGE="https://github.com/lbonn/rofi/tree/wayland"
SRC_URI="https://github.com/lbonn/rofi/releases/download/1.7.5%2Bwayland3/rofi-1.7.5+wayland3.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
    x11-libs/xcb-util-cursor
    x11-libs/startup-notification
	x11-libs/xcb-util-wm
	"

RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	if [[ -n ${A} ]]; then
        unpack ${A}
		mv rofi-${PV}+wayland3 ${P}
	fi
}
