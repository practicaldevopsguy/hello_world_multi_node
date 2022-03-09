#!/usr/bin/bash

# --------------------------
PROJECT=hello_world
# --------------------------

# check if the build process is locked, if not, lock it
[ -f "/work/build.lock" ] && echo "Build is running, exiting... " && exit 0
touch /work/build.lock

echo $(date +"%Y-%m-%d %T") - Build script started

# refresh source from git
[ ! -d "/work/$PROJECT" ] && cd /work && git clone ssh://cicd@192.168.1.104:/DATA/git/$PROJECT
[ -d "/work/$PROJECT" ] && cd /work/$PROJECT && git pull | grep -v "Already up to date"

# build if code is just cloned or updated
if [ $? -eq 0 ]
then
	echo $(date +"%Y-%m-%d %T") -- Start building
	cd /work
	docker build -t hello .


fi

echo $(date +"%Y-%m-%d %T") - DONE
echo

# remove lock, refresh build script
rm /work/build.lock
cp /work/$PROJECT/cicd_docker_image/build.sh /work/build.sh
