set nocompatible
filetype off

" vim-plug - plugin manager
let plug_path = expand('~/.vim/autoload/plug.vim')
if filereadable(plug_path)
call plug#begin('~/.vim/plugged')

" Essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'

" File navigation & search
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'

" Syntax & languages
Plug 'leafgarland/typescript-vim'

" Linting (ALE - async, replaces deprecated Syntastic)
Plug 'dense-analysis/ale'

" Git diff signs in gutter
Plug 'airblade/vim-gitgutter'

" UI
Plug 'vim-airline/vim-airline'
Plug 'nviennot/molokai'

" Tmux/Screen integration
Plug 'ervandew/screen'

" Tab completion
Plug 'ervandew/supertab'

" Brackets/parentheses
Plug 'spf13/vim-autoclose'

call plug#end()
else
  echo 'Run "make install" to download vim-plug and install plugins.'
endif
filetype plugin indent on

" COLORS

syntax on
filetype plugin indent on

colorscheme molokai

if $term =~ '256color'
  set t_co=256
elseif $term =~ '^xterm$'
  set t_co=256
endif

set nocursorline                " Fixes lag with syntax highlighting
set number

let mapleader=','
let localmapleader=','

set complete=.,w,b,u,U,t,i,d    " Tab completion scanning
set wildmenu
set wildmode=list:longest,full
set autoindent smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=eol,start,indent
set undolevels=10000
set updatecount=100
set history=2000
set viminfo=%100,'100,/100,h,\"500,:100,n~/.vim/viminfo

" search feature
set ignorecase
set smartcase
set hlsearch
map <Leader>/ :nohlsearch<cr>
set incsearch

" spell check
map <Leader>ss :setlocal spell!<cr>

set laststatus=2
set encoding=utf-8

set list!
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«

set directory=/tmp
set mouse=a
set clipboard=unnamed

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=10
map <Leader>w :set invwrap<cr>
map <Leader>p :set invpaste<cr>

"
" NERDTree
"
nnoremap <C-g> :NERDTreeToggle<cr>
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
map \ :NERDTreeToggle<CR>
map \| :NERDTreeFind<CR>

"
" Tabular
"
nmap <Leader>ah :Tabularize /=><CR>
vmap <Leader>ah :Tabularize /=><CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"
" ALE (async linting - replaces Syntastic)
"
let g:ale_sign_error = '●'
let g:ale_sign_warning = '∙'
let g:ale_set_highlights = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
map <Leader>t :ALEToggle<cr>
map <Leader>y :ALEToggleBuffer<cr>
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

"
" Tmux integration through screen plugin
"
let g:ScreenImpl = 'Tmux'
map <F5> :ScreenShellVertical <CR>

" Search using Ag
nnoremap <Leader>f :Ag 

" Vertical Split
map <Leader>v :vs<CR>

"
" Keybindings
"
map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>
map <leader>c :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>

"
" CtrlP
"
map <F6> :CtrlPClearAllCaches <CR>
map <Leader>m :CtrlPMRU<cr>

"
" Source custom vim from ~/.custom.vim
"
if filereadable(expand("~/.custom.vim"))
  source ~/.custom.vim
endif

"
" Remove trailing whitespace when saving
"
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp call StripTrailingWhitespace()
autocmd BufWritePre *.coffee,*.yml,*.js,*.css,*.less,*.sass,*.scss,*.html,*.xml call StripTrailingWhitespace()
autocmd BufWritePre *.java,*.php call StripTrailingWhitespace()

" tmate.conf has tmux syntax
au BufNewFile,BufRead,BufReadPost tmate.conf set syntax=tmux

set nowrap
