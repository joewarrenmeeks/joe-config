#!/bin/zsh

export TERM=screen-256color
export GPG_TTY=$(tty)
source ~/.zshrc

alias vi=nvim

if [ "${1}" ] && [ "${2}" ]
then
  shift
  for file in ${@}; do
    files+="${file} "
  done
  zsh -l -c "vi ${files}"
elif [ "${1}" ]
then
  cd ${1} && zsh -l
else
  zsh -l
fi
