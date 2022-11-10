export ZNAP="$HOME/.zsh-snap"

zstyle ':znap:*' repos-dir $ZNAP

[[ -f $ZNAP/zsh-snap/znap.zsh ]] || git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $ZNAP/zsh-snap

source $ZNAP/zsh-snap/znap.zsh

znap eval starship "starship init zsh --print-full-init"
znap prompt

znap source ohmyzsh/ohmyzsh lib/{directories,theme-and-appearance} plugins/{git,brew,common-aliases,history,python,pip,github,man,xcode,colored-man-pages}

znap source agkozak/zsh-z
znap source marlonrichert/zcolors
znap source MohamedElashri/exa-zsh
znap source rudeigerc/znotify
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions

znap eval zcolors "zcolors ${(q)LS_COLORS}"

export TPM_HOME="$HOME/.config/tmux/plugins/tpm"
[[ -f $TPM_HOME/tpm ]] || git clone --depth 1 -- https://github.com/tmux-plugins/tpm $TPM_HOME

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[ -f $HOME/.zsh_aliases ] && source $HOME/.zsh_aliases

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"

# neovim
export NVIM_DATA_HOME="$HOME/.local/share/nvim"

# go
export GO111MODULE=on
export GOROOT="$(brew --prefix)/opt/go/libexec"
export GOPATH="$HOME/go"
export GOPROXY=https://goproxy.cn,https://mirrors.aliyun.com/goproxy/,https://goproxy.io,direct
export PATH="$HOME/go/bin:$PATH"

# openjdk
export PATH="$(brew --prefix)/opt/openjdk/bin:$PATH"
export JAVA_HOME="$(brew --prefix)/opt/openjdk/libexec/openjdk.jdk/Contents/Home"

# openstackclient
export OS_CLOUD=openstack

# kubernetes
export KUBE_EDITOR="nvim"
export PATH="${PATH}:${HOME}/.krew/bin"

# GNU command line tools
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/ed/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/make/libexec/gnubin:$PATH"

export GUILE_TLS_CERTIFICATE_DIRECTORY="$(brew --prefix)/etc/gnutls/etc/gnutls"

# gcloud
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# riscv-gnu-toolchain
export PATH="$(brew --prefix)/opt/riscv-gnu-toolchain/bin:$PATH"

# apache-flink
export FLINK_HOME="$(brew --prefix)/opt/apache-flink/libexec"
export PATH="$FLINK_HOME/bin:$PATH"

# haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# argo
source <(argo completion zsh)
source <(argocd completion zsh)

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS='
  --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
  --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'

# wezterm
export PATH="/Applications/WezTerm.app/Contents/MacOS:$PATH"

# surge
export PATH="/Applications/Surge.app/Contents/Applications:$PATH"

# Squirrel
export PATH="/Library/Input Methods/Squirrel.app/Contents/MacOS:$PATH"

znap function _pip_completion pip 'eval "$( pip completion --zsh )"'
compctl -K _pip_completion pip
