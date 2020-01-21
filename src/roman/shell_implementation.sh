#!/bin/sh

if [ -t 0 ]
then
	exit 1
fi

while IFS='$\n' read -r LINE; do
	echo "$LINE"
done

