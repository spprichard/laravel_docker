#!/bin/sh

cd /var/www/html
echo "Start Install"
npm install
composer install
echo "End Install"

apache2-foreground


