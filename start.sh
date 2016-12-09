#!/bin/sh

cd /var/www/html

echo "Start of install"
npm install
composer install
echo "End of install"

apache2-foreground


