""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" encoding
set encoding=utf-8

" remap leader
let mapleader=","

" set fuzzy search behavior
set path=.,/usr/include,**

" system clipboard
set clipboard+=unnamedplus

" dont keep swap files
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" netrw behavior
let g:netrw_banner=0

" backspace behavior
set whichwrap+=<,>,h,l

" search behavior
set ignorecase
set nohlsearch
set smartcase
set tagcase=match

" wrapping
set linebreak

" comment behavior (loaded after plugins)
au BufReadPost * set formatoptions-=cro

" get rid of gui cursor
set guicursor=

" status line
set laststatus=2
set noshowcmd
set noshowmode

" bracket matching behavior
set showmatch
hi MatchParen cterm=bold ctermbg=1 ctermfg=0

" split behavior
set splitbelow splitright

" line numbers
set number relativenumber
set numberwidth=4

" sign column always on for gitgutter
set signcolumn=yes

" folding text
function! FoldText()
    let nl = v:foldend - v:foldstart + 1
    let linetext = substitute(getline(v:foldstart),"^ *","",1)
    let txt = '+ ' . linetext . ' ' . nl . ' lines'
    return txt
endfunction
set foldtext=FoldText()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS / TEXT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax highlighting
syntax enable

" color scheme
set bg=light

" airline config
let g:airline_theme='ajm'
let g:airline#extensions#whitespace#checks=[]
call airline#parts#define_raw('maxline', '/%L')
call airline#parts#define_accent('maxline', 'bold')
let g:airline#extensions#hunks#enabled=0
let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.dirty = '*'
let g:airline_symbols.notexists = '*'
let g:airline_section_z = airline#section#create(['%p%% ', 'linenr', 'maxline'])
let g:airline_mode_map = {
  \ '__'     : '-',
  \ 'c'      : 'C',
  \ 'i'      : 'I',
  \ 'ic'     : 'I',
  \ 'ix'     : 'I',
  \ 'n'      : 'N',
  \ 'multi'  : 'M',
  \ 'ni'     : 'N',
  \ 'no'     : 'N',
  \ 'R'      : 'R',
  \ 'Rv'     : 'R',
  \ 's'      : 'S',
  \ 'S'      : 'S',
  \ ''     : 'S',
  \ 't'      : 'T',
  \ 'v'      : 'V',
  \ 'V'      : 'V',
  \ ''     : 'V',
  \ }

" warning column for exceeding 80 chars
set colorcolumn=80
hi ColorColumn ctermbg=20

" line numbers
hi LineNr ctermfg=8
hi CursorLineNr ctermfg=8

" comment color
hi Comment ctermfg=8

" selection color
hi Visual cterm=reverse ctermbg=0

" spell check highlighting
hi clear SpellBad
hi SpellBad ctermbg=1 ctermfg=0
hi clear SpellCap
hi SpellCap ctermbg=3 ctermfg=0
hi clear SpellLocal
hi SpellLocal ctermbg=3 ctermfg=0
hi clear SpellRare
hi SpellRare ctermbg=3 ctermfg=0

" fold highlighting
hi Folded ctermbg=4 ctermfg=0

" Gdiff 
hi clear DiffAdd
hi DiffAdd cterm=bold ctermbg=7 ctermfg=2
hi clear DiffDelete
hi DiffDelete cterm=bold ctermbg=7 ctermfg=9
hi clear DiffChange 
hi clear DiffText
hi DiffText cterm=bold ctermbg=7 ctermfg=11

" Git Gutter
hi GitGutterAdd ctermfg=2
hi GitGutterDelete ctermfg=1
hi GitGutterChange ctermfg=3
hi GitGutterChangeDelete ctermfg=3
hi clear SignColumn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" insert spaces for tabs
set expandtab

" tabbing
set shiftwidth=2
set tabstop=2

" smart indent
set si

" fix python tab stop
augroup python
  autocmd!
  autocmd FileType python setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOVEMENT / TABS / WINDOWS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mouse
set mouse=a

" search
nnoremap <Space> /
nnoremap <C-Space> ?

" windows
nnoremap <leader>v :Vexplore<CR>
nnoremap <leader>h :Hexplore<CR>

" tabs
nnoremap <C-t> :tabnew<CR>

" return to last edit position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" file explore and edit
nnoremap <leader>e :Explore<CR>

" fold inner paragaph
nnoremap zz vipzf<CR>

" spell check
nnoremap <leader>sp :setlocal spell! spelllang=en_us<CR>

" re-route marks to capital M
nnoremap M `
onoremap M `
vnoremap M `

" map 0 to go to first non-empty char in line
nnoremap 0 ^
nnoremap ^ 0

" move a line of text with control + j or control + k
nnoremap <C-j> :m+1<CR>
nnoremap <C-k> :m-2<CR>

" shift-tab behavior
inoremap <S-Tab> <C-d>

" find
nnoremap <C-f> :find

" view marks
nnoremap <leader>m :marks<CR>

" view git status
nnoremap <leader>g :vertical Gstatus<CR>

" git diff
nnoremap <leader>d :Gvdiff<CR>

" terminal emulator
nnoremap <leader>t :vs<CR>:terminal<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS / ONE-LINERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" replace all is aliased to S
nnoremap S :%s///g<Left><Left><Left>

" clear tex build files
autocmd VimLeave *.tex !texclear %

" ensure tex files read as tex files
autocmd BufRead,BufNewFile *.tex set filetype=tex

" save file with root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" delete trailing whitespace on save
autocmd BufWritePre *.h,*.c,*.cc,*.java,*.md,*.py*,*.sh,*.tex %s/\s\+$//e

" update keybindings when sxhkdrc is updated
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
