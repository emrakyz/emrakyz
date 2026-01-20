EAPI=8

inherit cmake-multilib

if [[ -z ${PV%%*9999} ]]; then
	EGIT_REPO_URI="https://github.com/fraunhoferhhi/${PN}.git"
	inherit git-r3
	SLOT="0/${PV}"
else
	MY_PV="31d0e25"
	[[ -n ${PV%%*_p*} ]] && MY_PV="v${PV}"
	SRC_URI+="
		mirror://githubcl/fraunhoferhhi/${PN}/tar.gz/${MY_PV} -> ${P}.tar.gz
	"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${MY_PV#v}"
	SLOT="0/$(ver_cut 1-2)"
fi

DESCRIPTION="Fraunhofer Versatile Video (H.266/VVC) Decoder"
HOMEPAGE="https://www.hhi.fraunhofer.de/en/departments/vca/technologies-and-solutions/h266-vvc.html"

LICENSE="BSD"

src_unpack() {
	if [[ -z ${PV%%*9999} ]]; then
		git-r3_src_unpack
	else
		unpack ${P}.tar.gz
	fi
	use test || return
	local _z _d="${S}/ext/bitstreams"
	mkdir -p "${_d}"
	for _z in ${A}; do
		[[ -z ${_z%%*.zip} ]] && unzip -qo -d "${_d}/${_z%.zip}" "${DISTDIR}/${_z}"
	done
}

src_prepare() {
	cmake_src_prepare
}
