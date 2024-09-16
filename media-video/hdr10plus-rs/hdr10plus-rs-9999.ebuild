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

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cd "${S}/hdr10plus" || die
	cargo_src_configure
}

src_compile() {
	cd "${S}/hdr10plus" || die
	cargo cinstall --release --features capi --prefix="${EPREFIX}/usr" --library-type=staticlib --library-type=cdylib || die
}

src_install() {
	cd "${S}/hdr10plus" || die
	cargo cinstall --release --features capi --prefix="${EPREFIX}/usr" --destdir="${D}" --library-type=staticlib --library-type=cdylib || die
}
