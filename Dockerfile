FROM node:8-alpine
MAINTAINER wangxi <sunnywang@yunify.com>

ENV SASS_BINARY_PATH=/home/linux-x64-57_binding.node

WORKDIR /home

COPY . ./

RUN npm config set registry https://registry.npm.taobao.org && \
    npm i npm@latest -g && \
    npm i node-sass --unsafe-perm -g

# reduce size
RUN rm -rf /var/cache/apk/* && \
    npm cache clean --force

CMD ["node-sass", "-v"]
