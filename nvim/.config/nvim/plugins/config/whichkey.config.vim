" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
set timeoutlen=500

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
"
" " Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings

" Programs
let g:which_key_map['e'] = [ ':CocCommand explorer --position right --width 70', 'explorer' ]
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
let g:which_key_map['q'] = [ ':Startify'                  , 'startify' ]

" Movement
let g:which_key_map['j'] = [ '<C-W>h'                 , 'left' ]
let g:which_key_map['k'] = [ '<C-W>j'                 , 'down' ]
let g:which_key_map['l'] = [ '<C-W>k'                 , 'up' ]
let g:which_key_map[';'] = [ '<C-W>l'                 , 'right' ]
let g:which_key_map['J'] = [ ':windo wincmd K'        , 'change splits horizontal' ]
let g:which_key_map['K'] = [ ':windo wincmd H'        , 'change splits vertical' ]

let g:which_key_map.a = {
     \ 'name' : '+comment',
     \ 'a' : [':Commentary' , 'comment'],
     \ }

let g:which_key_map.b = {
     \ 'name' : '+buffer',
     \ 'h' : ['<C-w>s' , 'split below'],
     \ 'v' : ['<C-w>v' , 'split right'],
     \ 'q' : ['<C-w>q' , 'split close'],
     \ 'm' : [':tabedit %' , 'max current pane to tab'],
     \ 'n' : [':tabclose' , 'back to split panes'],
     \ }


let g:which_key_map.c = {
     \ 'name' : '+coc',
     \ 'c' : [':CocAction("diagnosticNext")', 'next error'],
     \ 'x' : ['CocAction("diagnosticPrevious")' , 'previous error'],
     \ 'm' : [':CocList marketplace' , 'marketplace'],
     \ '' : [':tabclose' , 'back to split panes'],
     \ }



let g:which_key_map.g = {
     \ 'name' : '+git',
     \ 'g' : [':FloatermNew lazygit' , 'lazygit'],
     \ 'b' : [':GBrowse'             , 'browse repo'],
     \ 'd' : [':Gdiffsplit'          , 'diff split'],
     \ }

let g:which_key_map.f = {
      \ 'name' : '+find & replace' ,
      \ 'b' : [':Farr --source=vimgrep'    , 'files'],
      \ 'p' : [':Farr --source=rgnvim'     , 'project'],
      \ }

let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

let g:which_key_map.t = {
     \ 'name' : '+terminal',
     \ 'q' : [':FloatermNew' , 'new'],
     \ 't' : [':FloatermToggle' , 'toggle'],
     \ 'r' : [':FloatermNext' , 'next'],
     \ 'e' : [':FloatermPrev' , 'prev'],
     \ }


let g:which_key_map.x = {
     \ 'name' : '+buffers',
     \ 'c' : [':bd' , 'buffer close'],
     \ 'x' : [':bn' , 'buffer next'],
     \ 'z' : [':bp' , 'buffer prev'],
     \ }

let g:which_key_map.w = {
     \ 'name' : '+write',
     \ 'e' : [':w' , 'write'],
     \ 'q' : [':wq' , 'write quit'],
     \ 'w' : [':bn' , 'buffer next'],
     \ }


" Register which key map
call which_key#register('<Space>', "g:which_key_map")


