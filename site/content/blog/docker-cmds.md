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
    docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc) // Be very careful!

## Networking

- List docker networks

    docker network ls

## Run Nginx in Docker

- docker run --name some-nginx -v /some/content:/usr/share/nginx/html:ro -d nginx
- docker run --name my-custom-nginx-container -v /host/path/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
- docker cp tmp-nginx-container:/etc/nginx/nginx.conf /host/path/nginx.conf

## Run PHP in Docker

- docker run -d -p 8080:80 --name my-apache-php-app -v "$PWD":/var/www/html php:7.2-apache

## Cleanup

- [Docker - How to cleanup (unused) resources](https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430)

``` Bash
  Once in a while, you may need to cleanup resources (containers, volumes, images, networks) ...
  delete volumes

  // see: https://github.com/chadoe/docker-cleanup-volumes

  $ docker volume rm $(docker volume ls -qf dangling=true)
  $ docker volume ls -qf dangling=true | xargs -r docker volume rm

  delete networks

  $ docker network ls  
  $ docker network ls | grep "bridge"   
  $ docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')

  remove docker images

  // see: http://stackoverflow.com/questions/32723111/how-to-remove-old-and-unused-docker-images

  $ docker images
  $ docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

  $ docker images | grep "none"
  $ docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')

  remove docker containers

  // see: http://stackoverflow.com/questions/32723111/how-to-remove-old-and-unused-docker-images

  $ docker ps
  $ docker ps -a
  $ docker rm $(docker ps -qa --no-trunc --filter "status=exited")

  Resize disk space for docker vm

  $ docker-machine create --driver virtualbox --virtualbox-disk-size "40000" default
```

## Ref

[How To Remove Docker Containers, Images, Volumes, and Networks](https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/)
