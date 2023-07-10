FROM wordpress:latest

ARG MYSQLPASSWORD
ARG MYSQLHOST
ARG MYSQLPORT
ARG MYSQLDATABASE
ARG MYSQLUSER
ARG PORT

ENV WORDPRESS_DB_HOST=$MYSQLHOST:$MYSQLPORT
ENV WORDPRESS_DB_NAME=$MYSQLDATABASE
ENV WORDPRESS_DB_USER=$MYSQLUSER
ENV WORDPRESS_DB_PASSWORD=$MYSQLPASSWORD
ENV WORDPRESS_TABLE_PREFIX="RW_"

RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf

RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

EXPOSE $PORT

CMD ["apache2-foreground", "-D", "APACHE_PORT="$PORT]
