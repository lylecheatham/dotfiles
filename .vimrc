set nocompatible              " be iMproved, required
filetype off                  " required
set backspace=2

set rtp+=~/.vim/bundle/vundle.vim
set shell=/bin/bash
call vundle#begin()
Plugin 'VundleVim/vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kana/vim-fakeclip'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'rust-lang/rust.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'dhruvasagar/vim-table-mode'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" Unsure if needed
set background=dark

" Highlight the current line number
hi CursorLineNR cterm=bold ctermbg=white
"augroup CLNRSet
"    autocmd! ColorScheme * hi CursorLineNR cterm=bold
"augroup END

" use the mouse to select cursor and scroll using trackpad
set mouse=a

" Keep the cursor from being within 5 lines of the top or bottom when
" scrolling
set scrolloff=5

" Set timeouts to be snappy
" set timeoutlen=1000 ttimeoutlen=10

" Set colors to 256
let g:solarized_termcolors = 256

" Set colorscheme to monokai
colorscheme monokai

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Make status line always visible
set laststatus=2

" Add full file path to your existing statusline
set statusline+=%-40F
set statusline+=%-10y
set statusline+=%=%5l/%-5L

" don't use any of the tmux navigator mappings
let g:tmux_navigator_no_mappings = 1

" Pass split movement keys to tmux_navigator
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" Make :wq and :q do buffer deletes instead of quit
" Use :wqa and :qa to exit vim!
:cnoreabbrev wq w<bar>bd
:cnoreabbrev q bd

" Make vim-table-mode make pandoc compatible tables
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" Persistent undo
set undofile
set undodir=~/.vim/undodir

" Delete the first [No Name] buffer on a new instance
" if bufname('%') == '[No Name]'
"   set bufhidden=delete
" endif
