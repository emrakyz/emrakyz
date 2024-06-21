EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aho-corasick@1.1.2
	anes@0.1.6
	anstream@0.6.11
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.4
	anyhow@1.0.82
	autocfg@1.1.0
	backtrace@0.3.69
	bitflags@2.4.1
	bumpalo@3.14.0
	bytes@1.5.0
	cast@0.3.0
	cc@1.0.83
	cfg-if@1.0.0
	ciborium-io@0.2.1
	ciborium-ll@0.2.1
	ciborium@0.2.1
	clap@4.5.4
	clap_builder@4.5.2
	clap_derive@4.5.4
	clap_lex@0.7.0
	colorchoice@1.0.0
	colored_json@5.0.0
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-deque@0.8.4
	crossbeam-epoch@0.9.16
	crossbeam-utils@0.8.17
	either@1.9.0
	equivalent@1.0.1
	errno@0.3.8
	gimli@0.28.1
	half@1.8.2
	hashbrown@0.14.3
	heck@0.5.0
	hermit-abi@0.3.3
	indexmap@2.2.3
	is-terminal@0.4.9
	itertools@0.10.5
	itoa@1.0.10
	js-sys@0.3.66
	libc@0.2.151
	linux-raw-sys@0.4.12
	log@0.4.20
	memchr@2.6.4
	memoffset@0.9.0
	miniz_oxide@0.7.1
	num-traits@0.2.17
	num_cpus@1.16.0
	object@0.32.1
	once_cell@1.19.0
	oorandom@11.1.3
	pin-project-lite@0.2.13
	plotters-backend@0.3.5
	plotters-svg@0.3.5
	plotters@0.3.5
	proc-macro2@1.0.76
	psm@0.1.21
	quote@1.0.35
	rayon-core@1.12.1
	rayon@1.10.0
	regex-automata@0.4.3
	regex-syntax@0.8.2
	regex@1.10.2
	rustc-demangle@0.1.23
	rustix@0.38.28
	ryu@1.0.16
	same-file@1.0.6
	serde@1.0.198
	serde_derive@1.0.198
	serde_json@1.0.116
	serde_stacker@0.1.11
	stacker@0.1.15
	strsim@0.11.0
	syn@2.0.48
	thiserror-impl@1.0.59
	thiserror@1.0.59
	tinytemplate@1.2.1
	tokio-macros@2.2.0
	tokio@1.37.0
	unicode-ident@1.0.12
	utf8parse@0.2.1
	walkdir@2.4.0
	wasm-bindgen-backend@0.2.89
	wasm-bindgen-macro-support@0.2.89
	wasm-bindgen-macro@0.2.89
	wasm-bindgen-shared@0.2.89
	wasm-bindgen@0.2.89
	web-sys@0.3.66
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.6.6
	yansi@1.0.1
"

inherit cargo

DESCRIPTION="jql - JSON Query Language - is a fast and simple command-line tool to manipulate JSON data."
HOMEPAGE=""
SRC_URI="
	https://github.com/yamafaktory/${PN}/archive/refs/tags/jql-v7.1.8.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="|| ( Apache-2.0 MIT )"
LICENSE+=" Apache-2.0 EPL-2.0 MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/bin/jql"

S="${WORKDIR}/jql-jql-v7.1.8"

src_unpack() {
    default
	cargo_src_unpack
}

src_prepare() {
    default
}

src_install() {
	cargo_src_install --path "./crates/jql"
}
