---
title: "Linux Shells"
date: 2019-07-03T21:38:59+08:00
draft: false
images: []
---

## for

  ```Bash
  for i in {1..10}; do echo $i;done
  ```

## if

  ```Bash
  # admin@~/ws/shell$cat weight-check.sh
  #!/bin/bash

  # Author: Bruce

  #if [ ! $# -eq 2 ]; then
  if [ $# -lt 2 ]; then
    echo "Not enough parameters. Usage: $0 weight-in-kilos lengh-in-centimeters"
    exit
  elif [ $# -gt 2 ]; then
    echo "Too many parameters. Usage: $0 weight-in-kilos lengh-in-centimeters"
    exit
  else
    # "" -> true; " " -> false
    if [ -z "$1" ]; then
      echo "1st parameter empty"
      exit
    fi
    if [ -n "$2" ]; then
      echo "2nd parameter not empty"
    fi

    echo -n "You entered: "
    for p in "$1" "$2";do
      echo -n "$p "
    done
    echo ""
  fi

  if [ -f lock ]; then
    echo "Already run"
  fi

  # Adding lock if not yet
  echo "lock" > lock

  weight="$1"
  height="$2"

  ideal=$[height - 110]

  if [ $weight -gt $ideal ]; then
    echo "Less yummy food please"
  elif [ $weight -eq $ideal ]; then
    echo "Goodness, you are perfect!"
  else
    echo "More food please"
  fi

  rm -f lock
  ```

## TODO
