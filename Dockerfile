FROM 329413756974.dkr.ecr.eu-west-2.amazonaws.com/ucfs/base-debian:bullseye-slim

USER root
RUN apt-get update || true

RUN apt-get -y install ca-certificates
ADD *.pem /etc/ssl/certs/
RUN chmod 644 /etc/ssl/certs/*
RUN /usr/sbin/update-ca-certificates --fresh

RUN apt-get -y install neovim zsh python3-pip virtualenv curl python2 \
	python3-pycurl locales curl procps git yamllint

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py  --output /tmp/get-pip.py
RUN python2 /tmp/get-pip.py --trusted-host pypi.org --trusted-host files.pythonhosted.org && rm /tmp/get-pip.py

# apt-get install python3-venv and vault and terraform

RUN pip3 install --upgrade pynvim yapf flake8 pylint  --trusted-host pypi.org --trusted-host files.pythonhosted.org
RUN pip2 install --upgrade pynvim --trusted-host pypi.org --trusted-host files.pythonhosted.org

RUN curl --insecure -sL install-node.now.sh/lts > /tmp/foo 
RUN bash /tmp/foo --yes && rm /tmp/foo
RUN locale-gen en_GB.UTF-8

RUN useradd -l -M -s /bin/zsh --uid 468447390 joewarrenmeeks
ADD start.sh /bin/start.sh
RUN chmod 755 /bin/start.sh
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /home /Users

USER joewarrenmeeks
