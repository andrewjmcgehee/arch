" Normal mode
"          [ guifg, guibg, ctermfg, ctermbg, opts ]
let s:N1 = [ '#141413' , '#CAE682' , 232, 4 ] " mode
let s:N2 = [ '#CAE682' , '#32322F' , 4, 234 ]  " info
let s:N3 = [ '#CAE682' , '#242424' , 4, 233 ]  " statusline
let s:N4 = [ '#86CD74' , 4 ]         " mode modified

" Insert mode
let s:I1 = [ '#141413' , '#FDE76E' , 232 , 2 ]
let s:I2 = [ '#FDE76E' , '#32322F' , 2 , 234 ]
let s:I3 = [ '#FDE76E' , '#242424' , 2 , 233 ]
let s:I4 = [ '#FADE3E' , 2 ]

" Visual mode
let s:V1 = [ '#141413' , '#B5D3F3' , 232 , 5 ]
let s:V2 = [ '#B5D3F3' , '#32322F' , 5, 234 ]
let s:V3 = [ '#B5D3F3' , '#242424' , 5, 233 ]
let s:V4 = [ '#7CB0E6' , 5 ]

" Replace mode
let s:R1 = [ '#141413' , '#E5786D' , 232 , 9 ]
let s:R2 = [ '#E5786D' , '#32322F' , 9 , 234 ]
let s:R3 = [ '#E5786D' , '#242424' , 9 , 233 ]
let s:R4 = [ '#E55345' , 9 ]

" Paste mode
let s:PA = [ '#94E42C' , 005 ]

" Info modified
let s:IM = [ '#40403C' , 236  ]

" Inactive mode
let s:IA = [ '#767676' , s:N3[1] , 243 , s:N3[3] , '' ]

let g:airline#themes#ajm#palette = {}

let g:airline#themes#ajm#palette.accents = {
      \ 'red': [ '#E5786D' , '' , 203 , '' , '' ],
      \ }

let g:airline#themes#ajm#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#ajm#palette.normal_modified = {
    \ 'airline_a': [ s:N1[0] , s:N4[0] , s:N1[2] , s:N4[1] , ''     ] ,
    \ 'airline_b': [ s:N4[0] , s:IM[0] , s:N4[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:N4[0] , s:N3[1] , s:N4[1] , s:N3[3] , ''     ] }


let g:airline#themes#ajm#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#ajm#palette.insert_modified = {
    \ 'airline_a': [ s:I1[0] , s:I4[0] , s:I1[2] , s:I4[1] , ''     ] ,
    \ 'airline_b': [ s:I4[0] , s:IM[0] , s:I4[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:I4[0] , s:N3[1] , s:I4[1] , s:N3[3] , ''     ] }


let g:airline#themes#ajm#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#ajm#palette.visual_modified = {
    \ 'airline_a': [ s:V1[0] , s:V4[0] , s:V1[2] , s:V4[1] , ''     ] ,
    \ 'airline_b': [ s:V4[0] , s:IM[0] , s:V4[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:V4[0] , s:N3[1] , s:V4[1] , s:N3[3] , ''     ] }


let g:airline#themes#ajm#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#ajm#palette.replace_modified = {
    \ 'airline_a': [ s:R1[0] , s:R4[0] , s:R1[2] , s:R4[1] , ''     ] ,
    \ 'airline_b': [ s:R4[0] , s:IM[0] , s:R4[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:R4[0] , s:N3[1] , s:R4[1] , s:N3[3] , ''     ] }


let g:airline#themes#ajm#palette.insert_paste = {
    \ 'airline_a': [ s:I1[0] , s:PA[0] , s:I1[2] , s:PA[1] , ''     ] ,
    \ 'airline_b': [ s:PA[0] , s:IM[0] , s:PA[1] , s:IM[1] , ''     ] ,
    \ 'airline_c': [ s:PA[0] , s:N3[1] , s:PA[1] , s:N3[3] , ''     ] }


let g:airline#themes#ajm#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#ajm#palette.inactive_modified = {
    \ 'airline_c': [ s:N4[0] , ''      , s:N4[1] , ''      , ''     ] }
