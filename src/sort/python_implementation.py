#!/usr/bin/env python3

import sys

numbers = []
words = []

for line in sys.stdin:
	line = line.strip()
	try:
		num = float(line)
		numbers.append(int(num) if num.is_integer() else num)
	except ValueError:
		words.append(line)

words.sort()
numbers.sort()

print("\n".join([str(item) for item in numbers + words]))

