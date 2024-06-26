EAPI=8

CRATES="
	ab_glyph-0.2.20
	ab_glyph_rasterizer-0.1.8
	adler-1.0.2
	aho-corasick-0.7.20
	anyhow-1.0.69
	assert_cmd-2.0.8
	assert_fs-1.0.10
	autocfg-1.1.0
	bitflags-1.3.2
	bitstream-io-1.6.0
	bitvec_helpers-3.1.2
	bstr-1.3.0
	bumpalo-3.12.0
	bytemuck-1.13.1
	byteorder-1.4.3
	cc-1.0.79
	cfg-if-1.0.0
	clap-4.1.8
	clap_derive-4.1.8
	clap_lex-0.3.2
	cmake-0.1.49
	color_quant-1.1.0
	console-0.15.5
	const-cstr-0.3.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	core-graphics-0.22.3
	core-graphics-types-0.1.1
	core-text-19.2.0
	crc32fast-1.3.2
	difflib-0.4.0
	dirs-next-2.0.0
	dirs-sys-next-0.1.2
	dlib-0.5.0
	doc-comment-0.3.3
	dwrote-0.11.0
	either-1.8.1
	encode_unicode-0.3.6
	errno-0.2.8
	errno-dragonfly-0.1.2
	fastrand-1.9.0
	flate2-1.0.25
	float-cmp-0.9.0
	float-ord-0.2.0
	fnv-1.0.7
	font-kit-0.11.0
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	freetype-0.7.0
	freetype-sys-0.13.1
	getrandom-0.2.8
	globset-0.4.10
	globwalk-0.8.1
	hashbrown-0.12.3
	heck-0.4.1
	hermit-abi-0.3.1
	hevc_parser-0.6.1
	ignore-0.4.20
	image-0.24.5
	indexmap-1.9.2
	indicatif-0.17.3
	instant-0.1.12
	io-lifetimes-1.0.5
	is-terminal-0.4.4
	itertools-0.10.5
	itoa-1.0.5
	jpeg-decoder-0.3.0
	js-sys-0.3.61
	lazy_static-1.4.0
	libc-0.2.139
	libloading-0.7.4
	linux-raw-sys-0.1.4
	log-0.4.17
	memchr-2.5.0
	minimal-lexical-0.2.1
	miniz_oxide-0.6.2
	nom-7.1.3
	normalize-line-endings-0.3.0
	num-integer-0.1.45
	num-rational-0.4.1
	num-traits-0.2.15
	number_prefix-0.4.0
	once_cell-1.17.1
	os_str_bytes-6.4.1
	owned_ttf_parser-0.18.1
	pathfinder_geometry-0.5.1
	pathfinder_simd-0.5.1
	pest-2.5.5
	pkg-config-0.3.26
	png-0.17.7
	portable-atomic-0.3.19
	predicates-2.1.5
	predicates-core-1.0.5
	predicates-tree-1.0.7
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.51
	quote-1.0.23
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.7.1
	regex-automata-0.1.10
	regex-syntax-0.6.28
	rustc_version-0.3.3
	rustix-0.36.8
	ryu-1.0.12
	same-file-1.0.6
	semver-0.11.0
	semver-parser-0.10.2
	serde-1.0.152
	serde_derive-1.0.152
	serde_json-1.0.93
	strsim-0.10.0
	syn-1.0.109
	tempfile-3.4.0
	termcolor-1.2.0
	terminal_size-0.2.5
	termtree-0.4.0
	thiserror-1.0.38
	thiserror-impl-1.0.38
	thread_local-1.1.7
	ttf-parser-0.17.1
	ttf-parser-0.18.1
	ucd-trie-0.1.5
	unicode-ident-1.0.6
	unicode-width-0.1.10
	version_check-0.9.4
	wait-timeout-0.2.0
	walkdir-2.3.2
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.84
	wasm-bindgen-backend-0.2.84
	wasm-bindgen-macro-0.2.84
	wasm-bindgen-macro-support-0.2.84
	wasm-bindgen-shared-0.2.84
	web-sys-0.3.61
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-targets-0.42.1
	windows_aarch64_gnullvm-0.42.1
	windows_aarch64_msvc-0.42.1
	windows_i686_gnu-0.42.1
	windows_i686_msvc-0.42.1
	windows_x86_64_gnu-0.42.1
	windows_x86_64_gnullvm-0.42.1
	windows_x86_64_msvc-0.42.1
	wio-0.2.2
	yeslogic-fontconfig-sys-3.2.0
"

inherit cargo

DESCRIPTION="CLI utility to work with HDR10+ in HEVC files."

HOMEPAGE="https://github.com/quietvoid/hdr10plus_tool"
SRC_URI="
	$(cargo_crate_uris)
	https://github.com/quietvoid/hdr10plus_tool/archive/${PV}.tar.gz -> ${P}.tar.gz"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Boost-1.0 MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="network-sandbox"

src_unpack() {
	cargo_src_unpack
	#git-r3_src_unpack

	# TODO: Figure out how to get these deps for offline mode.
	pushd "${S}"
	cargo -v --config "net.offline = false" fetch
	popd
}

src_install() {
	dobin "${S}/target/release/hdr10plus_tool"
}
