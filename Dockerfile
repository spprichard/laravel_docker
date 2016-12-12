FROM php:5-apache

MAINTAINER Steven 

#Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

#Install everthing that composer need
RUN apt-get install -y zip unzip curl git nodejs

#Get the cpmoser installer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

#Install composer
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer

#Unlink the composer installer
RUN php -r "unlink('composer-setup.php');"

#Used to turn on modrewrite for apache
RUN a2enmod rewrite

COPY ./laravel/package.json /var/www/html

#COPY over start script
COPY start.sh /run/

#Gives execute permissions
RUN chmod +x /run/start.sh

COPY 000-default.conf /etc/apache2/sites-enabled/

#Run start script
CMD ["/bin/bash", "/run/start.sh"]