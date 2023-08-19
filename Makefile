all: up

build:
	@docker compose -f ./srcs/docker-compose.yml up --build

up:
	@docker compose -f ./srcs/docker-compose.yml up

down:
	@docker compose -f ./srcs/docker-compose.yml down

prune: down
	@docker system prune -a --force

clean:
	@rm -rf /home/miahmadi/data/mariadb
	@rm -rf /home/miahmadi/data/website

pclean: prune clean

re: pclean build

.PHONY: all build up down prune clean pclean re