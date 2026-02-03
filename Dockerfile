FROM ruby:2.3.1

WORKDIR /app
RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list
RUN sed -i 's/security.debian.org/archive.debian.org\/debian-security/g' /etc/apt/sources.list
RUN sed -i /updates/d /etc/apt/sources.list
RUN apt-get -o Acquire::AllowInsecureRepositories=true update && apt-get --allow-unauthenticated -o Acquire::AllowInsecureRepositories=true install -y nodejs

expose 3000
