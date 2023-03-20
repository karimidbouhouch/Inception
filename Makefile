all :
	-mkdir -p /home/kid-bouh/data/wp
	-mkdir /home/kid-bouh/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up --build 

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	-rm -rf /home/kid-bouh/data
	-docker volume rm $(docker volume ls -q)

prune:
	-docker system prune -af