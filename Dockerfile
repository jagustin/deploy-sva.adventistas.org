FROM php:7-apache

COPY extras/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY extras/start-apache /usr/local/bin
COPY app /var/www/html
COPY extras/disable-phpinfo.ini /usr/local/etc/php/conf.d/

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite headers
RUN chown -R www-data:www-data /var/www/html

ARG DB_HOST
ARG DB_NAME
ARG DB_PASSWORD
ARG DB_USER

ENV DB_HOST=$DB_HOST
ENV DB_NAME=$DB_NAME
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_USER=$DB_USER

EXPOSE 80