EAPI=8

EGIT_REPO_URI="https://github.com/chmln/${PN}.git"

inherit bash-completion-r1 cargo git-r3

DESCRIPTION="An intuitive find and replace tool"
HOMEPAGE="https://github.com/chmln/sd"
SRC_URI=""

LICENSE="Apache-2.0 BSD-2 MIT"
SLOT="0"
KEYWORDS=""

DOCS=( {CHANGELOG,README}.md )

QA_FLAGS_IGNORED="usr/bin/sd"

src_unpack() {
        git-r3_src_unpack
        cargo_live_src_unpack
}

src_install() {
        einstalldocs
        cargo_src_install

        # Find generated man page
        local man_page
        man_page="$(find target -name sd.1 -print -quit)"
        if [[ -n "${man_page}" ]]; then
                doman "${man_page}"
        fi

        # Find generated shell completions
        local bash_completion fish_completion zsh_completion
        bash_completion="$(find target -name sd.bash -print -quit)"
        fish_completion="$(find target -name sd.fish -print -quit)"
        zsh_completion="$(find target -name _sd -print -quit)"

        if [[ -n "${bash_completion}" ]]; then
                newbashcomp "${bash_completion}" sd
        fi

        if [[ -n "${fish_completion}" ]]; then
                insinto /usr/share/fish/vendor_completions.d
                doins "${fish_completion}"
        fi

        if [[ -n "${zsh_completion}" ]]; then
                insinto /usr/share/zsh/site-functions
                doins "${zsh_completion}"
        fi
}
