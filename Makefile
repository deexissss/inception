COMPOSE_FILE = srcs/docker-compose.yml

all:
	mkdir -p /home/tjehaes/data/mariadb
	mkdir -p /home/tjehaes/data/wordpress
	docker compose -f $(COMPOSE_FILE) up -d --build

down:
	docker compose -f $(COMPOSE_FILE) down

clean:
	docker compose -f $(COMPOSE_FILE) down -v

fclean: clean
	docker system prune -af
	sudo rm -rf /home/tjehaes/data/mariadb/*
	sudo rm -rf /home/tjehaes/data/wordpress/*

re: fclean all

.PHONY: all down clean fclean re
