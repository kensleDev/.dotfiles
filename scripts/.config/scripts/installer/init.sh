#!/bin/bash

# ------------------------------------ COMMAND LINE
HOME_DIR=/home/kd

function log() {
  echo "-------------------------------"
  echo "-> $1"
  echo "-------------------------------"
}

function err() {
  echo "-------------------------------"
  echo "-!!! ERROR -> $1 "
  echo "-------------------------------"
}

function DOTFILE() {
  cd ~/.dotfiles && stow $1 --adopt && cd ~/
  #  cd ~/.dotfiles && stow git new_nvim fonts scripts vimWiki tmux --adopt && cd ~/
}

# -- Installs

function INSTALL_BASE_TOOLS() {
  sudo apt-get install -y zsh curl stow
  sudo apt-get install -y autotools-dev autoconf pkg-config &&
  sudo apt install -y software-properties-common &&
  DOTFILE "git fonts scripts vimWiki" &&
  log "Installed Base Tools" || err "Base Tools"
}

function INSTALL_ZSH() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &&
  curl -L git.io/antigen > antigen.zsh &&
  mv antigen.zsh ~/.oh-my-zsh/plugins

  sudo chown -R $USER /usr/local/share/zsh &&
  sudo chmod -R 755 /usr/local/share/zsh &&

  DOTFILE zsh &&
  log "Installed Zsh" || err "Zsh"
}

function INSTALL_FONTS() {
  sudo apt-get install fontconfig &&
  sudo fc-cache -f -v &&
  log "setup fonts" || err "Fonts"
}

function INSTALL_PYTHON() {
  #python
  sudo add-apt-repository universe -y &&
  sudo apt-get update &&
  sudo apt-get install -y python2 &&
  curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py &&
  sudo python2 get-pip.py &&
  python2 -m pip install --user --upgrade pynvim &&

  sudo add-apt-repository ppa:deadsnakes/ppa -y &&
  sudo apt-get install -y python3.8 python3-pip &&
  python3 -m pip install --user --upgrade pynvim &&
  log "Installed python" || err "python"

}

function INSTALL_NVM() {
  # nvm, node, yarn
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash &&
  source ~/.nvm/nvm.sh &&
  nvm install 12.13.0 &&
  npm i -g yarn &&
  log "Install Nvm, node, yarn" || err "Nvm"
}

function INSTALL_NEOVIM() {
  # ripgrep
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb &&
  sudo dpkg -i ripgrep_11.0.2_amd64.deb &&
  sudo rm -rf ripgrep_11.0.2_amd64.deb &&
  log "Installed Ripgrep" || err "Ripgrep"

  # fd-find
  wget https://github.com/sharkdp/fd/releases/download/v8.1.1/fd-musl_8.1.1_amd64.deb &&
  sudo dpkg -i fd-musl_8.1.1_amd64.deb &&
  log "Installed fd" || err "Fd"

  # Silver Sercher Ag
  sudo apt install -y silversearcher-ag &&
  log "Installed Silver Searcher ag" || err "Silver Searcher"

  # bat
  wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb &&
  sudo dpkg -i ./bat_0.15.4_amd64.deb &&
  sudo rm -rf bat_0.15.4_amd64.deb &&
  log "Installed bat" || err "Bat"

  # fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
  ~/.fzf/install --all &&
  log "Installed FZF" || err "FZF"

  # ranger
  sudo pip3 install ranger-fm &&
  log "Installed Ranger" || err "Ranger"

  # ruby
  sudo apt-get install -y ruby-full &&
  log "Installed Ruby" || err "Ruby"

  # vim plug
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &&
  log "Installed Vim Plug" || err "Vim Plug"

  # Nvim install
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage &&
  chmod u+x nvim.appimage &&
  sudo mv nvim.appimage /usr/local/bin &&
  sudo mv /usr/local/bin/nvim.appimage /usr/bin/nvim &&
  log "Installed Nvim Nighly" || err "Nvim Nightly"

  # Nvim lang plugins
  sudo pip3 install neovim &&
  sudo pip install neovim &&
  sudo gem install neovim &&
  npm i -g neovim
  log "Installed vim lang plugins"

  # Vim plugins
  cd ~/.config/coc/extensions &&
  npm install &&
  cd ~/ &&
  ~/.config/nvim/nvim.appimage +PlugInstall +qall > /dev/null &&
  ~/.config/nvim/nvim.appimage +CocInstall coc-marketplace +qall > /dev/null &&
  ~/.config/nvim/nvim.appimage +UpdateRemovePlugins +qall > /dev/null &&
  log "Installed vim plugins" || err "vim plugins"

}

function INSTALL_TMUX() {
  sudo apt-get install -y tmux &&
  cp ../dotfiles/tmux.conf $HOME_DIR &&
  mkdir -R ~/.config/tmux/plugins &&
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm &&
  log "Installed Tmux" || err "Tmux"
}


function FIRST_RUN() {
  INSTALL_BASE_TOOLS
  INSTALL_ZSH
  INSTALL_FONTS
  INSTALL_PYTHON
  INSTALL_NVM
  INSTALL_TMUX
  INSTALL_NEOVIM
}
