FROM debian:buster

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install vsftpd -y;

COPY ./config/script.sh / 

ENTRYPOINT ["bash", "/script.sh"]
