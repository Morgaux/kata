#!/usr/bin/env python3

import sys

if sys.stdin.isatty():
	exit(1) # there's no input

def convert(number):
	if number.isdigit():
		number = int(number)
	else:
		return number

	result = []

	# thousands
	result.append("M" * ((number // 1000) % 10))

	result.append(["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "CCM", "CM"][(number //  100) % 10])
	result.append(["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "XXC", "XC"][(number //   10) % 10])
	result.append(["", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX"][(number //    1) % 10])

	return "".join(result)

for line in sys.stdin:
	print(convert(line.strip()))

