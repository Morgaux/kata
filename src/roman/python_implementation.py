#!/usr/bin/env python3

import sys

if sys.stdin.isatty():
	exit(1) # there's no input

def convert(number):
	return str(number)

for line in sys.stdin:
	print(convert(line), end="")

