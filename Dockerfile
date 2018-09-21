# Tùy vào dự án của bạn sẽ thay đổi Ruby version của mình
FROM ruby:2.5.0

# Install các package cần thiết
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs ntp yarn
RUN apt-get install -y rubygems ruby-mysql2 wget build-essential default-libmysqlclient-dev ruby2*-dev sqlite3 libsqlite3-dev

WORKDIR /rails-server

ADD Gemfile Gemfile.lock /rails-server/

RUN bundle install
VOLUME /user/local/bundle

ADD . /rails-server