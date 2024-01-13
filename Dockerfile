FROM node:alpine

WORKDIR /app

COPY ./primal-web-app ./

RUN npm install

RUN apk add --no-cache tini && \
    rm -f /var/cache/apk/*

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
