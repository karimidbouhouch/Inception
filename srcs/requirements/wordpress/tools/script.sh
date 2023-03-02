#! /bin/bash
sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
chown www-data:www-data /var/www/html
runuser -u www-data -- wp --path="/var/www/html" core download
runuser -u www-data -- wp core config --path=/var/www/html --dbhost=mariadb --dbname=$DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --skip-check
runuser -u www-data -- wp core install --path=/var/www/html --url=$DOMAIN_NAME --title="1337 coding school" --admin_name=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=kid-bouh@student.1337.ma
service php7.3-fpm start
service php7.3-fpm stop
php-fpm7.3 -F
