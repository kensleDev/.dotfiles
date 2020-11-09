#!/bin/bash

# ------------------------------------ COMMAND LINE
HOME_DIR=/home/kd

function log() {
  echo "-------------------------------"
  echo "-> $1"
  echo "-------------------------------"
}

#source 'lib.trap.sh'
#echo "doing something wrong now .."
#echo "$foo"
# exit 0

function git_upload_ssh_key () {
  read -p "Enter github email : " email
  echo "Using email $email"
  if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -C "$email"
    ssh-add ~/.ssh/id_rsa
  fi
  pub=`cat ~/.ssh/id_rsa.pub`
  read -p "Enter github username: " githubuser
  echo "Using username $githubuser"
  read -s -p "Enter github password for user $githubuser: " githubpass
  echo
  read -p "Enter github OTP: " otp
  echo "Using otp $otp"
  echo
  confirm
  curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" --header "x-github-otp: $otp" https://api.github.com/user/keys
}

# install zsh
sudo apt-get install -y zsh curl &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &&

# if the script stoppped when installing oh my zsh resume from here
curl -L git.io/antigen > $HOME_DIR/.oh-my-zsh/plugins/antigen.zsh &&

# # copy dotfiles
# cp ../dotfiles/.zshrc $HOME_DIR &&
# cp ../dotfiles/.alias $HOME_DIR &&
# cp ../dotfiles/.gitconfig $HOME_DIR &&
# log "Copied Dotfiles" &&

# setup Fonts
sudo apt-get install fontconfig &&
mkdir ~/.fonts &&
cp ~/.config/fonts/VictorMono/TTF/* ~/.fonts &&
sudo fc-cache -f -v &&
log "setup fonts" &&

# Build tools 
sudo apt-get install -y autotools-dev autoconf pkg-config &&
sudo apt install -y software-properties-common &&
log "Installed build tools" &&

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
log "Installed python" &&

# ripgrepi
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb &&
sudo dpkg -i ripgrep_11.0.2_amd64.deb &&
sudo rm -rf ripgrep_11.0.2_amd64.deb
log "Installed Ripgrep" &&

# lazy git 
sudo add-apt-repository ppa:lazygit-team/release -y &&
sudo apt-get update &&
sudo apt-get install -y lazygit &&

# lazy docker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash &&

# Universal Ctags
git clone https://github.com/universal-ctags/ctags.git &&
cd ctags &&
./autogen.sh &&
./configure &&
make &&
sudo make install &&
cd .. 
sudo rm -rf ctags &&

# fd-find
wget https://github.com/sharkdp/fd/releases/download/v8.1.1/fd-musl_8.1.1_amd64.deb &&
sudo dpkg -i fd-musl_8.1.1_amd64.deb &&
log "Installed fd" &&

# Silver Sercher Ag
sudo apt install -y silversearcher-ag &&
log "Installed Silver Searcher ag" &&

# bat
wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb &&
sudo dpkg -i ./bat_0.15.4_amd64.deb &&
sudo rm -rf bat_0.15.4_amd64.deb &&
log "Installed bat" &&

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
~/.fzf/install --all &&
log "Installed FZF" &&

# ranger
sudo pip3 install ranger-fm &&
log "Installed Ranger" &&

# ruby
sudo apt-get install -y ruby-full &&
sudo gem install neovim &&
log "Installed Ruby" &&

# perl
# sudo apt-get install -y cpanminus
# sudo cpanm -n Neovim::Ext
# log "Installed perl"

# vim plug 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &&
log "Installed Vim Plug" &&

# nvm, node, yarn 
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash &&
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 12.13.0 &&
npm i -g yarn neovim &&
log "Installed node and yarn" &&

# Vim plugins

cd ~/.config/coc/extensions &&
npm install &&
cd ~/ &&
~/.config/nvim/nvim.appimage +PlugInstall +qall > /dev/null &&
~/.config/nvim/nvim.appimage +CocInstall coc-marketplace +qall > /dev/null &&
~/.config/nvim/nvim.appimage +UpdateRemovePlugins +qall > /dev/null &&
log "Installed vim plugins" &&


# TMux 

sudo apt-get install -y tmux &&
cp ../dotfiles/tmux.conf $HOME_DIR &&
mkdir -R ~/.config/tmux/plugins &&
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm &&

# keyboard setup

# sudo apt-get install -y xmodmap xorg-xev xorg-setxkbmap xorg-xset:


# Clean up zsh
echo "zsh" >> $HOME_DIR/.bashrc &&
exec bash -l
git_upload_ssh_key

