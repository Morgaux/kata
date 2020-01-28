#!/usr/bin/env python3

import sys

numbers = []
words = []

for line in sys.stdin:
	line = line.strip()
	try:
		numbers.append(float(line))
	except ValueError:
		words.append(line)

words.sort()
numbers.sort()

print("\n".join([str(item) for item in words + numbers]))

