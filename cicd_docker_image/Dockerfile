FROM python:3.10-slim-buster

# prepare OS
ENV DEBIAN_FRONTEND noninteractive

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl git

# prepare CICD account

RUN mkdir /root/.ssh && \
    chmod 0700 /root/.ssh

ADD id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan 192.168.1.104 >> /root/.ssh/known_hosts
RUN chmod 600 /root/.ssh/known_hosts

# TODO invalidate cache, build.sh???

# build
WORKDIR /work
ADD build.sh /work/build.sh
RUN chmod 755 /work/build.sh

ENTRYPOINT /bin/bash build.sh
#RUN /bin/bash build.sh <-- use this for terminal access

#RUN git clone ssh://cicd@192.168.1.104:/DATA/git/hello_world
#WORKDIR /work/hello_world
#RUN git pull






