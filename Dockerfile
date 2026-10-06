FROM ruby:2.6

RUN apt-get update && apt-get install -y nodejs vim tzdata
RUN adduser rails
USER rails
WORKDIR /app

expose 3000
