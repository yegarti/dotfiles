
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
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set list
set listchars=tab:•\ ,trail:•,extends:»,precedes:«
set relativenumber
set number
set showmatch
set foldmethod=indent
set clipboard^=unnamedplus,unnamed

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
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
Plug 'jiangmiao/auto-pairs'
"Plug 'ervandew/supertab'
"let g:SuperTabCrMapping = 1
"let g:SuperTabDefaultCompletionType = "<c-n>"
Plug 'Glench/Vim-Jinja2-Syntax'
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
Plug 'davidhalter/jedi-vim'
" Jedi is here for added features not provided in deoplete, no need for completions
let g:jedi#completions_enabled = 0
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete

" color themes
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'michaeljsmith/vim-indent-object'
Plug '907th/vim-auto-save'
let g:auto_save = 1 " enable AutoSave on startup

Plug 'embear/vim-localvimrc'
let g:localvimrc_whitelist=[$HOME."/"] " Allow loading of all .lvimrc files in home directory

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
call plug#end()


"** My Settings **"
let mapleader=','
nnoremap <Leader>w :w<CR>
" nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap gw <C-W>
nnoremap : ;
nnoremap ; :
nnoremap <BS> <C-^>
nnoremap <F10> :source $MYVIMRC
nnoremap <Enter> o<ESC>k
nnoremap <LeadeR><Space> :noh<CR>
nnoremap <Space> zA

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set wildignore+=*.so,*.swp,*.zip

" nvim terminal
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	tnoremap <A-h> <C-\><C-N><C-w>h
	tnoremap <A-j> <C-\><C-N><C-w>j
	tnoremap <A-k> <C-\><C-N><C-w>k
	tnoremap <A-l> <C-\><C-N><C-w>l
	inoremap <A-h> <C-\><C-N><C-w>h
	inoremap <A-j> <C-\><C-N><C-w>j
	inoremap <A-k> <C-\><C-N><C-w>k
	inoremap <A-l> <C-\><C-N><C-w>l
	nnoremap <A-h> <C-w>h
	nnoremap <A-j> <C-w>j
	nnoremap <A-k> <C-w>k
	nnoremap <A-l> <C-w>l
endif

" graphics
colorscheme gruvbox
set background=dark
set termguicolors

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
