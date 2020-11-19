" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
set updatetime=100


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

highlight SignColumn guibg=#193549


highlight SignifySignAdd                  ctermbg=green  guifg=green   guibg=#193549
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#red guibg=#193549
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#yellow guibg=#193549
" If you like colors instead


