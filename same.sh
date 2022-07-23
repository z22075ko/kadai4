#!/bin/sh

if [ $# -ne 2]; then	#引数の判定
	echo "input 2 argments" 1>&2
	exit 1
fi
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then
	echo "input natural number" 1>&2
	exit 1
fi

if [ $1 -eq $2 ]; then
	echo "$1 is equal to $2"
else
	echo "$1 is not equal to $2"
fi



