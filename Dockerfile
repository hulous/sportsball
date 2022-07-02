FROM ruby:3.1.2-buster AS img_base

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  postgresql-client \
  graphviz \
  chromium-driver

FROM img_base AS build

RUN mkdir /sportsball
WORKDIR /sportsball

COPY Gemfile* ./

RUN gem install bundler
RUN bundle install

COPY . .
