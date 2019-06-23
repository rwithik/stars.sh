#!/bin/env bash

usage(){
	printf "stars.sh: A shell scripts to print some stars to your terminal. Use with lolcat for maximum funkyness!\n"
	printf "Options:\n"
	printf "========\n"
	printf "	-h				: Display this help text.\n"
	printf "	-c ch			: Use [ch] instead of stars.\n"
	printf "	-d time			: Set the time delay between stars. Defaults to 0.2 seconds.\n"
	printf "	-n N			: Set the number of stars before clearing the screen.\n"
}

bye(){
	clear
	printf "Ctrl-C recieved. Bye...\n"
	tput cnorm
	exit 0
}

trap "bye" 2

rows=`tput lines`
cols=`tput cols`
delay=0.2
char='*'
number=100

while getopts "hc:n:d:" option
do
	case $option in
		h)
			usage
			exit 0
			;;
		c)
			char=$OPTARG
			;;
		n)
			number=$OPTARG
			;;
		d)
			delay=$OPTARG
			;;
		*)
			usage
			exit 0
			;;
	esac
done


clear
count=0

tput civis

while true
do
	row=$(( $RANDOM % rows ))
	col=$(( $RANDOM % cols ))
	printf "\033[${row};${col}H${char}"
	count=$(( $count + 1 ))
	sleep $delay
	if [[ $count -ge $number ]]
	then
		count=0
 		clear
	fi
done
