FROM 329413756974.dkr.ecr.eu-west-2.amazonaws.com/ucfs/base-debian:buster-slim

USER root
RUN apt-get update
RUN apt-get -y install neovim zsh git python3-pip black python3-venv
RUN useradd -l -M -s /bin/zsh --uid 468447390 joewarrenmeeks
ADD start.sh /bin/start.sh
RUN chmod 755 /bin/start.sh

USER joewarrenmeeks
