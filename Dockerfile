FROM ruby:3.2.2-slim
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    cron \
    telnet \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update -qq && apt-get install -y default-libmysqlclient-dev

#Cache bundle install
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
# RUN bundle install
RUN bundle install --gemfile /app/Gemfile

ADD . /app

RUN mkdir -p ./docker/db

EXPOSE  3000
CMD rm -f tmp/pids/server.pid && rails s -b '0.0.0.0'
