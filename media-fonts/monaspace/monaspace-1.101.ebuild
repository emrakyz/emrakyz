EAPI=8

inherit font

DESCRIPTION="A monospace type superfamily"
HOMEPAGE="https://monaspace.githubnext.com/"
SRC_URI="https://github.com/githubnext/monaspace/releases/download/v${PV}/monaspace-v${PV}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/monaspace-v${PV}/fonts/otf"
FONT_SUFFIX="otf"
