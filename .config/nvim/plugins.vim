" Basic plugin stuff
set nocompatible
filetype plugin on

call plug#begin('~/.config/nvim/plug')
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/goyo.vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Deoplete load on insert
let g:deoplete#enable_at_startup=0
au InsertEnter * call deoplete#enable()
