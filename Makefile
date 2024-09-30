all:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose -f src/docker-compose.yml up --build

clean:
	docker compose -f src/docker-compose.yml down -v

fclean: clean
	docker system prune -af --volumes
	rm -rf ~/data/wordpress/*
	rm -rf ~/data/mariadb/*
	


re: fclean all