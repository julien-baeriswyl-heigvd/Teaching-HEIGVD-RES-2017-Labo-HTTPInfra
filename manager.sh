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

f_docker_ip ()
{
    echo $(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1)
}

f_build ()
{
    local repo=$(dirname $(readlink -f $0))
    
    cd $repo/docker-images/apache-php-image
    docker build -t res/apache_php .
    
    cd $repo/docker-images/express-image
    docker build -t res/express_api .

    cd $repo/docker-images/reverse-proxy-image
    docker build -t res/apache_rp .
}

f_run_dynamic ()
{
    echo $(f_docker_ip $(docker run -d res/express_api)):3000
}

f_run_static ()
{
    echo $(f_docker_ip $(docker run -d res/apache_php)):80
}

f_start ()
{
    local dhost1
    local ghost2
    
    dhost1=$(repeat 5 f_run_static)
    dhost1=$(echo $dhost1 | tr ' ' ',')
    
    dhost2=$(repeat 5 f_run_dynamic)
    dhost2=$(echo $dhost2 | tr ' ' ',')
    
    docker run -d -e "STATIC_APP=$dhost1" -e "DYNAMIC_APP=$dhost2" -p 9090:80 res/apache_rp
}

f_stop ()
{
    foreach f_image_stop res/apache_php res/express_api res/apache_rp
}

f_get ()
{
    curl -s -D - "$1" -o /dev/null &
}

f_get2 ()
{
    curl -s -i $1 -b $2
}

f_test_lb_static ()
{
    local count=5
    
    for ((x=1; x <= count ; x++))
    do
        curl -c cookie.txt http://demo.res.ch:9090/ -o /dev/null
        cat cookie.txt
        repeat 5 f_get2 http://demo.res.ch:9090/ cookie.txt
    done
}

f_test_lb_dynamic ()
{
    local count=20
    for ((x=1; x <= count ; x++))
    do
        repeat 50 f_get http://demo.res.ch:9090/api/places/ &
        sleep 1
    done
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
    --test)
        f_test_lb_static
        f_test_lb_dynamic
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
