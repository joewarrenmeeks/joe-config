HOST=$(hostname)

export LANG=en_GB.UTF-8
export LC_CTYPE=en_GB.UTF-8

if [ "$HOST" = "DWP0010079" ]
then
    export PATH="$PATH:$HOME/Library/Python/2.7/bin:$HOME/Library/Python/3.8/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$HOME/dev/aws-tools"
    export PATH=$HOME/bin:$PATH
    export EDITOR=$HOME/bin/nedit.sh
    export GH_EDITOR=/usr/bin/vim
    alias vi='nvi'
    alias nvi='nedit.sh ${1}'
    alias ide='nedit.sh'
    alias linux='linux.sh'
else
    export PATH=$HOME/.local/bin:$HOME/bin:$PATH
    export EDITOR=/usr/bin/nvim
    export GH_EDITOR=/usr/bin/nvim
    export GPG_TTY=$(tty)
fi

export POWERLINE_PATH=$HOME/Library/Python/3.8/lib/python/site-packages

plugins=(git zsh-autosuggestions docker docker-compose helm kubectl terraform vi-mode virtualenv vscode magic-enter)

export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
export XDG_CACHE_DIR=~/.config/zsh

source $POWERLINE_PATH/powerline/bindings/zsh/powerline.zsh

powerline-daemon -q


export GH_HOST="github.ucds.io"
bindkey '^R' history-incremental-search-backward
export PAGER=less
export GLAMOUR_STYLE=Dark
alias aws-decode='aws sts decode-authorization-message --encoded-message "$(cat -)" | jq --raw-output .DecodedMessage | jq .'
unsetopt share_history
set -o vi
