# Instalación Base Images
FROM	debian:buster

# Actualización de paquetes del OS
RUN	apt-get update
RUN	apt-get upgrade

# Instalación programas utilizados
RUN	apt-get install -y wget vim unzip curl

# Añadir archivos de configuración
RUN	mkdir srcs
ADD	./srcs/mariadb_conf.sql /srcs/
ADD	./srcs/database.sh /srcs/
ADD	./srcs/phpmyadmin_conf /srcs/
ADD	./srcs/wordpress_conf /srcs/
ADD	./srcs/autoindex.sh /srcs/
ADD	./srcs/autoindex_on /srcs/
ADD	./srcs/autoindex_off /srcs/


# Instalación Nginx
RUN	apt-get install -y nginx
RUN	rm /etc/nginx/sites-available/default
RUN	rm /etc/nginx/sites-enabled/default
RUN	cp /srcs/autoindex_on /etc/nginx/sites-available/default
RUN	ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
RUN	mv /var/www/html/index.nginx-debian.html /var/www/html/nginx.html
RUN	echo "daemon off;" >> /etc/nginx/nginx.conf

# Instalación ssl-cert Snakeoil
RUN	apt-get install -y ssl-cert

# Instalación MariaDB
RUN	apt-get install -y mariadb-server

# Instalación PHP
RUN	apt-get install -y php7.3-fpm php7.3-sql
RUN	echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

# Instalación PhpMyAdmin
RUN	apt-get install php7.3-mysql php7.3-xml php7.3-mbstring
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.zip
RUN	unzip phpMyAdmin-5.1.0-all-languages.zip && rm phpMyAdmin-5.1.0-all-languages.zip
RUN	mv phpMyAdmin-5.1.0-all-languages phpmyadmin
RUN	mv phpmyadmin /var/www/html
RUN	mv /srcs/phpmyadmin_conf /var/www/html/phpmyadmin/config.inc.php

# Instalación de WordPress
RUN	wget https://wordpress.org/latest.zip
RUN	unzip latest.zip && rm latest.zip
RUN	mv /srcs/wordpress_conf /wordpress/wp-config.php
RUN	mv /wordpress/ /var/www/html/

# Creación de sition web con WP-CLI
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Dar permisos al usuario www-data
RUN	chown -R www-data:www-data /var/www/html/*
RUN	chmod -R 775 /var/www/html/*

# Crear puertos de acceso
EXPOSE 80 443

ENV	INDEX=on
# Iniciar contenedor
CMD	/etc/init.d/mysql start && \
	bash /srcs/database.sh && \
	bash /srcs/autoindex.sh && \
	cd /var/www/html/wordpress && \
	wp core install --url=localhost/wordpress --title=42_Madrid --admin_name=pgomeza --admin_password=xxxx --admin_email=pgomeza@email.com --allow-root && \
	/etc/init.d/php7.3-fpm start && \
	/etc/init.d/nginx start && \
	bash start
