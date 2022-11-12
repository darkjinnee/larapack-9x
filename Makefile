DC = docker-compose
EP = $(DC) exec php

help:
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-14s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

phpstan: ## PHPStan
	$(EP) ./vendor/bin/phpstan analyse -c phpstan.neon

pint: ## Pint
	$(EP) ./vendor/bin/pint

migrate_fresh: ## Seeding database
	$(EP) ./artisan migrate:fresh --seed

cache: ## Clear cache
	$(EP) ./artisan cache:clear

config_cache: ## Clear cache config
	$(EP) ./artisan config:cache

route_cache: ## Clear route cache
	$(EP) ./artisan route:cache

schedule_cache: ## Clear cache schedule
	$(EP) ./artisan schedule:clear-cache

up: ## Docker up services
	$(DC) up --build -d

down: ## Docker remove services
	$(DC) down --rmi=all

exec-php: ## Docker exec php service
	$(EP) bash

logs: ## Docker show logs
	$(DC) logs -f
