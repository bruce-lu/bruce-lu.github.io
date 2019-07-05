---
title: "Go - Build a web API"
date: 2019-07-04T21:36:34+08:00
draft: false
images: []
---

## Objective

  Build a web API by using Go language on Linux

## Setup Go

- Download

  wget https://dl.google.com/go/go1.12.4.linux-amd64.tar.gz
  tar -C /usr/local -xzf ./go1.12.4.linux-amd64.tar.gz

- Configure PATH

  Add Go to PATH in ~/.bash_profile

  ``` Bash
  export PATH=$PATH:/usr/local/go/bin
  ```

- Source

  ``` Bash
  . ~/.bash_profile
  ```

- [Reference](https://golang.org/doc/install)

## Create a Go project

  ``` bash
  mkdir -p /opt/ws/go/src/blue/http
  cd /opt/ws/go/src/blue/http
  vim BlueHTTPServer.go
  ```

  ``` Go
  package main;

  import (
    "net/http"
  )

  func say(res http.ResponseWriter, req *http.Request) {
    res.Write([]byte("Hey Bruce!"));
  }

  func main(){
    http.HandleFunc("/say", say);
    http.Handle("/say2", http.HandlerFunc(say));
    http.ListenAndServe(":10001", nil);
    select{};
  }
  ```

## Build and run

  ``` bash
  go build BlueHTTPServer.go
  ./BlueHTTPServer
  ```

## Test

  ``` bash
  curl http://localhost:10001/say
  curl http://localhost:10001/say2

  # I can see output like this: Hey Bruce!
  ```
