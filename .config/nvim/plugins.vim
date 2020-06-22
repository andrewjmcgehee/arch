" Basic plugin stuff
set nocompatible
filetype plugin on

call plug#begin('~/.config/nvim/plug')
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'kovetskiy/sxhkd-vim'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Deoplete load on insert
let g:deoplete#enable_at_startup=0
au InsertEnter * call deoplete#enable()

" Make gitgutter faster
set updatetime=100

" LaTex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
set conceallevel=1
hi Conceal ctermbg=none

" Ultisnips
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
