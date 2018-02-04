FROM ruby:latest

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# essential software
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential libssl-dev wget python python-dev

# install nodejs
ENV NVM_DIR /usr/local/nvm
# use LTS version
ENV NODE_VERSION 8.9.4

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

WORKDIR build

# NPM packages taken from Jekyll Gulp project
RUN npm install -g gulp

# Ruby Gems needed by Jekyll
COPY Gemfile .
RUN bundle install

# AWS CLI
RUN wget "https://bootstrap.pypa.io/get-pip.py" -O /tmp/get-pip.py \
    && python /tmp/get-pip.py \
    && pip install awscli==1.11.157 \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*