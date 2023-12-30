FROM ruby:3.3.0

WORKDIR /ie_statement_app

RUN apt-get update && rm -rf /var/lib/apt/lists/*

COPY . .

RUN gem install bundler && bundle install
