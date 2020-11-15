let g:startify_custom_header = [
\'_____/\\\\\\\\\\\____________________________________________________________        ',
\' ___/\\\/////////\\\__________________________________________________________       ',
\'  __\//\\\______\///______/\\\_______________________________________/\\\______      ',
\'   ___\////\\\__________/\\\\\\\\\\\__/\\\\\\\\\_____/\\/\\\\\\\___/\\\\\\\\\\\_     ',
\'    ______\////\\\______\////\\\////__\////////\\\___\/\\\/////\\\_\////\\\////__    ',
\'     _________\////\\\______\/\\\________/\\\\\\\\\\__\/\\\___\///_____\/\\\______   ',
\'      __/\\\______\//\\\_____\/\\\_/\\___/\\\/////\\\__\/\\\____________\/\\\_/\\__  ',
\'       _\///\\\\\\\\\\\/______\//\\\\\___\//\\\\\\\\/\\_\/\\\____________\//\\\\\___ ',
\'        ___\///////////_________\/////_____\////////\//__\///______________\/////____',
\]

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
          \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'q': '~/.zshrc' },
            \ { 'w': '~/.config/tmux/tmux.conf' },
            \ ]

let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0



