FROM ubuntu:latest

USER root
RUN apt-get update

RUN apt-get -y install ca-certificates
ADD *.pem /etc/ssl/certs/
RUN chmod 644 /etc/ssl/certs/*
RUN /usr/sbin/update-ca-certificates --fresh

RUN apt-get -y install neovim zsh git python3-pip black virtualenv curl python2 python3-pynvim python3-pycurl
RUN useradd -l -M -s /bin/zsh --uid 468447390 joewarrenmeeks
ADD start.sh /bin/start.sh
RUN chmod 755 /bin/start.sh

USER joewarrenmeeks
