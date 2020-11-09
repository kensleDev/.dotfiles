" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

	Plug 'tpope/vim-commentary'
	Plug 'justinmk/vim-sneak'
	Plug 'unblevable/quick-scope'
	Plug 'haya14busa/incsearch.vim'
	Plug 'herrbischoff/cobalt2.vim'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'liuchengxu/vim-which-key'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  Plug 'mhinz/vim-startify'
	Plug 'ChristianChiarulli/far.vim'
	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'puremourning/vimspector'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'zhou13/vim-easyescape'
	Plug 'tpope/vim-surround'
  Plug 'ludovicchabant/vim-gutentags'

" Initialize plugin system
call plug#end()

highlight Normal ctermfg=black ctermbg=lightgrey

colorscheme cobalt2

source $HOME/.config/nvim/plugins/config/sneak.config.vim
source $HOME/.config/nvim/plugins/config/quickscope.config.vim
source $HOME/.config/nvim/plugins/config/fzf.config.vim
source $HOME/.config/nvim/plugins/config/airline.config.vim
source $HOME/.config/nvim/plugins/config/whichkey.config.vim
source $HOME/.config/nvim/plugins/config/ranger.config.vim
source $HOME/.config/nvim/plugins/config/start_page.config.vim
source $HOME/.config/nvim/plugins/config/far.config.vim
source $HOME/.config/nvim/plugins/config/signify.config.vim
source $HOME/.config/nvim/plugins/config/easyescape.config.vim


source $HOME/.config/nvim/plugins/config/terminal.config.vim
