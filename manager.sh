#!/bin/bash

source lib.sh

f_image_stop ()
{
    docker kill $(docker ps -q --filter ancestor=$1)
    docker rm $(docker ps -a -q --filter ancestor=$1)
}

f_docker_net ()
{
    docker network create --subnet=172.18.0.0/16 resnet13
}

f_build ()
{
    local repo=$(dirname $(readlink -f $0))
    
    cd $repo/docker-images/apache-php-image
    docker build -t res/apache_php .
    
    cd $repo/docker-images/express-image
    docker build -t res/express_students .
    
    cd $repo/docker-images/reverse-proxy-image
    docker build -t res/apache_rp .
}

f_start ()
{
    docker run -d --net resnet13 --ip 172.18.0.2 res/apache_php
    docker run -d --net resnet13 --ip 172.18.0.3 res/express_students
    docker run -d --net resnet13 -p 9090:80 res/apache_rp
}

f_stop ()
{
    foreach f_image_stop res/apache_php res/express_students res/apache_rp
}

echo '#### RES-B : Lab - HTTPIntra ####'

case $1 in
    --net)
        f_docker_net
        ;;
    --start)
        f_build
        f_start
        ;;
    --stop)
        f_stop
        ;;
    --help)
        echo 'USAGE: '$0' [OPTION]'
        echo 'AVAILABLE OPTIONS:'
        echo '    --help  : display this help'
        echo '    --start : build & launch docker containers'
        echo '    --stop  : stop docker containers'
        ;;
    *)
        error 'invalid argument, type `'$0' --help` to see usages.'
        ;;
esac
