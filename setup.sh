#!/bin/bash

echo "setup.sh: Setting up environment..."

readonly DOTFILES_DIR=$PWD

echo "setup.sh: Setting up symbolic links for files"

FILES=(
    .aria2/aria2.conf
    .config/containers/registries.conf
    .config/gh/config.yml
    .config/starship.toml
    .gnupg/gpg-agent.conf
    .SpaceVim.d/init.toml
    .aliases
    .gitconfig
    .kubectl_aliases
    .npmrc
    .tmux.conf
    .zshrc
)

for FILE in "${FILES[@]}"; do
    ln -sfv "$DOTFILES_DIR/$FILE" "$HOME/$FILE"
done

echo "setup.sh: Setting up symbolic links for directories"

DIRS=(
    .config/bat
    .config/git
    .config/pip
    .config/wezterm
)

for DIR in "${DIRS[@]}"; do
    ln -sfvn "$DOTFILES_DIR/$DIR" "$HOME/$DIR";
done

echo "setup.sh: Done"
