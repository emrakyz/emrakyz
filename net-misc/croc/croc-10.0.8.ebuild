EAPI=8

inherit go-module

DESCRIPTION="Easily and securely send things from one computer to another"
HOMEPAGE="https://github.com/schollz/croc"
SRC_URI="https://github.com/schollz/croc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 BSD BSD-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv ~x86"

RDEPEND="
	acct-group/croc
	acct-user/croc
"

src_prepare() {
	default
	# Replace User=nobody with User=croc
	sed -i -e "s|\(^User=\).*|\1croc|g" croc.service || die
	# Rename bash completion function
	sed -i -e "s|_cli_bash_autocomplete|_croc|g" \
		src/install/bash_autocomplete || die
}

src_compile() {
	ego build
}

src_install() {
	dobin croc
}

src_test() {
	ego test -skip "Test(Comm|Send|PublicIP|LocalIP)" -work ./...
}
