EAPI=8

CRATES="
	aho-corasick@0.7.19
	atty@0.2.14
	autocfg@1.1.0
	bitflags@1.3.2
	cc@1.0.73
	cfg-if@1.0.0
	clap@4.0.18
	clap_lex@0.3.0
	clipboard-win@4.4.2
	directories@4.0.1
	dirs-sys@0.3.7
	errno-dragonfly@0.1.2
	errno@0.2.8
	error-code@2.3.1
	fd-lock@3.0.6
	getrandom@0.2.8
	hermit-abi@0.1.19
	io-lifetimes@0.7.3
	libc@0.2.135
	linux-raw-sys@0.0.46
	log@0.4.17
	memchr@2.5.0
	nix@0.24.2
	num-bigint@0.4.3
	num-complex@0.4.2
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.4.1
	num-traits@0.2.15
	num@0.4.0
	once_cell@1.15.0
	os_str_bytes@6.3.0
	proc-macro2@1.0.47
	quote@1.0.21
	redox_syscall@0.2.16
	redox_users@0.4.3
	regex-syntax@0.6.27
	regex@1.6.0
	rustix@0.35.11
	rustyline@10.0.0
	scopeguard@1.1.0
	str-buf@1.0.6
	strsim@0.10.0
	syn@1.0.103
	termcolor@1.1.3
	terminal_size@0.2.1
	thiserror-impl@1.0.37
	thiserror@1.0.37
	unicode-ident@1.0.5
	unicode-segmentation@1.10.0
	unicode-width@0.1.10
	utf8parse@0.2.0
	wasi@0.11.0+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.36.1
	windows_aarch64_msvc@0.36.1
	windows_i686_gnu@0.36.1
	windows_i686_msvc@0.36.1
	windows_x86_64_gnu@0.36.1
	windows_x86_64_msvc@0.36.1
"

inherit cargo

DESCRIPTION="Calculator REPL similar to bc(1)"
HOMEPAGE="https://github.com/nerdypepper/eva"
SRC_URI="
	https://github.com/nerdypepper/eva/archive/refs/tags/v0.3.1.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Boost-1.0 MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

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
