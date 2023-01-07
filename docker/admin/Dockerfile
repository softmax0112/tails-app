FROM node:18.12

ENV APP_ROOT /app
ENV DOCKER_DIR $PWD/docker/admin

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY $DOCKER_DIR/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
