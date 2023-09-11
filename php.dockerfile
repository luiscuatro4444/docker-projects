FROM php:7.4-fpm-bullseye

RUN touch /var/log/error_log

ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN chsh -s /bin/bash

RUN apt update && apt install less

RUN adduser wp --shell /bin/bash 

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar wp && mv wp /usr/local/bin/wp && chmod +x /usr/local/bin/wp
 

