#!/bin/bash

#######
# 
# download and execute this script directly with this url:
#
#   sh -c "$(wget -qO- https://raw.githubusercontent.com/newtmitch/basic-tools/main/install-ubuntu.sh)"
#
#   or with curl:
#
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/newtmitch/basic-tools/main/install-ubuntu.sh)"
#######

# uncomment the following to create a user if you need to do that. The rest of this script
# assumes running sudo and that you already have capability for that ready to go
# or not in sudo - you're already root
# apt update && \
# 	apt install -y sudo && \
# 	useradd -m mitch && \
# 	echo -e "mitch\nmitch" | passwd mitch && \
# 	adduser mitch sudo

# basic stuff
sudo apt update && \
	sudo apt upgrade -y && \
	sudo apt install -y build-essential neovim curl zsh git tmux wget ruby-dev sudo rsync unzip

# lsd
curl -L -O \
	https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb && \
	sudo dpkg -i lsd_0.20.1_amd64.deb && \
	rm lsd_0.20.1_amd64.deb

# oh-my-zsh
sh -c \
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
cp ~/code/basic-tools/git/gitconfig ~/.gitconfig
source ~/.zshrc

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

# then login to github (optional)
# gh auth login

# change shell to zsh
chsh -s /usr/bin/zsh

