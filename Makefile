magic:
	docker compose down
	@make build
	@make up
	@make composer-update
	@make data
	docker compose ps

build:
	docker compose build --no-cache --force-rm

stop:
	docker compose stop

up:
	docker compose up -d

composer-update:
	docker exec crud-app bash -c "composer update"

data:
	docker exec crud-app bash -c "php artisan migrate"