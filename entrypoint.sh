#!/bin/sh

cd /usr/local/srs
if [ "$#" -eq 0 ]
then
    exec unbuffer ./objs/srs -c ./conf/docker.conf
else
    exec unbuffer ./objs/srs "$@"
fi
