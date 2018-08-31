
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
let g:ale_type_map = {'flake8': {'ES': 'WS'}}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'
let g:deoplete#sources#jedi#show_docstring = 1
Plug 'davidhalter/jedi-vim'
let g:jedi#completions_enabled = 0
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete
" change this to neovim venv where 'neovim' pip package installed
let g:python3_host_prog='/home/ygarti/.local/share/virtualenvs/nvim-nqqzs7yT/bin/python3'
let g:python_host_prog='/home/ygarti/.local/share/virtualenvs/neovim2--DUTlD8e/bin/python'
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

" graphics
colorscheme gruvbox
set background=dark

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

