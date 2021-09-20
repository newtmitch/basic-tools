# Path to your oh-my-zsh installation.
export ZSH=/home/mitch/.oh-my-zsh

# rsm: debug zsh load times
# zmodload zsh/zprof

# setopt autolist
# unsetopt menucomplete

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose doctl virtualenv)

source $ZSH/oh-my-zsh.sh

# User configuration

#
# rsm: likely mac-specific
# 
# NVM
# export NVM_DIR="$HOME/.nvm"
# set up aliases for NVM so for the 99.9% of the time when we don't need nvm, our shell loads faster
# alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
# load a default node so we have something when we don't have nvm loaded
# export PATH="$PATH:/Users/mitch/.nvm/versions/node/v12.22.1/bin"
# export PATH="$PATH:/Users/mitch/.nvm/versions/node/v10.16.0/bin/node"
# alias setnpmbin=PATH='$PATH:$(npm config get prefix)/bin'

# add yarn to the path - we install via the following command from the yarn website because
# homebrew installs node as well, and that means we *have* to load nvm (slow!) in order not to use
# that version of node, which is silly.
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# export PATH="$PATH:/Users/mitch/.rbenv/shims:/usr/sbin:/sbin:/Applications/Postgres.app/Contents/Versions/9.4/bin"
# export MANPATH="/usr/local/man:$MANPATH"


# rsm: zsh completion scripts installed via Homebrew
# (per https://github.com/ahmetb/dotfiles/blob/7b9f8c95d2ecb0df31c59525967f6305ce95360e/.zshrc#L37-L41)
# fpath=("usr/local/share/zsh/site-functions" $fpath)
# Reload the zsh-completions
autoload -U compinit && compinit

#
# rsm: optional
# 
# pipenv completion
# eval "$(pipenv --completion)"

# starship
eval "$(starship init zsh)"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias bfg="java -jar /Users/mitch/Dev/mitch-stuff/basic-tools/bfg-1.14.0.jar"
alias vi='nvim'
alias vim='nvim'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias h='history'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mitch/Dev/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mitch/Dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mitch/Dev/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mitch/Dev/google-cloud-sdk/completion.zsh.inc'; fi

# rsm: aliases
alias setminikubedocker='eval $(minikube docker-env)'
alias unsetminikubedocker='eval "$(docker-machine env -u)"'

# rsm: debug zsh load times
# zprof


