" This is vim not vi
set nocompatible              " be iMproved, required

" Actually backspace in insert mode
set backspace=2

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:

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
:cnoreabbrev wq! w!<bar>bd
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

" Goyo

let g:goyo_width = 84 " Leave a few extra chars more than textwidth

function! s:goyo_enter()   " On goyo enter:
  set noshowcmd            " Don't show last command
  set noshowmode           " Don't show current mode
  set scrolloff=999        " Centre current line
  if has('gui_running')
    set fullscreen         " Enter fullscreen (don't use Mac native fullscreen for this)
    colo seoul8_light      " Light colours
    set linespace=7        " Extra leading is better for prose
  elseif exists('$TMUX')   " Hide tmux bar
    silent !tmux set status off
  endif
  let &l:statusline = '%M' " Show modified state on the bottom of the screen
                           " This automatically disables on Goyo leave
  hi StatusLine
        \ ctermfg=137
        \ guifg=#be9873
        \ cterm=NONE
        \ gui=NONE
endfunction

function! s:goyo_leave() " On goyo exit:
  set showcmd            " Show last command
  set showmode           " Show current mode
  set scrolloff=1        " Always show one line of context around the cursor
  if has('gui_running')
    set nofullscreen     " Exit fullscreen
    colo seoul8          " Dark colours
    set linespace=3      " Standard leading
  elseif exists('$TMUX') " Enable tmux bar
    silent !tmux set status on
  endif
endfunction

" Activate respective function on goyo enter and leave
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:ycm_global_ycm_extra_conf = '.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

