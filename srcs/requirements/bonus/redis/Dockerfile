FROM debian:buster

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install redis-server -y;

COPY ./config/script.sh / 

ENTRYPOINT ["bash", "/script.sh"]

