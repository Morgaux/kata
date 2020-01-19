#!/bin/sh

for i in $(awk 'BEGIN {for (j = 1; j <= 100; j++) print j}')
do
	if   [ "$(($i%15))" -eq 0 ]
	then
		echo "FizzBuzz"
	elif [ "$(($i%5))" -eq 0 ]
	then
		echo "Buzz"
	elif [ "$(($i%3))" -eq 0 ]
	then
		echo "Fizz"
	else
		echo "$i"
	fi
done

