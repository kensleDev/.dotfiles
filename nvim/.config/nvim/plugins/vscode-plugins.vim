
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

  Plug 'tpope/vim-commentary'
  Plug 'justinmk/vim-sneak'
  Plug 'unblevable/quick-scope'
  Plug 'haya14busa/incsearch.vim'

  " Plug 'https://github.com/bogdan0083/vim-easymotion.git', { 'branch': 'fix/label-position' }

" Initialize plugin system
call plug#end()

 source $HOME/.config/nvim/plugins/config/sneak.config.vim
 source $HOME/.config/nvim/plugins/config/quickscope.config.vim
" source $HOME/.config/nvim/plugins/config/easymotion.vim
