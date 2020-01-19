#!/usr/bin/env python3

def fizzes (n)            : return "Fizz" if n % 3 == 0 else ""
def buzzes (n)            : return "Buzz" if n % 5 == 0 else ""
def fizzes_and_buzzes (n) : return fizzes(n) + buzzes(n)
def fizzbuzz (n)          : return [ max(str(i), fizzes_and_buzzes(i)) for i in range(1, n + 1) ]

for i in fizzbuzz(100):
	print(i)

