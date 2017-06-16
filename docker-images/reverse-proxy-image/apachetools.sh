#!/bin/bash

foreach ()
{
	local func=$1
	shift
	
	for arg in "$@"
	do
		$func $arg
	done
}

foreach2 ()
{
	local func=$1
	shift
	
	while [ $# -gt 0 ]
	do
		$func $1 $#
		shift
	done
}

f_lb_file ()
{
    echo '/etc/apache2/balancer-'$1'.conf'
}

f_lb_add ()
{
    sed -e "s/<\/Proxy>/  BalancerMember http:\/\/$2\n<\/Proxy>/" $(f_lb_file $1) > $(f_lb_file $1).tmp;
    mv $(f_lb_file $1).tmp $(f_lb_file $1)
}

f_lb_add2 ()
{
    sed -e "s/<\/Proxy>/  BalancerMember http:\/\/$2 route=$3\n<\/Proxy>/" $(f_lb_file $1) > $(f_lb_file $1).tmp;
    mv $(f_lb_file $1).tmp $(f_lb_file $1)
}

f_lb_rm ()
{
    sed "/$2/d" $(f_lb_file $1) > $(f_lb_file $1).tmp;
    mv $(f_lb_file $1).tmp $(f_lb_file $1)
}

f_run_static ()
{
    f_lb_add2 static $1 $2
}

f_run_dynamic ()
{
    f_lb_add dynamic $1
}

f_stop_static ()
{
    f_lb_rm static $1
}

f_stop_dynamic ()
{
    f_lb_rm dynamic $1
}

case $1 in
    --add-stat)
        foreach2 f_run_static $(echo $2 | tr ',' ' ')
        ;;
    --add-dyn)
        foreach f_run_dynamic $(echo $2 | tr ',' ' ')
        ;;
    --rm-stat)
        foreach2 f_stop_static $(echo $2 | tr ',' ' ')
        ;;
    --rm-stat)
        foreach2 f_stop_dynamic $(echo $2 | tr ',' ' ')
        ;;
    --add-one-stat)
        f_run_static $2 $3
        ;;
esac
