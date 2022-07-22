# README

This is a component based rails app.

## Local installation:

We use docker for a clean local installation. You should install [Docker](https://docs.docker.com/engine/install) before following theses steps:
 - Copy/past env.local.sample as env.local
 - Edit env.local with the good creds for you.
 - Run the `make build` command
 - Run the `make bash` command and run `bundle exec rails db:create`
 - Run `make up`
 - Check localhost:3003

## Make command

Run `make help` for display all available commands and infos
