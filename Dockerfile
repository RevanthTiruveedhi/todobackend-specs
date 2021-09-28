FROM ubuntu:18.04
MAINTAINER Rev

ENV TERM=xterm-256color

RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list

RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_12.x | sh && \
    apt-get install -y nodejs

COPY . /app
WORKDIR /app

RUN npm install -g mocha@5.2.0 && \
    npm install

ENTRYPOINT ["mocha"]