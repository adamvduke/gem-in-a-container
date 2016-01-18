#!/bin/bash

set -e

if [ "$1" = 'bash' ]; then
  exec "$@"
fi

if [ -z $APP_SERVER ]; then
  echo "APP_SERVER is required"
  exit 1
fi

BUNDLE=$GEM_HOME/bin/bundle

case $APP_SERVER in
passenger)
  START_COMMAND="passenger start"
  ;;
puma)
  START_COMMAND="puma"
  ;;
thin)
  START_COMMAND="thin start"
  ;;
unicorn)
  START_COMMAND="unicorn"
  ;;
*)
  echo "Unknown application server: '$APP_SERVER'. Valid options: passenger, puma, thin, unicorn"
  exit 1
  ;;
esac

exec $BUNDLE exec $START_COMMAND $START_COMMAND_OPTS --port $APP_PORT
