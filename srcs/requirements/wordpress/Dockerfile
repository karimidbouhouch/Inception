FROM debian:buster

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y php-fpm php-mysql curl; \ 
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    chmod +x wp-cli.phar; \
    mv wp-cli.phar /bin/wp; 

COPY ./tools/script.sh / 

ENTRYPOINT ["bash", "/script.sh"]
