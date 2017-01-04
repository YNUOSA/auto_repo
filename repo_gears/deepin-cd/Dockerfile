FROM ubuntu:16.04

COPY ./sources.list.tuna /etc/apt/sources.list

RUN apt-get update
#RUN apt-get install -y apt-utils
RUN apt-get install -y rsync
COPY do_rsync.sh /do_rsync.sh
RUN chmod a+x /do_rsync.sh
RUN mkdir -p /var/www/mirrors/
