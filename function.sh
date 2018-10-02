#!/bin/sh
CreateName="2017/11/13"
MAINTAINER="Tony Hsu"
SET_PATH=$(pwd)
SET_DATE=`date +"%Y%m%d_%H%M"`
x=`ip addr |grep "inet " |grep "en"`
y=${x:0:25}
z=${y%/*}
GetIP=${z##* }



srv01=javapack



bulid_docker(){
    create_yml
    docker-compose -f docker-compose.yml up -d
}

kill_all(){
    stop_kill
    docker rm -f ${srv01}
    docker rmi ${srv01}-img:${SET_VER}
}

stop_kill(){
    docker rm -f ${srv01}
}

##############  Bulid RUN All #####################
all_run(){
	stop_kill
    bulid_docker
}
############## Bulid RUN All  END ############

monitor_run(){
	docker stats ${srv01}
}

create_yml(){
    echo "
version: '2'
services:
  ${srv01}:
    build: "${SET_PATH}"
    image: "${srv01}-img:${SET_VER}"
    container_name: ${srv01}
    networks:
        - lcs_vlan
    volumes:
        - "${SET_PATH}/project:/project"
        - "${SET_PATH}/code:/project/target"
        - "${SET_PATH}/data_m2:/root/.m2/"
#    restart: always
     
networks:
  lcs_vlan:

" > docker-compose.yml
}