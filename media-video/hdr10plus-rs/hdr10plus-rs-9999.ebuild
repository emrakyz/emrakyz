# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

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
"

S="${WORKDIR}/${P}/hdr10plus"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_src_configure --no-default-features --features capi
}

src_compile() {
	cargo_src_compile --no-default-features --features capi
}

src_install() {
	cargo_src_install --no-default-features --features capi

	# Install the pkg-config file manually
	insinto /usr/$(get_libdir)/pkgconfig
	doins "${S}/target/release/hdr10plus-rs.pc"
}
