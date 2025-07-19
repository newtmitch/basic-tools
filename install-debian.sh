#!/bin/bash

#######
# 
# download and execute this script directly with this url:
#
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/newtmitch/basic-tools/main/install-debian.sh)"
#
#   or with curl:
#
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/newtmitch/basic-tools/main/install-debian.sh)"
#######

# uncomment the following to create a user if you need to do that. The rest of this script
# assumes running sudo and that you already have capability for that ready to go
# or not in sudo - you're already root
# apt update && \
# 	apt install -y sudo && \
# 	useradd -m mitch && \
# 	echo -e "mitch\nmitch" | passwd mitch && \
# 	adduser mitch sudo

apt update && apt install sudo

# basic stuff
sudo apt update && \
	sudo apt upgrade -y && \
	sudo apt install -y build-essential curl zsh git git-lfs tmux wget ruby-dev sudo rsync unzip

# install a recent version of node to support various neovim LSP setups
# cd ~
# curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
# sudo bash nodesource_setup.sh
# sudo apt install -y nodejs

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# Download and install Node.js:
nvm install 22
# Download and install Yarn:
corepack enable yarn

# lsd
sudo apt install lsd

# oh-my-zsh
zsh -c \
	"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended

# be sure to update the ZSH_HOME setting in the .zshrc file you finally put in place

# starship and fonts (from https://www.nerdfonts.com/font-downloads)
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --force
mkdir -p ~/.fonts 
cd ~/.fonts
curl -L -O \
	https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip && cd ~

# set up existing configs
mkdir -p ~/code
cd ~/code
git clone https://github.com/newtmitch/dotfiles.git
cd ~
mkdir -p ~/.config
rsync -ah ~/code/dotfiles/ ~
# clean just in case
rm -rf ~/.config/nvim  
# install neovim kickstarter for now
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# install powerlevel10k - we have to source the zshrc file to get the ZSH_CUSTOM variable
source ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# tmuxinator
sudo gem install tmuxinator
sudo wget \
	https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh \
	-O /usr/local/share/zsh/site-functions/_tmuxinator

# github command line for authentication
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# change shell to zsh
chsh -s /usr/bin/zsh

