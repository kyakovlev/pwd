#!/bin/sh

while [ ! -d /nginx ]
do
  sleep 1
done

echo "nginx -> set nginx config"

sed -i "s/___SERVER_NAME___/$SERVER_NAME/g" /default.conf.template

if [ -z "$SERVER_NAME" ]; then
    echo "Need to set SERVER_NAME"
    exit 1
fi

cp /default.conf.template /nginx/default.conf

while [ ! -d /app ]
do
  sleep 1
done

echo "yii2 -> set db config"
sed -i "s/___MYSQL_DATABASE___/$MYSQL_DATABASE/g" /db.php.template
sed -i "s/___MYSQL_USER___/$MYSQL_USER/g" /db.php.template
sed -i "s/___MYSQL_PASSWORD___/$MYSQL_PASSWORD/g" /db.php.template

if [ -z "$MYSQL_DATABASE" ]; then
    echo "Need to set MYSQL_DATABASE"
    exit 1
fi

if [ -z "$MYSQL_USER" ]; then
    echo "Need to set MYSQL_USER"
    exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
    echo "Need to set MYSQL_PASSWORD"
    exit 1
fi

cp /db.php.template /app/config/db.php

echo "yii -> Set permittion for assets"
chgrp www-data /app/web/assets
chmod g+w /app/web/assets/

cd /app

echo "yii2 -> Update your vendor packages"
composer update --prefer-dist

echo "yii2 -> Run the installation triggers (creating cookie validation code)"
composer install

exit 0
