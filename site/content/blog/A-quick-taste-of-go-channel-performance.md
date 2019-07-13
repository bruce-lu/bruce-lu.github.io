---
title: "Goroutine & bufferred channel's quick performance taste: TPS from 28k to 16m"
date: 2019-07-13T21:44:34+08:00
draft: false
images: []
---

## Objective

  To get TPS (Transaction Per Second) as high as possible by using goroutine & bufferred channel (CSP pattern)

## Environment

- 2.3 GHz Intel Core i5; 8 GB 2133 MHz LPDDR3
- macOS Mojave 10.14.4
- Go 1.12.6

## Setup Go

If you are new to Golang, for Go's setup, please refer to my blog: Go - Build a web API

## Create a Go project

  ``` Bash
  mkdir -p ~/ws/golang/src/blue/demo
  cd ~/ws/golang/src/blue/demo
  vim demo.go
  ```

  ``` Go
  package main

  import (
    "fmt"
    "time"
  )

  var load = 100000

  // CSP Communicating Sequential Processes
  func consumer(data chan int, done chan bool) {
    for i := range data {
      fmt.Println("Consuming:", i)
    }

    done <- true
  }

  func producer(data chan int) {
    for i := 0; i < load; i++ {
      fmt.Println("Producing:", i)
      data <- i
    }
    close(data)
  }

  func demoChannelRoutine() {
    start := time.Now()
    data := make(chan int)
    done := make(chan bool, 1)

    go consumer(data, done)
    go producer(data)

    <-done

    elapsed := time.Since(start).Seconds()
    fmt.Printf("Elapsed: %.3fs\n", elapsed)
    tps := float64(load) / elapsed
    fmt.Printf("TPS: %.0f\n", tps)
  }
  ```

## 1st run, TPS 28k

  ``` Bash
  go build demo.go
  ./demo

  # Output
  ...
  Producing: 99998
  Producing: 99999
  Consuming: 99998
  Consuming: 99999
  Elapsed: 3.506s
  Transaction Per Second: 28521
  Cleaning up..
  ```

## Removing printing I/O and 2nd run, TPS boosts from 28k to 3m

  ``` Golang

  // Only changed part listed here
  var load = 100000

  func consumer(data chan int, done chan bool) {
    for i := range data {
      //fmt.Println("Consuming:", i)

      if i < 0 {
      }
    }

    done <- true
  }
  
  func producer(data chan int) {
    for i := 0; i < load; i++ {
      //fmt.Println("Producing:", i)
      data <- i
    }
    close(data)
  }

  ```

  ``` Bash
  go build demo.go
  ./demo

  # Output
  ...
  Elapsed: 0.027s
  Transaction Per Second: 3738271
  Cleaning up..
  ```

## Bufferred channel & 3rd run, TPS boosts from 3m to 16m

  ``` Golang
  // Only changed part listed here
  
  var load = 100000000
  var chBuf = 10000
  ...

  data := make(chan int, chBuf)

  ```

  ``` Bash
   go build demo.go
  ./demo

  # Output
  Elapsed: 6.047s
  Transaction Per Second: 16537191
  Cleaning up..
  ```

## Conclusion

This is a quick test of goroutine + bufferred channel. From introducing heavy I/O (printing) to only RAM I/O. I could boost 
TPS from 28k to 3m. By introducing bufferred channel, I boosted TPS from 3m to 16m.
