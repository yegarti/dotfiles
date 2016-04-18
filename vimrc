set nocompatible                " choose no compatibility with legacy vi
syntax enable
filetype off
set encoding=utf-8
set showcmd                     " display incomplete commands
set noswapfile			" disable .swp files


"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
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
Plugin 'klen/python-mode'  " python mode
Plugin 'sickill/vim-monokai'   " monokai colorscheme
Plugin 'nanotech/jellybeans.vim' " jellybeans colorscheme
Plugin 'vim-scripts/BufOnly.vim' " close all buffers but this
Plugin 'ervandew/supertab' " auto complete
Plugin 'scrooloose/syntastic' " syntax checking
Plugin 'tpope/vim-sensible'
Plugin 'MarcWeber/vim-addon-mw-utils' "snippets stuff
Plugin 'tomtom/tlib_vim' " samek
Plugin 'garbas/vim-snipmate' " same
Plugin 'honza/vim-snippets' " same
Plugin 'scrooloose/nerdtree' " NERDTree

call vundle#end()
filetype plugin indent on

" syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1   " automaticly open/close error list
let g:syntastic_check_on_open = 1   " check when opening buffers
let g:syntastic_check_on_wq = 0   " dont check when closing buffers


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


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
color jellybeans
set number
set showmatch
syntax enable
let python_highlight_all=1
