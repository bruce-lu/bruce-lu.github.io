---
title: "Docker Commands"
date: 2019-07-04T15:28:09+08:00
draft: false
images: []
---

## Get help

- Get help

    docker -h

- Get help for a command

    docker image prune --help


## Container

- Show all containers, including both running and stopped

    docker ps -a

- Get container logs

    docker logs $container

- Attach std in/out/error to a running container

    docker attach $container

- Run a command in a running container interactively

    docker exec -it $container /bin/sh

- Show detail of a container

    docker inspect $container

- Stats

    docker stats $container

- Start/stop a container

    docker start / stop $container

- Remove a container

    docker rm $container

## Image

- basic actions

    docker image ls
    docker image history $image
    docker rmi $image

- Remove all unused images, not just dangling ones

    docker image prune -a

## Networking

- List docker networks

    docker network ls

## Run Nginx in Docker

- docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx
- docker run --name my-custom-nginx-container -v /host/path/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
- docker cp tmp-nginx-container:/etc/nginx/nginx.conf /host/path/nginx.conf

## Run PHP in Docker

- docker run -d -p 8080:80 --name my-apache-php-app -v "$PWD":/var/www/html php:7.2-apache
