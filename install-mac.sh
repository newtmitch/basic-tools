#!/bin/bash

#######
# 
# download and execute this script directly with this url:
#
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/newtmitch/basic-tools/main/install-mac.sh)"
#
#   or with curl:
#
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/newtmitch/basic-tools/main/install-mac.sh)"
#######

# uncomment the following to create a user if you need to do that. The rest of this script
# assumes running sudo and that you already have capability for that ready to go
# or not in sudo - you're already root
# apt update && \
# 	apt install -y sudo && \
# 	useradd -m mitch && \
# 	echo -e "mitch\nmitch" | passwd mitch && \
# 	adduser mitch sudo

# mac-specific
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install: lsd, wget, nvim, and github cli
brew install --force lsd wget neovim gh

# oh-my-zsh
sh -c \
	"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -- --unattended

# basic stuff
#sudo apt update && \
#	sudo apt upgrade -y && \
#	sudo apt install -y build-essential neovim curl zsh git git-lfs tmux wget ruby-dev sudo rsync unzip

# lsd
#curl -L -O \
#	https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb && \
#	sudo dpkg -i lsd_0.20.1_amd64.deb && \
#	rm lsd_0.20.1_amd64.deb


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
if [ ! -d ~/code/basic-tools ]
then
	mkdir -p ~/code
	cd ~/code
	git clone https://github.com/newtmitch/basic-tools.git
fi
cd ~
mkdir -p ~/.config
rsync -ah ~/code/basic-tools/dotfiles/config/* ~/.config
cp ~/code/basic-tools/dotfiles/zshrc ~/.zshrc
cp ~/code/basic-tools/dotfiles/tmux.conf ~/.tmux.conf
cp ~/code/basic-tools/dev-project-starter-files/git/gitconfig ~/.gitconfig
source ~/.zshrc

# then login to github (optional)
# gh auth login

# change shell to zsh
chsh -s /usr/bin/zsh

