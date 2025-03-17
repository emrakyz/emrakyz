# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-multilib flag-o-matic

DESCRIPTION="Scalable Video Technology for AV1 (SVT-AV1 Encoder and Decoder)"
HOMEPAGE="https://gitlab.com/AOMediaCodec/SVT-AV1"

if [[ ${PV} = 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/AOMediaCodec/SVT-AV1.git"
else
	SRC_URI="https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v${PV}/SVT-AV1-v${PV}.tar.bz2"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86"
	S="${WORKDIR}/SVT-AV1-v${PV}"
fi

# Also see "Alliance for Open Media Patent License 1.0"
LICENSE="BSD-2 Apache-2.0 BSD ISC LGPL-2.1+ MIT"
SLOT="0/$(ver_cut 1)"

BDEPEND="amd64? ( dev-lang/yasm )"

multilib_src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
		-DCMAKE_OUTPUT_DIRECTORY="${BUILD_DIR}"
		-DENABLE_AVX512=ON
		-DSVT_AV1_LTO=OFF
	)

	cmake_src_configure
}
