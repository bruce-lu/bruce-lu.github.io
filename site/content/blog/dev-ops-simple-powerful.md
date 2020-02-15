---
title: "A very simple but powerful CI tool"
date: 2020-02-10T15:07:54+08:00
draft: false
images: []
---

## Goal

- Build a very simple & light weight but powerful tool to do CI for a project, no CI/CD tool like Jenkins required. Make sure my client always able to see the changes on UAT server

## Background

- I have a very tight schedule, yes 2 days, to build a web application. I'd like to show the progress to our client as frequently as possible, like every 5-10 minutes. To save our effort, I didn't install/configure any CI tool. Yes, the quickest way is to build a very simple but working one.

## App's Dockerfile

``` Bash

FROM node:latest
RUN echo "Asia/Shanghai" > /etc/timezone
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
EXPOSE 9090
ADD ./package.json /usr/src/app/package.json
RUN npm install
ADD ./web/package.json /usr/src/app/web/package.json
RUN cd /usr/src/app/web/ && npm install
ADD . /usr/src/app
RUN cd /usr/src/app/web/ && npm run build
CMD [ "node" "index.js"]

```

## The tool

``` Bash

#!/bin/bash
#
# ci-tool.sh // Suggest to put the script into Git project bin folder.
# A simple App CI tool
# Last update: 2/1/20
# @Author Bruce Lu

export TZ=Asia/Shanghai

WS=~/ws
APP=$WS/antivirus
#ACT_LOG=$WS/log/activities.log

cd $APP
#git_pull=$(git pull)

echo "`date` - Pulling code.."
if [ `git pull | tee -a | wc -l` -eq 1 ]; then
	# No code changes, exit..
	exit 0
fi

echo "`date` - Build and run new docker container.."

cur_container_id=`docker ps -q`
docker build -t antivirus . && docker stop $cur_container_id && docker rm $cur_container_id && docker run -itd --restart unless-stopped -p 9090:9090 -e TZ=Asia/Shanghai antivirus

#docker build -t antivirus . && docker stop `docker ps -q` && docker run -itd --rm -p 9090:9090 antivirus
# On live: docker run -itd --restart always -p 9090:9090 antivirus

echo "`date` - $?, container: `docker ps -q`"

echo "`date` - Cleaning up dangling images.."
docker rmi $(docker images -f "dangling=true" -q)

echo "`date` - Done"

cd -

exit 0
admin@~/ws/antivirus/bin$cat build-docker.sh
#!/bin/bash

cd .. && docker build -t antivirus .
cd -

```

## Make it a cron job on UAT server

``` Bash

# Every 10 minutes
*/10 * * * * /path/to/ci-tool.sh >> /path/to/log 2>&1

```

## Conclusion

- I just focus on coding and commit/push the code to Github, no worries about the UAT server because it'd be automatically built and deployed.
