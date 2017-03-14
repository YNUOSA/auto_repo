#FROM ubuntu:16.04
FROM python:2.7
#COPY ./sources.list.tuna /etc/apt/sources.list

RUN apt-get update
#RUN apt-get install -y apt-utils
RUN apt-get install -y rsync
COPY do_rsync.sh /do_rsync.sh
COPY main.py /main.py
#COPY rsync.sh /rsync.sh
COPY SUB_DIR /SUB_DIR
COPY LOG_FILE /LOG_FILE
COPY JSON_FILE /JSON_FILE
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN chmod a+x /do_rsync.sh
RUN mkdir -p /var/www/mirrors/
