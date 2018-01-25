set nocompatible
filetype off

execute pathogen#infect()

" VISUAL STUFF

set number
"set visualbell
syntax enable
filetype plugin indent on " This gets vim to automatically load filetype specific options for plugins and indentation
highlight ColorColumn ctermbg=DarkGray
set colorcolumn=80

let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" AUTO COMPLETION

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" jsBeautify

map <c-f> :call JsBeautify()<cr>

" BASIC FUNCTIONALITY

set encoding=utf-8        " Duh
set history=5112          " Default is 20, I'd rather set this to infinity

" FORMATTING

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save

nnoremap <F5> :GundoToggle<CR>
