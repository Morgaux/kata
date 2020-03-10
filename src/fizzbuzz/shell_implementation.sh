#!/bin/sh

# generate numbers
awk 'BEGIN {for (j = 1; j <= 100; j++) print j}' | \
	# add unary count at the end of the line
	while IFS='$\n' read -r LINE; do
		echo "${LINE}$(yes "_" | head -n "${LINE}" | tr '\n' ' ' | sed 's/ //g')"
	done | \

	# add buzz after all multiples of 5
	sed 's/^\([0-9]*[50]\)/\1Buzz/g' | \

	# sum up all digits
	sed 's/0//g' | \
	sed ':x ; s/^\([1-9]*\)11/\12/g ; s/^\([1-9]*\)12/\13/g ; s/^\([1-9]*\)13/\14/g ; s/^\([1-9]*\)14/\15/g ; s/^\([1-9]*\)15/\16/g ; s/^\([1-9]*\)16/\17/g ; s/^\([1-9]*\)17/\18/g ; s/^\([1-9]*\)18/\19/g ; s/^\([1-9]*\)19/\11/g ; tx' | \
	sed ':x ; s/^\([1-9]*\)21/\13/g ; s/^\([1-9]*\)22/\14/g ; s/^\([1-9]*\)23/\15/g ; s/^\([1-9]*\)24/\16/g ; s/^\([1-9]*\)25/\17/g ; s/^\([1-9]*\)26/\18/g ; s/^\([1-9]*\)27/\19/g ; s/^\([1-9]*\)28/\11/g ; s/^\([1-9]*\)29/\11/g ; tx' | \
	sed ':x ; s/^\([1-9]*\)31/\14/g ; s/^\([1-9]*\)32/\15/g ; s/^\([1-9]*\)33/\16/g ; s/^\([1-9]*\)34/\17/g ; s/^\([1-9]*\)35/\18/g ; s/^\([1-9]*\)36/\19/g ; s/^\([1-9]*\)37/\11/g ; s/^\([1-9]*\)38/\11/g ; s/^\([1-9]*\)39/\12/g ; tx' | \
	sed ':x ; s/^\([1-9]*\)41/\15/g ; s/^\([1-9]*\)42/\16/g ; s/^\([1-9]*\)43/\17/g ; s/^\([1-9]*\)44/\18/g ; s/^\([1-9]*\)45/\19/g ; s/^\([1-9]*\)46/\11/g ; s/^\([1-9]*\)47/\11/g ; s/^\([1-9]*\)48/\12/g ; s/^\([1-9]*\)49/\13/g ; tx' | \
	sed ':x ; s/^\([1-9]*\)51/\16/g ; s/^\([1-9]*\)52/\17/g ; s/^\([1-9]*\)53/\18/g ; s/^\([1-9]*\)54/\19/g ; s/^\([1-9]*\)55/\11/g ; s/^\([1-9]*\)56/\11/g ; s/^\([1-9]*\)57/\12/g ; s/^\([1-9]*\)58/\13/g ; s/^\([1-9]*\)59/\14/g ; tx' | \
	sed ':x ; s/^\([1-9]*\)61/\17/g ; s/^\([1-9]*\)62/\18/g ; s/^\([1-9]*\)63/\19/g ; s/^\([1-9]*\)64/\11/g ; s/^\([1-9]*\)65/\11/g ; s/^\([1-9]*\)66/\12/g ; s/^\([1-9]*\)67/\13/g ; s/^\([1-9]*\)68/\14/g ; s/^\([1-9]*\)69/\15/g ; tx' | \
	sed ':x ; s/^\([1-9]*\)71/\18/g ; s/^\([1-9]*\)72/\19/g ; s/^\([1-9]*\)73/\11/g ; s/^\([1-9]*\)74/\11/g ; s/^\([1-9]*\)75/\12/g ; s/^\([1-9]*\)76/\13/g ; s/^\([1-9]*\)77/\14/g ; s/^\([1-9]*\)78/\15/g ; s/^\([1-9]*\)79/\16/g ; tx' | \
	sed ':x ; s/^\([1-9]*\)81/\19/g ; s/^\([1-9]*\)82/\11/g ; s/^\([1-9]*\)83/\11/g ; s/^\([1-9]*\)84/\12/g ; s/^\([1-9]*\)85/\13/g ; s/^\([1-9]*\)86/\14/g ; s/^\([1-9]*\)87/\15/g ; s/^\([1-9]*\)88/\16/g ; s/^\([1-9]*\)89/\17/g ; tx' | \
	sed ':x ; s/^\([1-9]*\)91/\11/g ; s/^\([1-9]*\)92/\11/g ; s/^\([1-9]*\)93/\12/g ; s/^\([1-9]*\)94/\13/g ; s/^\([1-9]*\)95/\14/g ; s/^\([1-9]*\)96/\15/g ; s/^\([1-9]*\)97/\16/g ; s/^\([1-9]*\)98/\17/g ; s/^\([1-9]*\)99/\18/g ; tx' | \

	# replace multiples of 3 with fizz
	sed 's/^[369]/Fizz/g' | \

	# strip underscores from fizzes and buzzes
	sed 's/\(Fizz\|Buzz\)_*/\1/g' | \

	# strip remaining numbers
	sed 's/[0-9]//g'

