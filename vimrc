set nocompatible                " choose no compatibility with legacy vi
syntax enable
filetype off
set encoding=utf-8
set showcmd                     " display incomplete commands
set noswapfile                  " disable .swp files

set list          " Display unprintable characters, 'invlist' to disable
set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
" set expandtab                   " use spaces, not tabs (optional)
set noexpandtab                   " use tabs, not spaces
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" plugins
Plugin 'VundleVim/Vundle.vim' " vundle plugin
Plugin 'w0rp/ale' " async syntax checker
Plugin 'sickill/vim-monokai'   " monokai colorscheme
Plugin 'nanotech/jellybeans.vim' " jellybeans colorscheme
Plugin 'altercation/vim-colors-solarized' " solarized colorscheme
" Plugin 'vim-scripts/BufOnly.vim' " close all buffers but this
Plugin 'ervandew/supertab' " auto complete
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround' 
Plugin 'MarcWeber/vim-addon-mw-utils' "snippets stuff
Plugin 'tomtom/tlib_vim' " samek
Plugin 'garbas/vim-snipmate' " same
Plugin 'honza/vim-snippets' " same
Plugin 'scrooloose/nerdtree' " NERDTree
Plugin 'tpope/vim-commentary' " easy comment
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'vim-airline/vim-airline' " status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs' " complete pairs
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file search
set wildignore+=*/tmp/*,*.so,*.o,*.swp,*.zip,*.js,*.java,*.css,*/Dashboard_Tool/*,*.html
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

set runtimepath-=~/.vim/bundle/BufOnly.vim

call vundle#end()
filetype plugin indent on

""""" mine! """"""
let mapleader=','
nnoremap <Leader>w :w<CR>
" change buffers the right way
nnoremap <Leader>b :buffers<CR>:buffer<space>
nnoremap gw <C-W>
nnoremap : ;
nnoremap ; :
nnoremap <F9> :source $MYVIMRC<CR>


" hide menu and toolbar
set guioptions-=m
set guioptions-=T

" ale options
nnoremap <Leader>n <Plug>(ale_next)
nnoremap <Leader>p <Plug>(ale_previous)

" snimpate interfering with YCM,
imap <C-\> <Plug>snipMateNextOrTrigger 

""" NERDTree stuff
let NERDTreeIgnore = ['\.o$']

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>


""" view
set guifont=DejaVu\ Sans\ Mono\ 11
if has("gui_running")
	color solarized
set bg=light
else
	color jellybeans
endif
set relativenumber
set number
set showmatch
syntax enable
let python_highlight_all=1
