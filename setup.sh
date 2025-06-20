#!/bin/bash

echo "setup.sh: Setting up environment..."

readonly DOTFILES_DIR=$PWD

echo
echo "setup.sh: Setting up symbolic links for files"

FILES=(
    .aria2/aria2.conf
    .cargo/config
    .config/containers/registries.conf
    .config/gh/config.yml
    .config/starship.toml
    .config/tmux/tmux.conf
    .hammerspoon/init.lua
    .m2/settings.xml
    .volta/hooks.json
    .gitconfig
    .kubectl_aliases
    .npmrc
    .zsh_aliases
    .zshrc
)

for FILE in "${FILES[@]}"; do
    ln -sfv "$DOTFILES_DIR/$FILE" "$HOME/$FILE"
done

echo
echo "setup.sh: Setting up symbolic links for directories"

DIRS=(
    .config/bat
    .config/git
    .config/ghostty
    .config/nvim
    .config/pip
    .config/stylua
    .config/uv
)

for DIR in "${DIRS[@]}"; do
    ln -sfvn "$DOTFILES_DIR/$DIR" "$HOME/$DIR"
done

echo
echo "setup.sh: Setting up symbolic links for Xcode"

XCODE_USERDATA="$HOME/Library/Developer/Xcode/UserData"

if ! [[ -d $XCODE_USERDATA ]]; then
    mkdir -p "$XCODE_USERDATA"
fi

ln -sfvn "$DOTFILES_DIR/themes/xcode" "$XCODE_USERDATA/FontAndColorThemes"

echo
echo "setup.sh: Done"
