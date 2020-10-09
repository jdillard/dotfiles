syntax enable

set nocompatible
set number
set nowrap
set noerrorbells
set encoding=utf-8
set history=5112
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set laststatus=2
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGray

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-titlecase'
Plug 'vim-airline/vim-airline'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exlude-standard']
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>

" RestructuredText Mappings
nnoremap <leader>1 yypVr=<cr>
nnoremap <leader>2 yypVr-<cr>
nnoremap <leader>3 yypVr~<cr>
nnoremap <leader>4 yypVr^<cr>
nnoremap <leader>5 yypVr+<cr>
vnoremap <leader>ml c`<C-r>"`_<esc>Go<C-D>.. _<esc>pa:<space>
vnoremap <leader>b c**<C-r>"**<esc>
vnoremap <leader>c c``<C-r>"``<esc>
vnoremap <leader>i c*<C-r>"*<esc>
