" Use pathogen to manage plugin loading and import plugin help documentation
call pathogen#infect()
Helptags

" Enable syntax highlighting
syntax on

" Change indentation settings based on filetype
filetype plugin indent on

" Don't wrap long lines
set nowrap

" Use indentation-based code folding in Python, starting with all folds open
autocmd Filetype python setlocal foldmethod=indent foldlevel=99

" Toggle a file browser with \n
map <leader>n :NERDTreeToggle<CR>
