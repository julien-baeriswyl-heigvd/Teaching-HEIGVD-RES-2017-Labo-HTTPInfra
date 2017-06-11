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

repeat ()
{
	local count=$1
	shift
	
	for ((x=1; x <= count ; x++))
	do
		$@
	done
}

tolower ()
{
	echo $1 | tr '[:upper:]' '[:lower:]'
}

toupper ()
{
	echo $1 | tr '[:lower:]' '[:upper:]'
}

read_condition ()
{
	local input
	while [ 1 ]
	do
		read input
		
		[ -z "$input" ] && continue
		
		input=$(tolower $input)
		if [ "$input" = "y" -o "$input" = "yes" ]; then
			return 0
		elif [ "$input" = "n" -o "$input" = "no" ]; then
			return 1
		fi
	done
}

ask_condition ()
{
	echo -n $1'(Yes/No): '
	read_condition
}

exit_error ()
{
	error_fatal $1
	exit_failure
}

f_ping ()
{
	ping -c 1 -W 1 $1 > /dev/null
}

f_poogle ()
{
	f_ping www.google.com
}
