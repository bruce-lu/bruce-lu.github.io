---
title: "Docker-compose for Wordpress"
date: 2019-08-26T23:38:09+08:00
draft: false
images: []
---

## Get theme bitpal.zip

- [Bitpal theme](https://themeforest.net/item/bitpal-cryptocurrency-wordpress-theme/22592946)

## docker-compose.yml for wordpress

``` Bash

cat docker-compose.yml

version: '3.3'

services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: *
       MYSQL_DATABASE: *
       MYSQL_USER: *
       MYSQL_PASSWORD: *

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     volumes:
       - /ws/bitpal:/var/www/html/wp-content/themes/bitpal # BitPal theme install
     ports:
       - "10000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: *
       WORDPRESS_DB_PASSWORD: *
       WORDPRESS_DB_NAME: *
volumes:
    db_data: {}

```

## docker-compose up
