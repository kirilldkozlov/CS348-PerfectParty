FROM ruby:latest
#initial install (nano, libpq = postgres, nodejs)
RUN apt-get update -qq && apt-get install -y build-essential nano libpq-dev nodejs
#install bundler gem
RUN gem install bundler
#init project
RUN mkdir /perfectparty
COPY Gemfile Gemfile.lock /perfectparty/
WORKDIR /perfectparty
RUN bundle install
COPY . /perfectparty