#!/bin/zsh

export TERM=screen-256color
export GPG_TTY=$(tty)
source ~/.zshrc

alias vi=nvim

if [ "${1}" ] && [ "${2}" ]
then
  shift
  zsh -l -c "vi ${@}"
elif [ "${1}" ]
then
  cd ${1} && zsh -l
else
  zsh -l
fi
