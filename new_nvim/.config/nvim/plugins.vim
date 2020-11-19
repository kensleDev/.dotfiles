" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
	Plug 'tpope/vim-commentary'
	Plug 'unblevable/quick-scope'
	Plug 'haya14busa/incsearch.vim'
	Plug 'herrbischoff/cobalt2.vim'
	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'liuchengxu/vim-which-key'
	Plug 'junegunn/fzf.vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'kevinhwang91/rr', {'do': 'make sync'}
  Plug 'mhinz/vim-startify'
	Plug 'ChristianChiarulli/far.vim'
	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'puremourning/vimspector'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'zhou13/vim-easyescape'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'airblade/vim-rooter'
  Plug 'ThePrimeagen/vim-be-good'
  Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()

highlight Normal ctermfg=black ctermbg=lightgrey

colorscheme cobalt2

source $HOME/.config/nvim/config/sneak.config.vim
source $HOME/.config/nvim/config/quickscope.config.vim
source $HOME/.config/nvim/config/fzf.config.vim
source $HOME/.config/nvim/config/airline.config.vim
source $HOME/.config/nvim/config/whichkey.config.vim
source $HOME/.config/nvim/config/start_page.config.vim
source $HOME/.config/nvim/config/far.config.vim
source $HOME/.config/nvim/config/signify.config.vim
source $HOME/.config/nvim/config/easyescape.config.vim


