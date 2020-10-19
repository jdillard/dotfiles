syntax enable
filetype plugin indent on

set encoding=UTF-8
set nocompatible
set number relativenumber
set nowrap
set hidden
set list
set listchars=tab:--,trail:.,eol:↵
set noerrorbells
set noshowmode
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set backspace=2
set expandtab
set foldlevelstart=20
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set laststatus=2
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGray

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Configure Current Working Directory
Plug 'airblade/vim-rooter'

" Improved grep
Plug 'jremmen/vim-ripgrep'
" Fuzzy finder
Plug 'junegunn/fzf.vim'

" Customizations for working with reStructredText
Plug 'Rykka/riv.vim'

Plug 'sheerun/vim-polyglot'

Plug 'wincent/scalpel'
""""""""""
" Git
""""""""""
" Git integration
Plug 'tpope/vim-fugitive'
" Show git changes in sidebar
Plug 'airblade/vim-gitgutter'
""""""""""
" Movement Improvements
""""""""""
" Enable multi-edit operations like vim-surround's, repeated with a single '.'
Plug 'tpope/vim-repeat'
" Like f, but provide 2 characters instead of 1. Improves f/t
Plug 'justinmk/vim-sneak'
""""""""""
" Manipulate Text
""""""""""
" Toggle comments
Plug 'scrooloose/nerdcommenter'
" Convert words/lines to Title Case
Plug 'christoomey/vim-titlecase'
" Motions for 'surrounding' characters
Plug 'tpope/vim-surround'
""""""""""
" Visual Improvements
""""""""""
" Colorscheme
Plug 'morhetz/gruvbox'
" Custom status bar
Plug 'vim-airline/vim-airline'
" Visually browse undo history
Plug 'mbbill/undotree'
" Highlight all occurrences of the word under the cursor
Plug 'osyo-manga/vim-brightest'
""""""""""
" Linting/checks
""""""""""
" Syntax checking
Plug 'vim-syntastic/syntastic'
" Check for common grammar mistakes
Plug 'davidbeckingsale/writegood.vim'

call plug#end()

colorscheme gruvbox
set background=dark

set rtp+=/usr/local/opt/fzf
set includeexpr=substitute(v:fname,'',getcwd(),'')

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:NERDSpaceDelims = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:sneak#label = 1
let g:airline#extensions#tabline#enabled = 1 "Automatically displays all buffers when there's only one tab open
let g:titlecase_map_keys = 0
let $FZF_DEFAULT_OPTS = '--reverse'
let g:gitgutter_enabled = 1
let mapleader = "\<Space>"
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.vimrc"

inoremap jj <esc>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent> <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<BAR> :Ex <BAR> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <C-P> :GFiles<CR>

" RestructuredText Mappings
augroup filetype_rst
    autocmd FileType rst set include=\\\s*\\\.\\\.\\\ include\\\:\\\:
    autocmd FileType rst let g:syntastic_rst_checkers = ['rstcheck']
    autocmd FileType rst let g:rooter_patterns = ['=source']
    autocmd FileType rst nnoremap <leader>0 yyPVr*jpVr*<CR>
    autocmd FileType rst nnoremap <leader>1 yypVr=<CR>
    autocmd FileType rst nnoremap <leader>2 yypVr-<CR>
    autocmd FileType rst nnoremap <leader>3 yypVr~<CR>
    autocmd FileType rst nnoremap <leader>4 yypVr^<CR>
    autocmd FileType rst nnoremap <leader>5 yypVr+<CR>
    autocmd FileType rst nnoremap gf :e `pwd`<cfile><CR>
    autocmd FileType rst nnoremap gd :e `pwd`<cfile>.rst<CR>
    autocmd FileType rst nnoremap gr :e %:p:h/<cfile>.rst<CR>
    autocmd FileType rst noremap <leader>ml c`<C-R>"`_<ESC>Go<C-D>.. _<ESC>pa:<SPACE>
    autocmd FileType rst nmap     <leader>ub ds*.
    autocmd FileType rst nmap     <leader>uc ds`.
    autocmd FileType rst nmap     <leader>ui ds*
    autocmd FileType rst vnoremap <leader>b c**<C-R>"**<ESC>
    autocmd FileType rst vnoremap <leader>c c``<C-R>"``<ESC>
    autocmd FileType rst vnoremap <leader>i c*<C-R>"*<ESC>
    autocmd FileType rst nnoremap <leader>b viwc**<C-R>"**<ESC>
    autocmd FileType rst nnoremap <leader>c viwc``<C-R>"``<ESC>
    autocmd FileType rst nnoremap <leader>i viwc*<C-R>"*<ESC>
augroup END

nmap     <leader>t <Plug>TitlecaseLine

nnoremap <leader>tg :WritegoodToggle<CR>
nnoremap <leader>ts :setlocal spelllang=en_us spell! spell?<CR>

"" Move Visual Block
vmap < <gv
vmap > >gv

