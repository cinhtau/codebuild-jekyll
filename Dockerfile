FROM ruby:latest

RUN apt-get update && apt-get install -y build-essential libssl-dev
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install -y nodejs
RUN npm install -g gulp && apt-get autoclean