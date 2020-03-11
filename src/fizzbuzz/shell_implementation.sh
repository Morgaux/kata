#!/bin/sh

# generate numbers
awk 'BEGIN {for (j = 1; j <= 100; j++) print j " " j}' | \

	awk '{ if ($1 % 3 == 0) { print "Fizz " $2 } else { print $0 } }' | \

	awk '{ if ($2 % 5 == 0) { print $1 " Buzz" } else { print $0 } }' | \

	sed 's/^\([0-9]*\)[[:space:]][0-9]*$/\1/g' | \

	sed 's/[[:space:]][0-9]*//g' | \

	sed 's/^[0-9]*\(Buzz\)$/\1/g'
