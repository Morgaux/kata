#!/bin/sh

for i in $(awk 'BEGIN {for (j = 1; j <= 100; j++) print j}')
do
	echo "$i"
done

