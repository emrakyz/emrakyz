EAPI=8

CRATES="
	ahash@0.7.6
	anyhow@1.0.56
	assert_cmd@2.0.4
	atty@0.2.14
	autocfg@1.1.0
	bitflags@1.3.2
	bstr@0.2.17
	cfg-if@1.0.0
	clap@3.1.9
	clap_lex@0.1.1
	difflib@0.4.0
	doc-comment@0.3.3
	either@1.6.1
	getrandom@0.2.6
	hashbrown@0.11.2
	hermit-abi@0.1.19
	indexmap@1.8.1
	itertools@0.10.3
	lazy_static@1.4.0
	libc@0.2.123
	memchr@2.4.1
	once_cell@1.10.0
	os_str_bytes@6.0.0
	predicates-core@1.0.3
	predicates-tree@1.0.5
	predicates@2.1.1
	regex-automata@0.1.10
	strsim@0.10.0
	termcolor@1.1.3
	termtree@0.2.4
	textwrap@0.15.0
	version_check@0.9.4
	wait-timeout@0.2.0
	wasi@0.10.2+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
"

inherit cargo

DESCRIPTION="Filter out duplicates on the command line."
HOMEPAGE=""
SRC_URI="
	https://github.com/koraa/huniq/archive/refs/tags/latest.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="BSD"
# Dependent crate licenses
LICENSE+=" MIT"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/bin/huniq"

S="${WORKDIR}/huniq-latest"

src_unpack() {
    default
	cargo_src_unpack
}

src_prepare() {
    default
}

src_install() {
	cargo_src_install
}
