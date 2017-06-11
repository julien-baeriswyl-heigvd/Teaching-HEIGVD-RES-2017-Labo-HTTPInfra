#!/bin/bash

source lib.sh

f_image_stop ()
{
    docker kill $(docker ps -q --filter ancestor=$1)
    docker rm $(docker ps -a -q --filter ancestor=$1)
    docker rmi $1
}

f_build ()
{
    local repo=$(dirname $(readlink -f $0))
    
    cd $repo/docker-images/apache-php-image
    docker build -t res/apache_php .
    
    cd $repo/docker-images/express-image
    docker build -t res/express_api .
}

f_start ()
{
    docker run -d -p 9090:80   res/apache_php
    docker run -d -p 9091:3000 res/express_api
}

f_stop ()
{
    foreach f_image_stop res/apache_php res/express_api
}

echo '#### RES-B : Lab - HTTPIntra ####'

case $1 in
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
        foreach echo pizza kebab burrito tacos
        error 'invalid argument, type `'$0' --help` to see usages.'
        ;;
esac
