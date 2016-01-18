FROM ruby:2.3.0
MAINTAINER adam.v.duke@gmail.com

ENV APP_PORT 9180
ENV APP_DIR /srv/geminabox/current
WORKDIR $APP_DIR

ENV DATA_DIR /srv/geminabox/data/
ENV RUBYGEMS_PROXY true
ENV ALLOW_REMOTE_FAILURE true
ENV BUILD_LEGACY false
ENV APP_SERVER puma

COPY gemrc $HOME/.gemrc
COPY Gemfile $APP_DIR/
RUN bundle install

COPY config.ru $APP_DIR/
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

VOLUME $DATA_DIR
EXPOSE $APP_PORT
