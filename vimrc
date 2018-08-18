
"** Editor settings **"

if !has('nvim')
	set nocompatible
	syntax enable
	set encoding=utf-8
	set hlsearch
	set incsearch
	set backspace=indent,eol,start
endif
set showcmd
set noswapfile
set nowrap
set tabstop=4 shiftwidth=4
set ignorecase
set smartcase
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«
set relativenumber
set number
set showmatch

"** Plugins **"

"" vim-plug
" nvim: curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" vim: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'davidhalter/jedi'
Plug 'zchee/deoplete-jedi'
let g:deoplete#enable_at_startup = 1
" color themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'

call plug#end()

"** My Settings **"
let mapleader=','
nnoremap <Leader>w :w<CR>
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap gw <C-W>
nnoremap : ;
nnoremap ; :
nnoremap <BS> <C-^>
nnoremap <F9> :source $MYVIMRC
nnoremap <Enter> o<ESC>k
nnoremap <Space> :noh<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Keep undo history across sessions by storing it in a file
if !has('nvim') && has('persistent_undo')
	let vimDir = '$HOME/.vim'
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
endif
set undofile

