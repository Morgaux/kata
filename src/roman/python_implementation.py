#!/usr/bin/env python3

import sys

def convert(number):
	if number.isdigit():
		number = int(number)
	else:
		return number

	return "".join([
		"M" * (number // 1000),
		["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "CCM", "CM"][(number //  100) % 10],
		["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "XXC", "XC"][(number //   10) % 10],
		["", "I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX"][(number //    1) % 10],
	])

for line in sys.stdin:
	print(convert(line.strip()))

