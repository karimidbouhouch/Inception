FROM debian:buster

RUN apt-get update -y; \
    apt install nginx -y; \
    apt install openssl -y; \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=MO/L=KH/O=1337/OU=ST/CN=kid-bouh.42.fr";

COPY conf/default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
