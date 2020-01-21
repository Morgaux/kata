#!/bin/sh

if [ -t 0 ]
then
	exit 1
fi

while IFS='$\n' read -r LINE; do
	if echo "$LINE" | grep -Eq "[^0-9]"
	then
		exit 1
	fi

	echo "$(yes "I" | head -n "${LINE}" | tr '\n' ' ' | sed 's/ //g')"
done

