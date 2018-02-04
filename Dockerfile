FROM ruby:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential libssl-dev wget python python-dev
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash
RUN apt-get install -y nodejs

# NPM packages taken from Jekyll Gulp project
COPY package.json .
RUN npm install && npm install gulp

# Ruby Gems needed by Jekyll
COPY Gemfile .
RUN bundle install

# AWS CLI
RUN wget "https://bootstrap.pypa.io/get-pip.py" -O /tmp/get-pip.py \
    && python /tmp/get-pip.py \
    && pip install awscli==1.11.157 \
    && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*