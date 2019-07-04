---
title: "Linux Cool Commands"
date: 2019-07-03T21:36:34+08:00
draft: false
images: []
---

## Editing

- vim

    ```Bash
    # Remove trailing spaces
    :%s/\s\+$//

    ```

- sed -r 's/\s+//g' afile
- sort afile|uniq
- sed

    ``` Bash
    # sed [options] 'row-range+action'  file
    # Actions: i, a, d, c, p, s
    # +g, +i

    # In place replacement, original copy with .bk suffix is created
    sed -i.bk  's/Z/1/g' afile

    # Remove lines from 3 to end
    sed '3,$d'

    # Print line 1 and line 2 only
    sed -n '1,2p' afile

    # Print lines match pattern
    sed -n '/A/p' afile

    ```

- awk

    ```Bash
    # awk 'pattern{action}' filenames
    last -n 5 | awk '{print $1}'

    cat /etc/passwd |awk  -F ':'  'BEGIN {print "name,shell"}  {print $1","$7} END {print "blue,/bin/nosh"}'

    awk -F: '/^root/{print $7}' /etc/passwd
    ```

- cut

    ```Bash
    # Print 1st field, each field separated by :
    cut -d: -f 1 /etc/passwd
    ```

## Searching

- find

    ```Bash
    find /etc -name passwd
    find . -name "*.txt" -exec echo {} \; -exec grep banana {} \;
    find ./ -type d |xargs ls -l

    # -I replace_str; -0 take cares of file names with blank space
    find . -name "*.bak" -print0 | xargs -0 -I {} mv {} ~/old.files
    # {} could be customized as whatever, like file in the example
    find /path/to/dir -iname "*.c" -print0 | xargs -0 -I file mv file ~/old.src
    ```

- ls

    ```Bash
    # List one column
    ls -1

    ```

## Logging

- dmesg // kernel message, equals to journalctl -k
- journalctl -a
- /var/log

## Resources

- ps -ef|grep java
- top
- vmstat
- sar

## Networking

- netstat -anp|grep 80
- lsof -i :80
- tcpdump

  ```Bash

  ```

## Storage

- lsblk
- fdisk -l
- iotop

## Kernel

## Performance

- time ls
- watch -n 2 free

