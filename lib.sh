#!/bin/bash

################################################################################
# ----------------------- Shell tools to handle errors ----------------------- #
################################################################################
#                                                                              #
# @author    : Julien Baeriswyl                                                #
# @since     : 2017-04-22                                                      #
# @version   : 0.1                                                             #
# @date      : 2017-04-22                                                      #
#                                                                              #
################################################################################

error ()
{
	echo -e "ERROR: $1"
}

error_fatal ()
{
	echo -e "FATAL ERROR: $1"
}

exit_success ()
{
	exit 0
}

exit_failure ()
{
	exit 1
}

assert ()
{
	if ! [ $1 $2 $3 ]; then
		echo -e "ASSERT: $1 $2 $3$4"
		exit_failure
	fi
}

foreach ()
{
	local func=$1
	shift
	
	for arg in "$@"
	do
		$func $arg
	done
}

exit_error ()
{
	error_fatal $1
	exit_failure
}

f_ping ()
{
	ping -c 1 -W 1 $1 > /dev/null && return 0
	return 1
}

f_poogle ()
{
	f_ping www.google.com && return 0
	return 1
}
