EAPI=8

inherit font

DESCRIPTION="A modern monospace font"
HOMEPAGE="https://github.com/0xType/0xProto"
SRC_URI="https://github.com/0xType/0xProto/releases/download/${PV}/0xProto_${PV/./_}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"
FONT_SUFFIX="otf"
