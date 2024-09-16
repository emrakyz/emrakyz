EAPI=8

inherit cargo git-r3

DESCRIPTION="HDR10+ metadata parsing and writing"
HOMEPAGE="https://github.com/quietvoid/hdr10plus_tool"
EGIT_REPO_URI="https://github.com/quietvoid/hdr10plus_tool.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
    virtual/rust
    dev-util/cargo-c
"

S="${WORKDIR}/${P}/hdr10plus"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure
}

src_compile() {
	cargo_src_compile
	cargo cinstall --release --features capi --prefix="${EPREFIX}/usr" --libdir="$(get_libdir)" || die
}

src_install() {
	cargo cinstall --release --features capi --prefix="${EPREFIX}/usr" --libdir="$(get_libdir)" --destdir="${D}" || die
	einstalldocs
}
