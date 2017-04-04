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
Plugin 'altercation/vim-colors-solarized' " solarized colorscheme

" Plugin 'vim-scripts/BufOnly.vim' " close all buffers but this
Plugin 'ervandew/supertab' " auto complete
" Plugin 'scrooloose/syntastic' " syntax checking
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround' 
Plugin 'MarcWeber/vim-addon-mw-utils' "snippets stuff
Plugin 'tomtom/tlib_vim' " samek
Plugin 'garbas/vim-snipmate' " same
Plugin 'honza/vim-snippets' " same
Plugin 'scrooloose/nerdtree' " NERDTree
" autocmd vimenter * NERDTree
Plugin 'tpope/vim-commentary' " easy comment
Plugin 'tpope/vim-fugitive' " git wrapper
" Plugin 'Valloric/YouCompleteMe' " ycm
Plugin 'vim-airline/vim-airline' " status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs' " complete pairs
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file search

" first 2 not really needed with YCM , last one is just not used
" set runtimepath-=~/.vim/bundle/supertab
set runtimepath-=~/.vim/bundle/syntastic
set runtimepath-=~/.vim/bundle/BufOnly.vim
set runtimepath-=~/.vim/bundle/YouCompleteMe

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

" YCM settings
let g:ycm_filetype_blacklist = { 'python' : 1 }
let g:ycm_filetype_specific_completion_to_disable = { 'python': 1}

" snimpate interfering with YCM,
imap <C-\> <Plug>snipMateNextOrTrigger 

" syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_include_dirs = [ '../include', 'include', '../../include' ]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1   " automaticly open/close error list
let g:syntastic_check_on_open = 1   " check when opening buffers
let g:syntastic_check_on_wq = 0   " dont check when closing buffers
" let g:syntastic_cpp_include_dirs = ['/home/dev/project/test/api/include']
" let g:syntastic_cpp_config_file = '.syntastic_config_file'

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

" Don't complete on dot and don't preview
let g:pymode_rope_complete_on_dot = 0
set completeopt=menu
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

" Disable breakpoints plugin
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_bind = '<leader>lala'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

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
color jellybeans
set number
set showmatch
syntax enable
let python_highlight_all=1

"" highlight next

" nnoremap <silent> n n:call HLNext(0.4)<cr>
" nnoremap <silent> N N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction
