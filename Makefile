APPLICATION_NAME = sportsball
WEB_CONTAINER_NAME = sportsball-web
.DEFAULT_GOAL := help

# podman stuff
attach: ## Attach running web container to see logs
	podman attach $(APPLICATION_NAME)_$(WEB_CONTAINER_NAME)_1

up: ## Run containers
	podman-compose up -d

down: ## Stop containers
	podman-compose down

serve: up ## Run Serve
	make attach

ps: ## List containers
	podman-compose ps

restart_web: ## Restart Web container
	podman-compose restart $(WEB_CONTAINER_NAME)

# Build containers
build: ## Build containers
	podman-compose build

clean: down ## Cleanup podman images.
	podman system prune -a

rebuild: clean ## Stop containers, delete podman images not used and build container
	make build

# Rails install tools
bundle: ## Run bundle install
	podman-compose run --rm $(WEB_CONTAINER_NAME) bundle install

migrate: ## Run rake db migrate
	podman-compose run --rm $(WEB_CONTAINER_NAME) bundle exec rake db:migrate

# Devs console
bash: ## Run bash in web-container
	podman-compose run --rm $(WEB_CONTAINER_NAME) bash

console: ## Run Rails console
	podman-compose run --rm $(WEB_CONTAINER_NAME) bundle exec rails c

# Code smells tools
guard: up ## Run project guard (in running container)
	podman-compose exec $(WEB_CONTAINER_NAME) bundle exec guard

sniff: ## Run code smelling tools (rubocop only for now)
	podman-compose run --rm $(WEB_CONTAINER_NAME) bundle exec rubocop .

tests: ## Run test locally in web container (with failfast and code coverage option)
	podman-compose run -e FAILFAST=true -e COVERAGE=true --rm $(WEB_CONTAINER_NAME) bundle exec rspec .

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
