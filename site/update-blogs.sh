#!/bin/bash

# Author: Bruce Lu

# build..
hugo
rm -rf ../blog && cp -r ./public/blog ../

# publish..
cd .. && pwd &&  git add . && git commit -m "updating blogs.." && git push && cd -
