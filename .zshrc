export ZSH=~/.oh-my-zsh
ZSH_THEME="half-life"
plugins=(git zsh-autosuggestions docker docker-compose helm kubectl terraform vi-mode vscode magic-enter)
source $ZSH/oh-my-zsh.sh
export PATH=$HOME/bin:$HOME/dev/aws-tools:$PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export EDITOR=$HOME/bin/vim
set -o vi
bindkey '^R' history-incremental-search-backward
alias vi="$HOME/bin/vim"
alias vide='vim -u ~/.vimrc-ide'
