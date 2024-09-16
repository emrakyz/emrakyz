EAPI=8

CRATES="
	ab_glyph@0.2.28
	ab_glyph_rasterizer@0.1.8
	adler2@2.0.0
	adler@1.0.2
	aho-corasick@1.1.3
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.88
	assert_cmd@2.0.16
	assert_fs@1.1.2
	autocfg@1.3.0
	bitflags@1.3.2
	bitflags@2.6.0
	bitstream-io@2.5.3
	bitvec_helpers@3.1.6
	bstr@1.10.0
	bumpalo@3.16.0
	bytemuck@1.18.0
	byteorder@1.5.0
	cc@1.1.18
	cfg-if@1.0.0
	clap@4.5.17
	clap_builder@4.5.17
	clap_derive@4.5.13
	clap_lex@0.7.2
	color_quant@1.1.0
	colorchoice@1.0.2
	console@0.15.8
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.23.2
	core-text@20.1.0
	crc32fast@1.4.2
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.20
	difflib@0.4.0
	dirs-sys@0.4.1
	dirs@5.0.1
	dlib@0.5.2
	doc-comment@0.3.3
	dwrote@0.11.1
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.9
	fastrand@2.1.1
	fdeflate@0.3.4
	flate2@1.0.33
	float-cmp@0.9.0
	float-ord@0.3.2
	font-kit@0.14.2
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	freetype-sys@0.20.1
	getrandom@0.2.15
	globset@0.4.15
	globwalk@0.9.1
	hashbrown@0.14.5
	heck@0.5.0
	hevc_parser@0.6.4
	ignore@0.4.23
	image@0.24.9
	indexmap@2.5.0
	indicatif@0.17.8
	instant@0.1.13
	is_terminal_polyfill@1.70.1
	itoa@1.0.11
	jpeg-decoder@0.3.1
	js-sys@0.3.70
	lazy_static@1.5.0
	libc@0.2.158
	libloading@0.8.5
	libredox@0.1.3
	linux-raw-sys@0.4.14
	log@0.4.22
	memchr@2.7.4
	minimal-lexical@0.2.1
	miniz_oxide@0.7.4
	miniz_oxide@0.8.0
	nom@7.1.3
	normalize-line-endings@0.3.0
	num-traits@0.2.19
	number_prefix@0.4.0
	once_cell@1.20.0
	option-ext@0.2.0
	owned_ttf_parser@0.24.0
	pathfinder_geometry@0.5.1
	pathfinder_simd@0.5.4
	pkg-config@0.3.30
	plotters-backend@0.3.7
	plotters-bitmap@0.3.7
	plotters@0.3.7
	png@0.17.13
	portable-atomic@1.7.0
	predicates-core@1.0.8
	predicates-tree@1.0.11
	predicates@3.1.2
	proc-macro2@1.0.86
	quote@1.0.37
	redox_users@0.4.6
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.6
	rustc_version@0.4.1
	rustix@0.38.37
	ryu@1.0.18
	same-file@1.0.6
	semver@1.0.23
	serde@1.0.210
	serde_derive@1.0.210
	serde_json@1.0.128
	shlex@1.3.0
	simd-adler32@0.3.7
	strsim@0.11.1
	syn@2.0.77
	tempfile@3.12.0
	terminal_size@0.3.0
	termtree@0.4.1
	thiserror-impl@1.0.63
	thiserror@1.0.63
	ttf-parser@0.20.0
	ttf-parser@0.24.1
	unicode-ident@1.0.13
	unicode-width@0.1.13
	utf8parse@0.2.2
	wait-timeout@0.2.0
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-shared@0.2.93
	wasm-bindgen@0.2.93
	web-sys@0.3.70
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	wio@0.2.2
	yeslogic-fontconfig-sys@6.0.0
"

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/quietvoid/hdr10plus_tool.git"
DESCRIPTION="HDR10+ metadata parsing and writing"
HOMEPAGE=""
SRC_URI="
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
LICENSE+=" Apache-2.0 BSD ISC MIT MPL-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${P}/hdr10plus"

src_prepare() {
	default
	cargo fetch \
		--manifest-path hdr10plus/Cargo.toml
}

src_compile() {
	cargo cbuild \
		--release \
		--frozen \
		--prefix=/usr \
		--manifest-path hdr10plus/Cargo.toml || die
}

src_install() {
	cd hdr10plus || die

	cargo cinstall \
		--release \
		--frozen \
		--prefix /usr \
		--destdir "${ED}" || die
}
