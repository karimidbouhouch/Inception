all :
	mkdir -p ~/data/wp
	-mkdir  ~/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build 

clean:
	docker-compose down -f ./srcs/docker-compose.yml

fclean: clean
	rm -rf ~/data
	-docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q)

prune:
	-docker system prune -af