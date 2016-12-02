FROM php:5-apache

MAINTAINER Steven 

RUN apt-get update

#Install everthing that composer need
RUN apt-get install -y zip unzip curl git

#Get the cpmoser installer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

#Install composer
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer

#Unlink the composer installer
RUN php -r "unlink('composer-setup.php');"

#Used to turn on modrewrite for apache
RUN a2enmod rewrite

COPY 000-default.conf /etc/apache2/sites-enabled/



