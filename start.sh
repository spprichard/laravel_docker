#!/bin/sh

cd /var/www/html

echo "Start"
npm install
echo "End"

apache2-foreground


