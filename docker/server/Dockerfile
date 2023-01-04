FROM ruby:3.1.2

USER 1000
ENV RAILS_ROOT /app
ENV DOCKER_DIR $PWD/docker/server

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY $DOCKER_DIR/docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
