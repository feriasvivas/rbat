web: bundle exec rails server -p $PORT --trace
worker: env QUEUE=export bundle exec rake environment resque:work --trace
