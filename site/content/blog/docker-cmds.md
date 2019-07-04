---
title: "Docker Commands"
date: 2019-07-04T15:28:09+08:00
draft: false
images: []
---

## Get help

// Get help
docker -h

// Get help for a command
docker image prune --help


## Container

// Show all containers, including both running and stopped
docker ps -a

// Get container logs
docker logs $container

// Attach std in/out/error to a running container
docker attach $container 

// Run a command in a running container interactively
docker exec -it $container /bin/sh

// Show detail of a container
docker inspect $container

// Stats
docker stats $container

// Start/stop a container
docker start / stop $container

// Remove a container
docker rm $container

## Image

docker image ls
docker image history $image
docker rmi $image

// Remove all unused images, not just dangling ones
docker image prune -a

## network

// List docker networks
docker network ls
