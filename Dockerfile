FROM docker.io/library/ruby:3.1.2-buster AS app_builder

RUN \
  apt-get update -yqq && \
  apt-get install -yqq --no-install-recommends nodejs postgresql-client graphviz chromium-driver && \
  rm -rf /var/lib/apt/lists/*

FROM app_builder AS app_runner

RUN mkdir /sportsball
WORKDIR /sportsball

COPY Gemfile* ./
COPY components/ /sportsball/components/

RUN gem install bundler
RUN bundle install

COPY . .
