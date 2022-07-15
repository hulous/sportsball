# README

This is a component based rails app.

## Local installation:
### Install Podman (docker alternative)
#### Install podman
  - curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/Release.key" | sudo apt-key add -
  - sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y install podman

#### Install podman-compose
  - pip install python-dotenv
  - cd && curl -o ~/.local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/devel/podman_compose.py
  - cd && chmod +x ~/.local/bin/podman-compose

### Install app
 - Copy/past env.local.sample as env.local
 - Edit env.local with the good creds for you.
 - Run the `make build` command
 - Run the `make bash` command and run `bundle exec rails db:create`
 - Run `make up`
 - Check localhost:3003

## Make command

Run `make help` for display all available commands and infos
