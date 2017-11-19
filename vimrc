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
set tabstop=4 shiftwidth=4      " a tab is 4 spaces
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
Plugin 'tpope/vim-surround' " easily surround text
Plugin 'tpope/vim-repeat' " repeats last command, including plugins mappings
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
Plugin 'davidhalter/jedi-vim' " python auto complete
Plugin 'alepez/vim-gtest' " google test plugin
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
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap gw <C-W>
nnoremap : ;
nnoremap ; :
nnoremap <BS> <C-^>
nnoremap <F9> :source $MYVIMRC<CR>
nnoremap <ENTER> o<ESC>k
nnoremap <Leader>d :GTestToggleEnabled<CR>
let g:gtest#gtest_command = "./runtest"
nnoremap <Leader>r :make CFG=optimize<CR> :GTestRunUnderCursor<CR>
let g:ale_cpp_gcc_options = "@/home/dev/dotfiles/ale_gcc.conf"

" open definition in a new horiziontal split and go back to oldwindow
nnoremap <C-]><C-]> <C-W><C-]>zt15<C-W>-<C-W><C-W>


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


" stackoverflow.com/questions/5700389/using-vims-persistent-undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
	let myUndoDir = expand(vimDir . '/undodir')
	" Create dirs
	call system('mkdir ' . vimDir)
	call system('mkdir ' . myUndoDir)
	let &undodir = myUndoDir
	set undofile
endif



""" view
set guifont=DejaVu\ Sans\ Mono\ 11
if has("gui_running")
	color jellybeans
	nnoremap <C-+> :silent! let &guifont = substitute(
	 \ &guifont,
	 \ ':h\zs\d\+',
	 \ '\=eval(submatch(0)+1)',
	 \ '')<CR>
	nnoremap <C--> :silent! let &guifont = substitute(
	 \ &guifont,
	 \ ':h\zs\d\+',
	 \ '\=eval(submatch(0)-1)',
	 \ '')<CR>
else
	color jellybeans
endif
set relativenumber
set number
set showmatch
syntax enable
let python_highlight_all=1
