#
# Executes commands at login pre-zshrc.
#

if [[ -s "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#if [[ -s "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
  #source "${ZDOTDIR:-$HOME}/.aliasrc"
#fi

#if [[ -s "${ZDOTDIR:-$HOME}/.environmentrc" ]]; then
  #source "${ZDOTDIR:-$HOME}/.environmentrc"
#fi

#if [[ -s "$HOME/.rbenv" ]]; then
  #export PATH="$HOME/.rbenv/bin:$PATH"
  #eval "$(rbenv init - --no-rehash)"
#fi

#if [[ -s "$HOME/.nodenv" ]]; then
  #export PATH="$HOME/.nodenv/bin:$PATH"
  #eval "$(nodenv init -)"
#fi
