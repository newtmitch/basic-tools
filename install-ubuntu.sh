#!/bin/bash

# basic stuff
sudo apt update && \
	sudo apt upgrade -y && \
	sudo apt install -y build-essential neovim curl zsh git tmux wget ruby-dev sudo rsync

# or not in sudo - you're already root
apt update && \
	apt upgrade -y && \
	apt install -y build-essential neovim curl zsh git tmux wget ruby-dev sudo rsync && \
	useradd -m mitch && \
	echo -e "mitch\nmitch" | passwd mitch && \
	adduser mitch sudo

# lsd
curl -L -O \
	https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb && \
	sudo dpkg -i lsd_0.20.1_amd64.deb

# oh-my-zsh
sh -c \
	"$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
	--unattended

# be sure to update the ZSH_HOME setting in the .zshrc file you finally put in place

# starship and fonts (from https://www.nerdfonts.com/font-downloads)
curl -fsSL -o /tmp/starshipinstall.sh "https://starship.rs/install.sh" && \
	chmod a+x /tmp/starshipinstall.sh && sh /tmp/starshipinstall.sh --yes && \
	mkdir -p ~/.fonts && cd ~/.fonts && \
	curl -L -O \
		https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip && \
	unzip -o JetBrainsMono.zip && \
	rm JetBrainsMono.zip && cd ~

# set up existing configs
mkdir -p ~/code && \
	cd ~/code && \
	git clone https://github.com/newtmitch/basic-tools.git && \
	cd basic-tools && \
	mkdir -p ~/.config && \
	rsync -ah ~/code/basic-tools/dotfiles/config/* ~/.config && \
	cp ~/code/basic-tools/dotfiles/zshrc ~/.zshrc && \
	cp ~/code/basic-tools/dotfiles/tmux.conf ~/.tmux.conf && \
	cd ~ && \
	git config --global user.email "mitch@threeweekhobby.com" && \
	git config --global user.name "Ryan Mitchell" && \
	source ~/.zshrc

# tmuxinator
sudo gem install tmuxinator && \
	sudo wget \
	https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh \
	-O /usr/local/share/zsh/site-functions/_tmuxinator

# github command line for authentication
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
	sudo apt update && \
	sudo apt install gh

# then login to github (optional)
# gh auth login
