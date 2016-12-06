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

#Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

#Install NPM
#RUN apt-get install npm -y

COPY ./laravel/package.json /var/www/html

#COPY over start script
ADD start.sh /run/

##Get all dependencies
#RUN npm install

COPY 000-default.conf /etc/apache2/sites-enabled/

#Run start script
CMD ["/run/start.sh"]



