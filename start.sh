#!/bin/zsh

export TERM=screen-256color

source ~/.zshrc

alias vi=nvim
cd
exec zsh -l -c /usr/bin/tmux
