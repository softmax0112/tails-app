FROM ruby:3.1.2

ENV RAILS_ROOT /app
ENV DOCKER_DIR $PWD/docker/server

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT
RUN gem install bundler -v 2.3.13

COPY $DOCKER_DIR/docker-entrypoint.sh /
COPY $DOCKER_DIR/.irbrc //

ENTRYPOINT ["/docker-entrypoint.sh"]
