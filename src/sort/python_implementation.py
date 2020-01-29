#!/usr/bin/env python3

import sys

def splitWordsAndInts(s):
	head = s.rstrip("0123456789")
	tail = s[len(head):]
	return head, int(tail) if len(tail) > 0 else -1

numbers = []
words = []

for line in sys.stdin:
	line = line.strip()
	try:
		num = float(line)
		numbers.append(int(num) if num.is_integer() else num)
	except ValueError:
		words.append(line)

# sort words
words = [
	pair[0] if pair[1] < 0
	else pair[0] + str(pair[1])
	for pair in
	sorted([
		splitWordsAndInts(word)
		for word in sorted(
			sorted(words),
			key=lambda s:s.lower()
		)
	], key=lambda s:s[1])
]

#sort numbers
numbers.sort()

# combine and print
print("\n".join([str(item) for item in numbers + words]))

