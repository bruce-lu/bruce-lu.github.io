---
title: "Coding with Python"
date: 2019-07-04T15:37:13+08:00
draft: false
images: []
---

## yield

  ``` Python
  #!/usr/bin/env python

  # Author Bruce 12/14/17

  import sys

  def greppattern(pattern, fullfilename):
      with open(fullfilename) as handle:
          for line in handle:
              if pattern in line:
                  yield line.rstrip("\n")

  if __name__ == "__main__":
      # python blueutils.py "30 15" dbcontrace.log
      '''
      usage: 
      python blueutils.py "17-12" dbcontrace.log
      '''
      pattern, fullfilename = sys.argv[1], sys.argv[2]
      for line in greppattern(pattern, fullfilename):
          print(line)

  ```
