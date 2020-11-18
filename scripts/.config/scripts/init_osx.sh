/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# osx apps
brew cask install iterm2 brave-browser alfred bettertouchtool karabiner-elements rambox

# terminal apps
brew install  curl stow python ripgrep fd the_silver_searcher bat fzf ruby nvm

# window manager
brew install koekeishiya/formulae/yabai
sudo yabai —install-sa
# https://install.appcenter.ms/users/dexterleng/apps/vimac/distribution_groups/sparkle

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -L git.io/antigen > antigen.zsh
mv antigen.zsh ~/.oh-my-zsh/plugins
sudo chown -R julianiaquinandi /usr/local/share/zsh
sudo chmod -R 755 /usr/local/share/zsh

# neovim
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzf nvim-macos.tar.gz
sudo mv nvim-osx64/bin/nvim /usr/local/bin	

# Python 2
cd ~ 
wget https://raw.githubusercontent.com/Homebrew/homebrew-core/86a44a0a552c673a05f11018459c9f5faae3becc/Formula/python@2.rb
brew install python@2.rb
rm python@2.rb

sudo pip3 install ranger-fm 

# Vim plug 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cd ~/.config/coc/extensions &&
npm install &&
cd ~/ &&
nvim +PlugInstall +qall > /dev/null &&
nvim +CocInstall coc-marketplace +qall > /dev/null &&
nvim +UpdateRemovePlugins +qall > /dev/null &&

# Node
nvm install 12.13.0 &&
npm i -g yarn neovim 
