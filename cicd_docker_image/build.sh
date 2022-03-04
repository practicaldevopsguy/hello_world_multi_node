#!/usr/bin/bash

echo $(date +"%Y-%m-%d %T") - Build script started


[ ! -d "/work/hello_world" ] && cd cd /work ; git clone ssh://cicd@192.168.1.104:/DATA/git/hello_world
[ -d "/work/hello_world" ] && cd /work/hello_world ; git pull


cp /work/hello_world/cicd_docker_image/build.sh /work/build.sh

echo $(date +"%Y-%m-%d %T") - DONE
echo
