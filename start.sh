#!/bin/zsh

export TERM=screen-256color
export GPG_TTY=$(tty)
source ~/.zshrc

alias vi=nvim
cd
exec zsh -l
