" Break compatibility with vi
set nocompatible

" Detect filetypes for plugins and indentation
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Change the leader character to space
let mapleader=" "

" Bind keys to toggle wrapping, line numbers, and relative line numbers
nnoremap <leader>ow :set wrap!<CR>
nnoremap <leader>on :set number!<CR>
nnoremap <leader>or :set relativenumber!<CR>

" Decrease the amount of time vim waits for the next key in a multiple key
" mapping, type jk to exit insert mode, also use it for command mode, and
" disable escape
set timeoutlen=200
inoremap jk <esc>
cnoremap jk <esc>
inoremap <esc> <nop>

" Disable arrow keys in insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Open .vimrc in a tab and source .vimrc
nnoremap <leader>ve :split $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Always show a status line and show the filename, filetype, current line, and
" total lines in the status line
setlocal laststatus=2
setlocal statusline=%y\ %f%=%l/%L

" Start showing search matches as you type, highlight search matches, change
" forward and backward searches to be case insensitive, and bind keys for
" clearing search highlighting
setlocal incsearch
setlocal hlsearch
nnoremap / /\c
nnoremap ? ?\c
nnoremap <leader>c :noh<CR>

" Bind a key to uppercase a word in insert mode and in normal mode
:inoremap <c-u> <esc>viw~ea
:nnoremap <c-u> viw~e

" Create visual mode mappings to surround a selection with ', ", and ``
vnoremap ' va'<esc>`<i'<esc>`>ll
vnoremap " va'<esc>`<i"<esc>`>ll
vnoremap `` va``<esc>`<i``<esc>`>llll

" Set display of hard tabs to 4 spaces, indent using 4 spaces, disable
" simulating a different tabstop when editing, replace hard tabs with
" spaces, and add indents when starting a new line or reformatting
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=0
setlocal expandtab
setlocal autoindent

