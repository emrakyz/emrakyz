# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	adler32@1.2.0
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	aligned-vec@0.5.0
	allocator-api2@0.2.21
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anes@0.1.6
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.97
	arbitrary@1.4.1
	arg_enum_proc_macro@0.3.4
	arrayref@0.3.9
	arrayvec@0.7.6
	as-raw-xcb-connection@1.0.1
	ash@0.38.0+1.3.281
	assert_fs@1.1.2
	async-broadcast@0.7.2
	async-channel@2.3.1
	async-executor@1.13.1
	async-fs@2.1.2
	async-io@2.4.0
	async-lock@3.4.0
	async-net@2.0.0
	async-process@2.3.0
	async-recursion@1.1.1
	async-signal@0.2.10
	async-task@4.7.1
	async-trait@0.1.87
	atomic-waker@1.1.2
	atomic@0.6.0
	autocfg@1.4.0
	av1-grain@0.2.3
	avif-serialize@0.8.3
	az@1.2.1
	backtrace@0.3.74
	base64@0.13.1
	base64@0.21.7
	base64@0.22.1
	benchmarking@0.4.13
	bit-set@0.5.3
	bit-set@0.8.0
	bit-vec@0.6.3
	bit-vec@0.8.0
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.9.0
	bitstream-io@2.6.0
	block-buffer@0.10.4
	block2@0.6.0
	block@0.1.6
	blocking@1.6.1
	bstr@1.11.3
	built@0.7.7
	bumpalo@3.17.0
	bytemuck@1.22.0
	bytemuck_derive@1.8.1
	byteorder-lite@0.1.0
	byteorder@1.5.0
	bytes@1.10.1
	cairo-rs@0.18.5
	camino@1.1.9
	cassowary@0.3.0
	cast@0.3.0
	cc@1.2.16
	cfg-expr@0.15.8
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	cgl@0.3.2
	chrono@0.4.40
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clap@4.5.31
	clap_builder@4.5.31
	clap_complete@4.5.46
	clap_complete_fig@4.5.2
	clap_derive@4.5.28
	clap_lex@0.7.4
	clipboard-win@2.2.0
	cocoa-foundation@0.2.0
	cocoa@0.26.0
	codespan-reporting@0.11.1
	color_quant@1.1.0
	colorchoice@1.0.3
	colored@2.2.0
	colorgrad@0.6.2
	concurrent-queue@2.5.0
	core-foundation-sys@0.8.7
	core-foundation@0.10.0
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics-types@0.2.0
	core-graphics@0.24.0
	core-text@21.0.0
	core2@0.4.0
	cpufeatures@0.2.17
	crc32fast@1.4.2
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-channel@0.5.14
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.12
	crossbeam-utils@0.8.21
	crossbeam@0.8.4
	crunchy@0.2.3
	crypto-common@0.1.6
	csscolorparser@0.6.2
	cursor-icon@1.1.0
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	dary_heap@0.3.7
	data-encoding@2.8.0
	deltae@0.3.2
	deranged@0.3.11
	dhat@0.3.3
	diff@0.1.13
	difflib@0.4.0
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	displaydoc@0.2.5
	dlib@0.5.2
	dns-lookup@2.0.4
	doc-comment@0.3.3
	document-features@0.2.11
	downcast-rs@1.2.1
	dwrote@0.11.2
	either@1.15.0
	embed-resource@1.8.0
	emojis@0.6.4
	encoding_rs@0.8.35
	endi@1.1.0
	enum-display-derive@0.1.1
	enumflags2@0.7.11
	enumflags2_derive@0.7.11
	env_filter@0.1.3
	env_home@0.1.0
	env_logger@0.10.2
	env_logger@0.11.6
	equivalent@1.0.2
	erased-serde@0.4.6
	errno@0.3.10
	euclid@0.22.11
	event-listener-strategy@0.5.3
	event-listener@5.4.0
	exr@1.73.0
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	fancy-regex@0.11.0
	fastrand@2.3.0
	fdeflate@0.3.7
	filenamegen@0.2.7
	filetime@0.2.25
	finl_unicode@1.3.0
	fixed@1.29.0
	fixedbitset@0.4.2
	flate2@1.1.0
	float-cmp@0.10.0
	flume@0.11.1
	fnv@1.0.7
	foldhash@0.1.4
	foreign-types-macros@0.2.3
	foreign-types-shared@0.1.1
	foreign-types-shared@0.3.1
	foreign-types@0.3.2
	foreign-types@0.5.0
	form_urlencoded@1.2.1
	fsevent-sys@4.1.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-lite@2.6.0
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-timer@3.0.3
	futures-util@0.3.31
	futures@0.3.31
	generic-array@0.14.7
	gethostname@0.5.0
	getrandom@0.2.15
	getrandom@0.3.1
	gif@0.13.1
	gimli@0.31.1
	git2@0.20.0
	gl_generator@0.14.0
	glium@0.35.0
	glob@0.3.2
	globset@0.4.16
	globwalk@0.9.1
	glow@0.16.0
	glutin_wgl_sys@0.6.1
	governor@0.5.1
	gpu-alloc-types@0.3.0
	gpu-alloc@0.6.0
	gpu-allocator@0.27.0
	gpu-descriptor-types@0.2.0
	gpu-descriptor@0.3.1
	guillotiere@0.6.2
	h2@0.4.8
	half@2.4.1
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.15.2
	hashlink@0.9.1
	hdrhistogram@7.5.4
	heck@0.5.0
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hex@0.4.3
	hexf-parse@0.2.1
	hostname@0.4.0
	http-body-util@0.1.2
	http-body@1.0.1
	http@1.2.0
	http_req@0.11.1
	httparse@1.10.1
	humansize@2.1.3
	humantime@2.1.0
	hyper-rustls@0.27.5
	hyper-tls@0.6.0
	hyper-util@0.1.10
	hyper@1.6.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	ident_case@1.0.1
	idna@1.0.3
	idna_adapter@1.2.0
	ignore@0.4.23
	image-webp@0.2.1
	image@0.25.5
	imgref@1.11.0
	indexmap@1.9.3
	indexmap@2.7.1
	inotify-sys@0.1.5
	inotify@0.9.6
	interpolate_name@0.2.4
	intrusive-collections@0.9.7
	io-lifetimes@1.0.11
	ipnet@2.11.0
	is-terminal@0.4.15
	is_terminal_polyfill@1.70.1
	itertools@0.10.5
	itertools@0.12.1
	itoa@1.0.15
	jni-sys@0.3.0
	jobserver@0.1.32
	jpeg-decoder@0.3.1
	js-sys@0.3.77
	k9@0.12.0
	khronos-egl@6.0.0
	khronos_api@3.1.0
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lab@0.11.0
	lazy_static@1.5.0
	lazycell@1.3.0
	leb128@0.2.5
	lebe@0.5.2
	libc@0.2.170
	libflate@2.1.0
	libflate_lz77@2.1.0
	libfuzzer-sys@0.4.9
	libgit2-sys@0.18.0+1.9.0
	libloading@0.8.6
	libm@0.2.11
	libredox@0.1.3
	libsqlite3-sys@0.30.1
	libssh-rs-sys@0.2.6
	libssh-rs@0.3.5
	libssh2-sys@0.3.1
	libz-sys@1.1.21
	line_drawing@0.8.1
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.15
	linux-raw-sys@0.9.2
	litemap@0.7.5
	litrs@0.4.1
	lock_api@0.4.12
	log@0.4.26
	loop9@0.1.5
	lru@0.12.5
	lua-src@547.0.0
	luajit-src@210.5.12+a4f56a4
	mac_address@1.1.8
	mach2@0.4.2
	malloc_buf@0.0.6
	maplit@1.0.2
	maybe-rayon@0.1.1
	memchr@2.7.4
	memmap2@0.8.0
	memmap2@0.9.5
	memmem@0.1.1
	memoffset@0.9.1
	metal@0.31.0
	metrics@0.23.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.4
	miniz_oxide@0.8.5
	mintex@0.1.3
	mio@0.8.11
	mio@1.0.3
	mlua-sys@0.6.7
	mlua@0.9.9
	naga@24.0.0
	names@0.12.0
	nanorand@0.7.0
	native-tls@0.2.14
	ndk-sys@0.5.0+25.2.9519653
	new_debug_unreachable@1.0.6
	nix@0.29.0
	no-std-compat@0.4.1
	nom@7.1.3
	nonzero_ext@0.3.0
	noop_proc_macro@0.3.0
	normalize-line-endings@0.3.0
	notify@5.2.0
	ntapi@0.4.1
	nucleo-matcher@0.3.1
	num-bigint@0.4.6
	num-complex@0.4.6
	num-conv@0.1.0
	num-derive@0.4.2
	num-integer@0.1.46
	num-iter@0.1.45
	num-rational@0.4.2
	num-traits@0.2.19
	num@0.4.3
	objc2-core-foundation@0.3.0
	objc2-core-graphics@0.3.0
	objc2-core-location@0.3.0
	objc2-encode@4.1.0
	objc2-foundation@0.3.0
	objc2-io-surface@0.3.0
	objc2-metal@0.3.0
	objc2-user-notifications@0.3.0
	objc2@0.6.0
	objc@0.2.7
	object@0.36.7
	once_cell@1.20.3
	oorandom@11.1.4
	openssl-macros@0.1.1
	openssl-probe@0.1.6
	openssl-src@300.4.2+3.4.1
	openssl-sys@0.9.106
	openssl@0.10.71
	ordered-float@2.10.1
	ordered-float@4.6.0
	ordered-stream@0.2.0
	parking@2.2.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	passfd@0.1.6
	paste@1.0.15
	pem@3.0.5
	percent-encoding@2.3.1
	pest@2.7.15
	pest_derive@2.7.15
	pest_generator@2.7.15
	pest_meta@2.7.15
	phf@0.11.3
	phf_codegen@0.11.3
	phf_generator@0.11.3
	phf_macros@0.11.3
	phf_shared@0.11.3
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	piper@0.2.4
	pkg-config@0.3.32
	plist@1.7.0
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	png@0.17.16
	polling@3.7.4
	portable-atomic@1.11.0
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	predicates-core@1.0.9
	predicates-tree@1.0.12
	predicates@3.1.3
	presser@0.3.1
	proc-macro-crate@3.3.0
	proc-macro2@1.0.94
	profiling-procmacros@1.0.16
	profiling@1.0.16
	pure-rust-locales@0.8.1
	qoi@0.4.1
	quick-error@2.0.1
	quick-xml@0.30.0
	quick-xml@0.32.0
	quick-xml@0.37.2
	quote@1.0.39
	rand@0.8.5
	rand@0.9.0
	rand_chacha@0.3.1
	rand_chacha@0.9.0
	rand_core@0.6.4
	rand_core@0.9.3
	range-alloc@0.1.4
	rav1e@0.7.1
	ravif@0.11.11
	raw-window-handle@0.6.2
	rayon-core@1.12.1
	rayon@1.10.0
	rcgen@0.12.1
	redox_syscall@0.5.10
	redox_users@0.4.6
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	relative-path@1.9.3
	renderdoc-sys@1.1.0
	reqwest@0.12.12
	resize@0.5.5
	rgb@0.8.50
	ring@0.17.12
	rle-decode-fast@1.0.3
	rstest@0.21.0
	rstest_macros@0.21.0
	rusqlite@0.32.1
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustc-hash@2.1.1
	rustc_version@0.4.1
	rustix@0.37.28
	rustix@0.38.44
	rustix@1.0.0
	rustls-pemfile@2.2.0
	rustls-pki-types@1.11.0
	rustls-webpki@0.102.8
	rustls@0.23.23
	rustversion@1.0.20
	ryu@1.0.20
	same-file@1.0.6
	schannel@0.1.27
	scoped-tls@1.0.1
	scopeguard@1.2.0
	security-framework-sys@2.14.0
	security-framework@2.11.1
	semver@1.0.26
	serde-value@0.7.0
	serde@1.0.218
	serde_derive@1.0.218
	serde_json@1.0.140
	serde_repr@0.1.20
	serde_spanned@0.6.8
	serde_urlencoded@0.7.1
	serde_with@2.3.3
	serde_with_macros@2.3.3
	serde_yaml@0.9.34+deprecated
	serial2@0.2.28
	sha1@0.10.6
	sha2@0.10.8
	shared_library@0.1.9
	shell-words@1.1.0
	shlex@1.3.0
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simd-adler32@0.3.7
	simd_helpers@0.1.0
	siphasher@1.0.1
	slab@0.4.9
	slotmap@1.0.7
	smallvec@1.14.0
	smawk@0.3.2
	smithay-client-toolkit@0.19.2
	smol@2.0.2
	socket2@0.5.8
	spa@0.3.1
	spin@0.9.8
	spirv@0.3.0+sdk-1.3.268.0
	sqlite-cache@0.1.4
	ssh2@0.9.5
	stable_deref_trait@1.2.0
	starship-battery@0.10.0
	static_assertions@1.1.0
	strict-num@0.1.1
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	svg_fmt@0.4.4
	syn@1.0.109
	syn@2.0.99
	sync_wrapper@1.0.2
	synstructure@0.13.1
	system-configuration-sys@0.6.0
	system-configuration@0.6.1
	system-deps@6.2.2
	tar@0.4.44
	target-lexicon@0.12.16
	tempfile@3.18.0
	termcolor@1.4.1
	terminal_size@0.2.6
	terminfo@0.9.0
	termios@0.3.3
	termtree@0.5.1
	textwrap@0.16.2
	thiserror-impl@1.0.69
	thiserror-impl@2.0.12
	thiserror@1.0.69
	thiserror@2.0.12
	thousands@0.2.0
	tiff@0.9.1
	time-core@0.1.3
	time-macros@0.2.20
	time@0.3.39
	tiny-skia-path@0.11.4
	tiny-skia@0.11.4
	tinystr@0.7.6
	tinytemplate@1.2.1
	tinyvec@1.9.0
	tinyvec_macros@0.1.1
	tokio-macros@2.5.0
	tokio-native-tls@0.3.1
	tokio-rustls@0.26.2
	tokio-util@0.7.13
	tokio@1.43.0
	toml@0.5.11
	toml@0.8.20
	toml_datetime@0.6.8
	toml_edit@0.22.24
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.2
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing@0.1.41
	try-lock@0.2.5
	typeid@1.0.3
	typenum@1.18.0
	ucd-trie@0.1.7
	uds_windows@1.1.0
	unicase@2.8.1
	unicode-ident@1.0.18
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.24
	unicode-segmentation@1.12.0
	unicode-width@0.1.14
	unicode-width@0.2.0
	unicode-xid@0.2.6
	unsafe-libyaml@0.2.11
	untrusted@0.9.0
	uom@0.36.0
	url@2.5.4
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	uuid@1.15.1
	v_frame@0.3.8
	varbincode@0.1.0
	vcpkg@0.2.15
	version-compare@0.2.0
	version_check@0.9.5
	vswhom-sys@0.1.3
	vswhom@0.1.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.13.3+wasi-0.2.2
	wasite@0.1.0
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-futures@0.4.50
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	wayland-backend@0.3.8
	wayland-client@0.31.8
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.8
	wayland-egl@0.32.5
	wayland-protocols-wlr@0.3.6
	wayland-protocols@0.32.6
	wayland-scanner@0.31.6
	wayland-sys@0.31.6
	web-sys@0.3.77
	weezl@0.1.8
	wgpu-core@24.0.2
	wgpu-hal@24.0.2
	wgpu-types@24.0.0
	wgpu@24.0.1
	which@7.0.2
	whoami@1.5.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.58.0
	windows-implement@0.58.0
	windows-interface@0.58.0
	windows-link@0.1.0
	windows-registry@0.2.0
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.33.0
	windows@0.52.0
	windows@0.58.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.33.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.33.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.33.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.33.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.33.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.7.3
	winreg@0.10.1
	winsafe@0.0.19
	wio@0.2.2
	wit-bindgen-rt@0.33.0
	write16@1.0.0
	writeable@0.5.5
	x11@2.21.0
	xattr@1.5.0
	xcb@1.5.0
	xcursor@0.3.8
	xdg-home@1.3.0
	xkbcommon@0.7.0
	xkeysym@0.2.1
	xml-rs@0.8.25
	yasna@0.5.2
	yoke-derive@0.7.5
	yoke@0.7.5
	zbus@4.4.0
	zbus_macros@4.4.0
	zbus_names@3.0.0
	zerocopy-derive@0.7.35
	zerocopy-derive@0.8.23
	zerocopy@0.7.35
	zerocopy@0.8.23
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zeroize@1.8.1
	zerovec-derive@0.10.3
	zerovec@0.10.4
	zstd-safe@5.0.2+zstd.1.5.2
	zstd-sys@2.0.14+zstd.1.5.7
	zstd@0.11.2+zstd.1.5.2
	zune-core@0.4.12
	zune-inflate@0.2.54
	zune-jpeg@0.4.14
	zvariant@4.2.0
	zvariant_derive@4.2.0
	zvariant_utils@2.1.0
"

declare -A GIT_CRATES=(
	[sqlite - cache]='https://github.com/losfair/sqlite-cache;0961b50385ff189bb12742716331c05ed0bf7805;sqlite-cache-%commit%'
	[xcb - imdkit]='https://github.com/wez/xcb-imdkit-rs;358e226573461fe540efb920e2aad740e3c6fab1;xcb-imdkit-rs-%commit%'
)

inherit bash-completion-r1 desktop cargo xdg
if [[ -z ${PV%%*9999} ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wez/${PN}"
	unset GIT_CRATES
else
	MY_PV="51c794ac"
	[[ -n ${PV%%*_p*} ]] && MY_PV="$(ver_rs 1 -)-${MY_PV}"
	MY_HB="harfbuzz-9c03576"
	MY_FT="freetype2-e4586d9"
	MY_LP="libpng-8439534"
	MY_ZL="zlib-cacf7f1"
	SRC_URI="
		mirror://githubcl/wez/${PN}/tar.gz/${MY_PV} -> ${P}.tar.gz
		mirror://githubcl/harfbuzz/${MY_HB%-*}/tar.gz/${MY_HB##*-} -> ${MY_HB}.tar.gz
		mirror://githubcl/wez/${MY_FT%-*}/tar.gz/${MY_FT##*-} -> ${MY_FT}.tar.gz
		mirror://githubcl/glennrp/${MY_LP%-*}/tar.gz/${MY_LP##*-} -> ${MY_LP}.tar.gz
		mirror://githubcl/madler/${MY_ZL%-*}/tar.gz/${MY_ZL##*-} -> ${MY_ZL}.tar.gz
		${CARGO_CRATE_URIS}
	"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${MY_PV}"
fi

DESCRIPTION="A GPU-accelerated cross-platform terminal emulator and multiplexer"
HOMEPAGE="https://wezfurlong.org/wezterm/"

LICENSE="MIT"
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD CC0-1.0 ISC
	LGPL-2.1 MIT MPL-2.0 Unicode-DFS-2016 WTFPL-2 ZLIB
"
SLOT="0"
IUSE="wayland"

RESTRICT=test # tests require network
RESTRICT+=" primaryuri"

DEPEND="
	dev-libs/openssl
	wayland? ( dev-libs/wayland )
	media-fonts/jetbrains-mono
	media-fonts/noto
	media-fonts/noto-emoji
	media-fonts/roboto
	media-libs/fontconfig
	media-libs/mesa
	sys-apps/dbus
	x11-libs/libX11
	x11-libs/libxkbcommon[X,wayland?]
	x11-libs/xcb-imdkit
	x11-libs/xcb-util
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-wm
	x11-themes/hicolor-icon-theme
	x11-themes/xcursor-themes
"
RDEPEND="
	${DEPEND}
	media-fonts/jetbrains-mono
	media-fonts/roboto
"
BDEPEND="
	dev-build/cmake
	dev-vcs/git
	virtual/pkgconfig
"

src_unpack() {
	if [[ -z ${PV%%*9999} ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

PATCHES=(
	"${FILESDIR}/fix_sync.patch"
)

src_prepare() {
	if [[ -n ${PV%%*9999} ]]; then
		mv -t deps/harfbuzz/${MY_HB%-*} ../${MY_HB}/*
		mv -t deps/freetype/${MY_FT%-*} ../${MY_FT}/*
		mv -t deps/freetype/${MY_LP%-*} ../${MY_LP}/*
		mv -t deps/freetype/${MY_ZL%-*} ../${MY_ZL}/*
	fi
	default
}

src_configure() {
	local myfeatures=(
		distro-defaults
		vendor-nerd-font-symbols-font
		$(usev wayland)
	)
	cargo_src_configure --no-default-features
}

src_compile() {
	CARGO_FEATURE_USE_SYSTEM_LIB=1 \
		cargo_src_compile
}

src_install() {
	dobin $(cargo_target_dir)/wezterm
	dobin $(cargo_target_dir)/wezterm-gui
	dobin $(cargo_target_dir)/wezterm-mux-server
	dobin $(cargo_target_dir)/strip-ansi-escapes

	newicon -s 128 assets/icon/terminal.png org.wezfurlong.wezterm.png
	newicon -s scalable assets/icon/wezterm-icon.svg org.wezfurlong.wezterm.svg

	newmenu assets/wezterm.desktop org.wezfurlong.wezterm.desktop

	insinto /usr/share/metainfo
	newins assets/wezterm.appdata.xml org.wezfurlong.wezterm.appdata.xml

	newbashcomp assets/shell-completion/bash ${PN}

	insopts -m 0644
	insinto /usr/share/zsh/site-functions
	newins assets/shell-completion/zsh _${PN}

	insopts -m 0644
	insinto /usr/share/fish/vendor_completions.d
	newins assets/shell-completion/fish ${PN}.fish
	einstalldocs
}

pkg_postinst() {
	xdg_pkg_postinst
	einfo "It may be necessary to configure wezterm to use a cursor theme, see:"
	einfo "https://wezfurlong.org/wezterm/faq.html?highlight=xcursor_theme#i-use-x11-or-wayland-and-my-mouse-cursor-theme-doesnt-seem-to-work"
	einfo "It may be necessary to set the environment variable XCURSOR_PATH"
	einfo "to the directory containing the cursor icons, for example"
	einfo 'export XCURSOR_PATH="/usr/share/cursors/xorg-x11/"'
	einfo "before starting the wayland or X11 window compositor to avoid the error:"
	einfo "ERROR  window::os::wayland::frame > Unable to set cursor to left_ptr: cursor not found"
	einfo "For example, in the file ~/.wezterm.lua:"
	einfo "return {"
	einfo '  xcursor_theme = "whiteglass"'
	einfo "}"
}
