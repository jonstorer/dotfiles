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
elif command -v asdf >/dev/null 2>&1; then
  # asdf 0.16+ (Go rewrite) ships no asdf.sh — just add shims to PATH.
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.aliasrc"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.environmentrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.environmentrc"
fi

if [[ -d "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi

if [[ -s "${HOME}/.zprofile.local" ]]; then
  source "${HOME}/.zprofile.local"
fi
