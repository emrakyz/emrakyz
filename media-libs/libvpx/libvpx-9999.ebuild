EAPI=8

inherit edo toolchain-funcs multilib-minimal git-r3

# To create a new testdata tarball:
# proj/chromium-tools.git/generate-libvpx-test-tarball.sh
DESCRIPTION="WebM VP8 and VP9 Codec SDK"
HOMEPAGE="https://www.webmproject.org"
EGIT_REPO_URI="https://github.com/webmproject/${PN}.git"

LICENSE="BSD"
SLOT="0/9"
# Live ebuilds don't get keywords
KEYWORDS=""
IUSE="cpu_flags_ppc_vsx3 doc +highbitdepth postproc static-libs test +threads"
REQUIRED_USE="test? ( threads )"
RESTRICT="!test? ( test )"

BDEPEND="
	dev-lang/perl
	abi_x86_32? ( dev-lang/yasm )
	abi_x86_64? ( dev-lang/yasm )
	abi_x86_x32? ( dev-lang/yasm )
	doc? (
		app-text/doxygen
		dev-lang/php
	)
"

src_configure() {
	# bug #384585, bug #465988
	# copied from php-pear-r1.eclass
	addpredict /usr/share/snmp/mibs/.index
	addpredict /var/lib/net-snmp/
	addpredict /var/lib/net-snmp/mib_indexes
	addpredict /session_mm_cli0.sem
	multilib-minimal_src_configure
}

multilib_src_configure() {
	# bug #357487
	unset CODECS
	# bug #905986
	unset DIST_DIR

	local myconfargs=(
		--prefix="${EPREFIX}"/usr
		--libdir="${EPREFIX}"/usr/$(get_libdir)
		--enable-pic
		--enable-vp8
		--enable-vp9
		--enable-shared
		--disable-optimizations
		$(use_enable postproc)
		$(use_enable static-libs static)
		$(use_enable test unit-tests)
		$(use_enable threads multithread)
		$(use_enable highbitdepth vp9-highbitdepth)
	)

	# let the build system decide which AS to use (it honours $AS but
	# then feeds it with yasm flags without checking...), bug #345161
	tc-export AS
	case "${CHOST}" in
	i?86*) export AS=yasm ;;
	x86_64*) export AS=yasm ;;
	esac

	tc-export CC CXX AR NM
	# Link with gcc by default, the build system should override this if needed.
	export LD="${CC}"

	myconfargs+=(--disable-examples --disable-install-docs --disable-docs)

	edo "${S}"/configure "${myconfargs[@]}"
}

multilib_src_install() {
	emake verbose=yes GEN_EXAMPLES= DESTDIR="${D}" install

	multilib_is_native_abi && use doc && dodoc -r docs/html
}
