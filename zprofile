#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if [[ -s "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.aliasrc"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.environmentrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.environmentrc"
fi

if [[ -s "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi
