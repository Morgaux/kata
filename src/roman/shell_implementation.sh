#!/bin/sh

while IFS='$\n' read -r LINE; do
	if echo "$LINE" | grep -Eq "[^0-9]"
	then
		echo "$LINE"
	else
		echo "$(yes "I" | head -n "${LINE}" | tr '\n' ' ' | sed 's/ //g')" | \
			sed '\
				s/IIIIIIIIII/X/g; \
				s/IIIIIIIII/IX/g; \
				s/IIIIIIII/IIX/g; \
				s/IIIIIII/VII/g;  \
				s/IIIIII/VI/g;    \
				s/IIIII/V/g;      \
				s/IIII/IV/g;      \
				s/XXXXXXXXXX/C/g; \
				s/XXXXXXXXX/XC/g; \
				s/XXXXXXXX/XXC/g; \
				s/XXXXXXX/LXX/g;  \
				s/XXXXXX/LX/g;    \
				s/XXXXX/L/g;      \
				s/XXXX/XL/g;      \
				s/CCCCCCCCCC/M/g; \
				s/CCCCCCCCC/CM/g; \
				s/CCCCCCCC/CCM/g; \
				s/CCCCCCC/DCC/g;  \
				s/CCCCCC/DC/g;    \
				s/CCCCC/D/g;      \
				s/CCCC/CD/g;      \
			' # end sed call
	fi
done

