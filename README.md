# Dotfiles

Shell, editor, and system configuration. Works together with the [laptop](https://github.com/jonstorer/laptop) script for full machine setup.

## Contents

| Component | Description |
|-----------|-------------|
| **zsh / Prezto** | Shell config with Prezto framework. Custom themes in `zsh-themes/`. |
| **Vim** | vim-plug managed plugins: NERDTree, Fugitive, ALE (linting), CtrlP, vim-airline, etc. |
| **Tmux** | Config shared with tmate. Uses `Ctrl-e` as prefix; `Alt` for pane navigation. |
| **macOS** | `osx` script applies system defaults (Finder, Dock, Safari, iTerm, etc.). |

## Install

### With the laptop script (recommended)

1. Run laptop first to install Homebrew, vim, tmux, zsh, asdf, Node.js, etc.:

   ```sh
   curl -fsS 'https://raw.githubusercontent.com/jonstorer/laptop/main/mac' | sh
   ```

2. Clone and install dotfiles:

   ```sh
   git clone https://github.com/jonstorer/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   make install
   ```

3. Dotfiles loads asdf from `zprofile` and provides `~/.asdfrc` (`.nvmrc` / `.node-version` support). No extra setup needed.

### Standalone (without laptop)

1. Install prerequisites: zsh, vim, tmux, git.

2. Clone and install:

   ```sh
   git clone https://github.com/jonstorer/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   git submodule update --init --recursive
   make install
   ```

## Order of operations

| Step | What happens |
|------|---------------|
| 1. Laptop | Installs tools (vim, tmux, zsh, asdf, Node). Does not modify .zshrc or .asdfrc (managed by dotfiles). |
| 2. Dotfiles `make install` | Symlinks configs, loads asdf from zprofile, provides ~/.asdfrc. |

## Updating

```sh
cd ~/dotfiles
make update
```

To pull vim-plug and other submodules to their latest upstream commits:

```sh
make update-submodules
```

This updates submodule pointers; you may want to commit those changes.

## Migrating from Vundle

If you're upgrading from the previous Vundle-based setup:

```sh
cd ~/dotfiles
git submodule deinit -f vim/bundle/vundle 2>/dev/null || true
git rm -f vim/bundle/vundle 2>/dev/null || true
rm -rf .git/modules/vim/bundle/vundle 2>/dev/null || true
make install
```

## Customization

- **Vim**: `~/.custom.vim`
- **Zsh/Prezto**: `~/.zpreztorc-mine` (sourced by zpreztorc)
- **Environment/aliases**: `~/.environmentrc`, `~/.aliasrc` (sourced by zprofile)

## macOS defaults (osx script)

Safe defaults run automatically during `make install`. Destructive options are opt-in:

```sh
# Safe only (default)
make osx

# Include destructive changes (disables Time Machine, etc.)
OSX_DESTRUCTIVE=1 make osx
```

## Tmux

**iTerm**: Set Option/Alt as Meta: Preferences → Profiles → Keys → Left/Right option key → `+ Esc`.

**Key bindings:**

| Keys | Action |
|------|--------|
| `Ctrl-e` | Prefix |
| `Alt-\|` | Split vertically |
| `Alt--` | Split horizontally |
| `Alt-h/j/k/l` | Navigate panes |
| `Alt-Arrow` | Resize pane |
| `Alt-PageUp` | Copy mode + page up |
| `Alt-u` | Copy mode |
| `Alt-i` | Paste |
| `Alt-8/9/0` | Session pick / cycle |
| `Alt-d` | Detach |

## Vim

### Plugins

- **NERDTree** – File tree: `\`, `\|` (find current file), `Ctrl-g`
- **CtrlP** – Fuzzy finder: `F6` clear cache, `,m` recent files
- **ALE** – Linting: `,t` toggle, `,y` toggle buffer, `,k`/`,j` prev/next issue
- **Fugitive** – Git: `:Gstatus`, `:Gdiff`, etc.
- **Ag** – Search: `,f`

### Customization

Put overrides in `~/.custom.vim`.

## Credits

Inspired by [Joshua Clayton](https://github.com/joshuaclayton/dotfiles) and [Nicolas Viennot](https://github.com/nviennot/vim-config).
