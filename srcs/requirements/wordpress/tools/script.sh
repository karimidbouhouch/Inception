#! /bin/bash
sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
wp core download --path="/var/www/html" --allow-root
wp config create --dbhost="mariadb" --dbname="$DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --path="/var/www/html" --allow-root --skip-check --extra-php <<PHP
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
PHP
wp core install --url="$DOMAIN_NAME" --title="1337 coding school" --admin_name="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email=kid-bouh@student.1337.ma --path="/var/www/html" --allow-root
wp plugin install redis-cache --activate --path="/var/www/html" --allow-root
wp redis enable --path="/var/www/html" --allow-root
chown -R www-data:www-data /var/www/html
service php7.3-fpm start
service php7.3-fpm stop
chmod -R 777 /var/www/html
php-fpm7.3 -F


