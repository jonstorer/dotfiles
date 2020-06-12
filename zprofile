#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#if [[ -s "/opt/boxen/env.sh" ]]; then
  #source "/opt/boxen/env.sh"
#fi

#if [[ -s "/opt/rbenv" ]]; then
  #export RBENV_ROOT=/opt/rbenv
  #export PATH=$RBENV_ROOT/bin:/opt/rbenv/bin/rbenv:$PATH
  #eval "$(rbenv init -)"
#fi

if [[ -s "${ZDOTDIR:-$HOME}/.tmuxinator/scripts/tmuxinator" ]]; then
  source "${ZDOTDIR:-$HOME}/.tmuxinator/scripts/tmuxinator"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.aliasrc"
fi

if [[ -s "${ZDOTDIR:-$HOME}/.environmentrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.environmentrc"
fi

if [[ -s "$HOME/Library/Android" ]]; then
  export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
  export PATH=$HOME/Library/Android/sdk/tools/proguard/bin:$PATH
fi

if [[ -s "$HOME/.rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - --no-rehash)"
fi

if [[ -s "$HOME/.nodenv" ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

if [[ -s "$HOME/.bin" ]]; then
  export PATH="$HOME/.bin:$PATH"
fi
