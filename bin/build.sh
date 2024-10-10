#!/usr/bin/env bash
set -o errexit

node --version

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

bundle exec rails db:migrate db:seed