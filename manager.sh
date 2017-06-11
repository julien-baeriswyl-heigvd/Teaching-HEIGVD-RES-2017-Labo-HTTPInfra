#!/bin/bash

source lib.sh

f_build ()
{
    pwd=$PWD
    cd docker-images/apache-php-image
    docker build -t res/apache_php .
    cd $pwd
}

f_start ()
{
    docker run -d -p 9090:80 res/apache_php
}

f_stop ()
{
    docker kill $(docker ps -q --filter ancestor=res/apache_php)
    docker rm $(docker ps -a -q --filter ancestor=res/apache_php)
    docker rmi res/apache_php
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
        error 'invalid argument, type `'$0' --help` to see usages.'
        ;;
esac
