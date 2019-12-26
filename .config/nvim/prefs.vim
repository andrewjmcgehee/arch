"""""""""""""""""""""""""""""""""""""""""""""""""
" > GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""

" encoding
set encoding=utf-8

" backup
set nowritebackup
set noswapfile

" remap leader
let mapleader=","

" set fuzzy search behavior
set path=.,/usr/include,**

" avoid buffer type errors
au BufReadPost * set buftype=

"""""""""""""""""""""""""""""""""""""""""""""""""
" > UI
"""""""""""""""""""""""""""""""""""""""""""""""""

" netrw behavior
let g:netrw_banner=0

" backspace behavior
set whichwrap+=<,>,h,l

" search behavior
set clipboard+=unnamedplus
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

"""""""""""""""""""""""""""""""""""""""""""""""""
" > COLORS / TEXT
"""""""""""""""""""""""""""""""""""""""""""""""""

" syntax highlighting
syntax enable

" color scheme
set bg=light

" airline config
let g:airline_theme='ajm'
let g:airline#extensions#whitespace#checks=[]
call airline#parts#define_raw('maxline', '/%L')
call airline#parts#define_accent('maxline', 'bold')
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

" warning column for exceeding 100 chars
set colorcolumn=100
hi ColorColumn ctermbg=238

" spell check highlighting
hi clear SpellBad
hi SpellBad ctermbg=1 ctermfg=0
hi clear SpellCap
hi SpellCap ctermbg=3 ctermfg=0
hi clear SpellLocal
hi SpellLocal ctermbg=3 ctermfg=0
hi clear SpellRare
hi SpellRare ctermbg=3 ctermfg=0

"""""""""""""""""""""""""""""""""""""""""""""""""
" > INDENTATION
"""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" > MOVEMENT / TABS / WINDOWS
"""""""""""""""""""""""""""""""""""""""""""""""""

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

" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" return to last edit position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""
" > KEY MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""

" file explore and edit
nnoremap <leader>e :Explore<CR>

" Goyo for reading prose-like text
map <leader>f :Goyo<CR>

function! s:goyo_enter()
  set bg=light
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  set bg=light
  " Quit even if goyo active
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

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
nnoremap <S-j> :m+1<CR>
nnoremap <S-k> :m-2<CR>

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

" emmet complete
let g:user_emmet_leader_key='<leader>'

" terminal emulator
nnoremap <leader>t :vs<CR>:terminal<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" > FUNCTIONS / ONE-LINERS
"""""""""""""""""""""""""""""""""""""""""""""""""

" Check file in shellcheck:
nnoremap <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
nnoremap S :%s///g<Left><Left><Left>

" Compile document, be it LaTeX/markdown/etc.
nnoremap <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
nnoremap <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Ensure tex files read as tex files
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically delete all trailing whitespace on save
autocmd BufWritePre *.h,*.c,*.cc,*.java,*.md,*.py*,*.sh,*.tex %s/\s\+$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
