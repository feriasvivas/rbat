#!/bin/bash

setup() {
  docker-compose run --rm web bundle install
}

run_tests() {
  docker-compose run --rm web bundle exec rake db:create RAILS_ENV=test
  docker-compose run --rm web bundle exec rake db:migrate RAILS_ENV=test
  docker-compose run --rm web bundle exec rake db:seed RAILS_ENV=test
  docker-compose run --rm web bundle exec rspec
}

devel_setup() {
  docker-compose run --rm web bundle exec rake db:create
  docker-compose run --rm web bundle exec rake db:migrate
  docker-compose run --rm web bundle exec rake db:seed
}

launch() {
  docker-compose up
}

cleanup() {
  docker-compose down --rmi all -v
  sudo rm -rf tmp log
  git clean -xdf
}

if [ "$1" = "test" ]; then
  setup
  run_tests
elif [ "$1" = "launch" ]; then
  setup
  devel_setup
  launch
elif [ "$1" = "clean" ]; then
  cleanup
else
  echo "usage: $0 test|launch|clean"
fi
