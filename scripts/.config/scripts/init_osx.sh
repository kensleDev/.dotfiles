PRINT() {
  echo "-----"
  echo "-> $1"
  echo "-----"
}

DOTFILE() { 
  cd ~/.dotfiles && 
  stow $1 --adopt && 
  source ~/.zshrc &&
  PRINT "INSTALLED DOTFILE(S): $1"
  cd
}

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# osx apps
brew cask install iterm2 brave-browser alfred karabiner-elements rambox barrier &&

# terminal apps
brew install curl stow ripgrep fd the_silver_searcher bat fzf ruby &&

# dotfiles
DOTFILE git fonts scripts tmux hammerspoon vimWiki
cd

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &&
curl -L git.io/antigen > antigen.zsh &&
mv antigen.zsh ~/.oh-my-zsh/plugins &&
sudo chown -R $USER /usr/local/share/zsh &&
sudo chmod -R 755 /usr/local/share/zsh &&
PRINT "OH-MY-ZSH : Installed" &&
DOTFILE zsh &&

# Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash &&
source ~/.zshrc &&
nvm install 12.13.0 &&
npm i -g yarn &&
PRINT "NVM/NODE/YARN : Installed + Configured"

# Python 2/3
brew install python &&
cd ~ &&
wget https://raw.githubusercontent.com/Homebrew/homebrew-core/86a44a0a552c673a05f11018459c9f5faae3becc/Formula/python@2.rb &&
brew install python@2.rb &&
rm python@2.rb &&
PRINT "PYTHON2/3 : Installed + Configured"

# neovim
brew tap jason0x43/homebrew-neovim-nightly &&
brew cask install neovim-nightly &&
PRINT "NEOVIM NIGHTLY : Installed" &&
DOTFILE new_nvim &&

# NVim plug 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &&

# Nvim lang plugins
sudo pip3 install neovim ranger-fm &&
sudo pip install neovim &&
sudo gem install neovim &&
npm i -g neovim &&

# neovim config
cd ~/.config/coc/extensions &&
npm install &&
cd ~/ &&
nvim +PlugInstall +qall > /dev/null &&
nvim +CocInstall coc-marketplace +qall > /dev/null &&
nvim +UpdateRemovePlugins +qall > /dev/null &&
PRINT "NEOVIM NIGHTLY : Configured"

# skhd

# window manager
# brew install koekeishiya/formulae/yabai
# sudo yabai —install-sa
# https://install.appcenter.ms/users/dexterleng/apps/vimac/distribution_groups/sparkle
