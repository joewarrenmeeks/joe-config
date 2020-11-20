ZSH_THEME="half-life"
plugins=(git zsh-autosuggestions docker docker-compose helm kubectl terraform vi-mode virtualenv vscode magic-enter)
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
export PATH="$PATH:~/Library/Python/2.7/bin:~/Library/Python/3.8/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$HOME/bin:$HOME/dev/aws-tools:$PATH
export EDITOR=/usr/bin/vim
set -o vi
bindkey '^R' history-incremental-search-backward
alias vide='vi -u ~/.vimrc-ide'
export GH_HOST="github.ucds.io"
export GH_EDITOR=/usr/bin/vim
export PAGER=less
export GLAMOUR_STYLE=Dark
