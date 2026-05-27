FROM localhost/ruby:2.3.1

WORKDIR /app
RUN apt-get update && apt-get install -y nodejs vim tzdata

expose 3000
