FROM 329413756974.dkr.ecr.eu-west-2.amazonaws.com/ucfs/base-debian:buster-slim

USER root
RUN apt-get update
RUN apt-get -y install neovim zsh
