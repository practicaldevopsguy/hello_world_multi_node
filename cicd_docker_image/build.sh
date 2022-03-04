#!/usr/bin/bash

date +"%Y-%m-%d %T"
echo Build script started


cd /work

git clone ssh://cicd@192.168.1.104:/DATA/git/hello_world

