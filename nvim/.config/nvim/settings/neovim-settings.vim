" map leader 
nnoremap <SPACE> <Nop>
let mapleader=" "
set signcolumn=yes

set colorcolumn=80
set background=dark
set t_Co=256
set autowriteall

set expandtab
set tabstop=2
set so=999
:set shiftwidth=2
:set autoindent
:set smartindent

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" Line numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" imports
source $HOME/.config/nvim/settings/base-settings.vim
source $HOME/.config/nvim/plugins/neovim-plugins.vim



autocmd ColorScheme * highlight! link SignColumn LineNr
	
