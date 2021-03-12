ZSH_THEME="half-life"
plugins=(git zsh-autosuggestions docker docker-compose helm kubectl terraform vi-mode virtualenv vscode magic-enter)
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
HOST=$(hostname)
export LANG=en_GB.UTF-8

if [ "$HOST" = "DWP0010079" ]
then
    export PATH="$PATH:$HOME/Library/Python/2.7/bin:$HOME/Library/Python/3.8/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    export PATH=$HOME/bin:$HOME/dev/aws-tools:$PATH
    export EDITOR=$HOME/bin/nedit.sh
    export GH_EDITOR=/usr/bin/vim
    alias vi='nvi'
    alias nvi='nedit.sh ${1}'
    alias ide='nedit.sh'
    alias linux='docker run -d --rm --mount type=bind,source=/Users/joewarrenmeeks,target=/home/joewarrenmeeks --name linux linux:latest tail -f /dev/null'

else
    export PATH=$HOME/dev/aws-tools/terraform/venv/bin/:$HOME/.local/bin:$HOME/bin:$HOME/dev/aws-tools:$PATH
    export EDITOR=/usr/bin/nvim
    export GH_EDITOR=/usr/bin/nvim
    export GPG_TTY=$(tty)
fi

export GH_HOST="github.ucds.io"
bindkey '^R' history-incremental-search-backward
export PAGER=less
export GLAMOUR_STYLE=Dark
alias aws-decode='aws sts decode-authorization-message --encoded-message "$(cat -)" | jq --raw-output .DecodedMessage | jq .'
set -o vi
