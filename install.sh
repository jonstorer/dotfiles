#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

dotfiles=(asdfrc tmux.conf vim vimrc zprezto zlogin zlogout zpreztorc zprofile zshenv zshrc zsh-themes)

cmd="${1:-install}"

install() {
  for file in "${dotfiles[@]}"; do
    target="$HOME/.$file"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "Backing up $target -> $target.bak"
      mv "$target" "$target.bak"
    fi
    echo "Installing $file"
    ln -sf "$DOTFILES_DIR/$file" "$target"
  done
  git -C "$DOTFILES_DIR" submodule update --init --recursive
  vim +PlugInstall +qall
}

uninstall() {
  for file in "${dotfiles[@]}"; do
    target="$HOME/.$file"
    if [ -L "$target" ]; then
      echo "Removing $target"
      rm -f "$target"
    fi
  done
}

update() {
  git -C "$DOTFILES_DIR" pull
  git -C "$DOTFILES_DIR" submodule sync
  git -C "$DOTFILES_DIR" submodule update --init --recursive
  vim +PlugUpdate +qall
}

update_submodules() {
  git -C "$DOTFILES_DIR" submodule update --init --recursive --remote
  vim +PlugUpdate +qall
}

case "$cmd" in
  install)           install ;;
  uninstall)         uninstall ;;
  update)            update ;;
  update-submodules) update_submodules ;;
  *)
    echo "Usage: $0 [install|uninstall|update|update-submodules]" >&2
    exit 1
    ;;
esac
