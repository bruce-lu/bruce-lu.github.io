---
title: "ssh tunnel & http proxy through socks"
date: 2019-10-15T22:10:34+08:00
draft: false
images: []
---

## ssh tunnel

- cmd
  ssh -C2qTnN -D 11111 -i ~/.ssh/ssh-rsa.ppk id@remote

``` Bash
    C: Requests compression of all data
    2: Forces ssh to try protocol version 2 only
    q: Quiet mode
    T: Disable pseudo-tty allocation
    n: Redirects stdin from /dev/null (actually, prevents reading from stdin)
    N: Do not execute a remote command (doesn't open the shell)
```

## curl through http proxy

- Using tunnel on terminal such as curl http/https

``` Bash
  admin@~$cat .httpproxy
  export http_proxy=socks5://127.0.0.1:11111
  export https_proxy=$http_proxy
```

## Chrome

- Start Chrome with proxy
  chrome --proxy-server="socks5://127.0.0.1:11111" --host-resolver-rules="MAP * 0.0.0.0 , EXCLUDE localhost"

## Firefox and Safari

- Similar to Chrome

## Enjoy
