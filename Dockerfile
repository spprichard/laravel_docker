FROM php:5-apache

MAINTAINER Steven 

RUN apt-get update
RUN apt-get install -y zip unzip curl git
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"


COPY 000-default.conf /etc/apache2/sites-enabled/



