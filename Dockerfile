FROM node:9-alpine
MAINTAINER wangxi <sunnywang@yunify.com>

# openpitrix dashboard runtime with webpack and node-sass built-in

ENV SASS_BINARY_SITE=https://npm.taobao.org/mirrors/node-sass/

WORKDIR /home

RUN apk update && \
    apk add g++ make python

COPY .npmrc ./

RUN npm config set registry https://registry.npm.taobao.org && \
    npm i webpack@4.17 webpack-cli -g && \
    npm i node-sass --unsafe-perm -g

# reduce docker image
RUN apk del g++ make python && \
    rm -rf /var/cache/apk/*

CMD ["node-sass", "-v"]