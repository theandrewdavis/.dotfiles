" --- All files ---

" Use pathogen to manage plugin loading and import plugin help documentation
call pathogen#infect()
Helptags

" Enable syntax highlighting
syntax on

" Detect filetypes for plugins and indentation
filetype plugin indent on

" Load and save buffer views on buffer read and write
augroup views
  autocmd!
  autocmd BufRead * silent loadview
  autocmd BufWrite * silent mkview
augroup END

" Toggle a file browser with \n
map <leader>n :NERDTreeToggle<CR>

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

" --- Text files ---

" Set *.txt files to filetype text
augroup filetype_text
  autocmd!
  autocmd BufNewFile,BufRead *.txt setlocal filetype=text
  autocmd Filetype text call FiletypeTextOptions()
augroup END

" Settings for text files
function! FiletypeTextOptions()
  " Control folding manually, show a one column fold gutter, and use custom fold
  " text to display a closed fold
	setlocal foldmethod=manual
	setlocal foldcolumn=1
	setlocal foldtext=CustomFoldText()

  " Toggle folds with spacebar
  nnoremap <space> za

	" Show line numbers and set the number gutter width
	setlocal number
	setlocal numberwidth=4

  " Set display of hard tabs to 2 spaces, indent using 2 spaces, disable
  " simulating a different tabstop when editing, replace hard tabs with
  " spaces, and add indents when starting a new line or reformatting
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal softtabstop=0
	setlocal expandtab
  setlocal autoindent

  " Modify buffer so that no line is longer than 80 characters, show a colored
  " column at the end of a line, and allow wrapping (which only applies to
  " spaces since textwidth is on) so that typing whitespace beyond 80 characters
  " doesn't cause the screen to shift
	setlocal textwidth=80
  setlocal colorcolumn=81
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

" --- Vim files ---

" Use text file settings for vim files
augroup filetype_vim
  autocmd!
  autocmd Filetype vim call FiletypeTextOptions()
augroup END
