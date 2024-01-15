FROM node:alpine AS build

WORKDIR /app

COPY ./primal-web-app ./

RUN npm cache clean --force && \
    npm ci --foreground-scripts && \
    npm run build && \
    rm -rf /root/.npm

FROM busybox:latest AS final

COPY --from=build /app/dist /primal
RUN chown -R nobody:nobody /primal

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
