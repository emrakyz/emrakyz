EAPI=8

inherit toolchain-funcs

DESCRIPTION="Small C++ library for utilities used across the Hypr* ecosystem"
HOMEPAGE="https://github.com/hyprwm/hyprutils"

if [[ "${PV}" = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hyprwm/${PN}.git"
else
	SRC_URI="https://github.com/hyprwm/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0/9"

RDEPEND="
	x11-libs/pixman
"
DEPEND="${RDEPEND}"
BDEPEND="
	|| ( >=sys-devel/gcc-14:* >=llvm-core/clang-18:* )
	dev-build/cmake
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/${PN}-fix-missing-algorithm-include.patch"
)

pkg_setup() {
	[[ ${MERGE_TYPE} == binary ]] && return

	if tc-is-gcc && ver_test $(gcc-version) -lt 14; then
		eerror "hyprutils requires >=sys-devel/gcc-14 to build"
		die "GCC version is too old"
	elif tc-is-clang && ver_test $(clang-version) -lt 18; then
		eerror "hyprutils requires >=llvm-core/clang-18 to build"
		die "Clang version is too old"
	fi
}

src_configure() {
	:
}

src_compile() {
	cmake --no-warn-unused-cli \
		-DCMAKE_BUILD_TYPE:STRING=Release \
		-DCMAKE_INSTALL_PREFIX:PATH="${EPREFIX}/usr" \
		-DCMAKE_INSTALL_LIBDIR:PATH="$(get_libdir)" \
		-S . -B ./build || die
	cmake --build ./build --config Release --target all -j$(makeopts_jobs) || die
}

src_install() {
	DESTDIR="${D}" cmake --install ./build || die
}
