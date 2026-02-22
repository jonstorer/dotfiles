#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# asdf version manager (installed by laptop)
if [[ -f "${HOME}/.asdf/asdf.sh" ]]; then
  . "${HOME}/.asdf/asdf.sh"
elif [[ -f "/opt/homebrew/opt/asdf/libexec/asdf.sh" ]]; then
  . "/opt/homebrew/opt/asdf/libexec/asdf.sh"
elif [[ -f "/usr/local/opt/asdf/libexec/asdf.sh" ]]; then
  . "/usr/local/opt/asdf/libexec/asdf.sh"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.aliasrc"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.environmentrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.environmentrc"
fi

if [[ -s "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi
