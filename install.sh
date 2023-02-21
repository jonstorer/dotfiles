dotfiles=()
#dotfiles+=(tmux-tmate.conf)
#dotfiles+=(tmate.conf)
#dotfiles+=(tmux.conf)
#dotfiles+=(vim)
#dotfiles+=(vimrc)
#dotfiles+=(gemrc)
#dotfiles+=(irbrc)
#dotfiles+=(irbrc.d)
#dotfiles+=(rdebugrc)
#dotfiles+=(zprezto)
#dotfiles+=(zpreztorc)
dotfiles+=(zlogin)
dotfiles+=(zlogout)
dotfiles+=(zprofile)
dotfiles+=(zshenv)
dotfiles+=(zshrc)
#dotfiles+=(zsh-themes)

#echo "${dotfiles[@]}"

CWD=$(pwd);

for dotfile in "${dotfiles[@]}"; do
  if [ -e "$HOME/.$dotfile" ]; then
    if [ "$(realpath "$HOME/.$dotfile")" -ne "$CWD/$dotfile" ]; then
      echo "$(realpath "$HOME/.$dotfile")"
      echo "$CWD/$dotfile"
      #mv "$HOME/.$dotfile" "$HOME/.$dotfile.bak"
      #ln -s "$CWD/$dotfile" "$HOME/.$dotfile"
    fi
  else
    ln -s "$CWD/$dotfile" "$HOME/.$dotfile"
  fi
done
