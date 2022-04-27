#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

WEBPACKER_DEV_SERVER_HOST=0.0.0.0 ./bin/webpacker-dev-server &

bundle exec puma -b tcp://0.0.0.0:3000
