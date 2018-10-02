#!/bin/sh

SET_PATH=$(pwd)

docker rmi  javapack-img:0.0.1
rm -rf ${SET_PATH}/project/target
docker build -t="javapack-img:0.0.1" .  
docker run --rm  --name javabulid -v ${SET_PATH}/project:/project javapack-img:0.0.1
