#!/usr/bin/env python3

import sys

if sys.stdin.isatty():
	exit(1) # there's no input

for line in sys.stdin:
	print(line, end="")

