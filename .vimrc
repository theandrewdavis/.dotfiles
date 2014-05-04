" Use pathogen to manage plugin loading and import plugin help documentation
call pathogen#infect()
Helptags

" Enable syntax highlighting
syntax on

" Detect filetypes for plugins and indentation
filetype plugin indent on

" Toggle a file browser with \n
map <leader>n :NERDTreeToggle<CR>

" Set *.txt and vim files to filetype text
augroup filetype_text
  autocmd!
  autocmd BufNewFile,BufRead *.txt setlocal filetype=text
  autocmd Filetype text call FiletypeTextOptions()
  autocmd Filetype vim call FiletypeTextOptions()
augroup END

" Settings for text files
function! FiletypeTextOptions()
  " Control folding manually, show a one column fold gutter, and use custom fold
  " text to display a closed fold
	setlocal foldmethod=manual
	setlocal foldcolumn=1
	setlocal foldtext=CustomFoldText()

	" Show line numbers and set the number gutter width
	setlocal number
	setlocal numberwidth=4

  " Set display of hard tabs to 2 spaces, indent using 2 spaces, disable
  " simulating a different tabstop when editing, and replace hard tabs with
  " spaces
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal softtabstop=0
	setlocal expandtab

  " Modify buffer so that no line is longer than 80 characters, and allow
  " wrapping (which only applies to spaces since textwidth is on) so that typing
  " whitespace beyond 80 characters doesn't cause the screen to shift
	setlocal textwidth=80
	setlocal wrap

  " Disable * auto-commenting since it interferes with bulleted lists starting
  " with * characters
	setlocal comments-=mb:*
endfunction

" Cutsom fold text function that shows only the first line of text and the
" number of lines in the fold
function! CustomFoldText()
	let l:text = getline(v:foldstart)
	let l:lines = " [" . (v:foldend - v:foldstart + 1) . "] "
	let l:gutter = &foldcolumn + (&number ? &numberwidth : 0)
	let l:space = winwidth(0) - l:gutter - strwidth(l:text . l:lines)
	return l:text . repeat(" ", l:space) . l:lines
endfunction

" Toggle folds with spacebar
nnoremap <space> za

" Open .vimrc in a tab and source .vimrc
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Type jk to exit insert mode and disable escape
inoremap jk <esc>
inoremap <esc> <nop>

" Disable arrow keys in insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Always show a status line and show the filename, filetype, current line, and
" total lines in the status line
setlocal laststatus=2
setlocal statusline=%y\ %f%=%l/%L
setlocal nomodeline
