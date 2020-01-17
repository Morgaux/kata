#!/usr/bin/env python3

def fizzes (n)            : return [ "Fizz" if i % 3 == 0 else "" for i in range(n) ]
def buzzes (n)            : return [ "Buzz" if i % 5 == 0 else "" for i in range(n) ]
def fizzes_and_buzzes (n) : return list(map(lambda f, b : f + b, fizzes(n), buzzes(n)))
def fizzbuzz (n)          : return [ i if fizzes_and_buzzes(n + 1)[i] == "" else fizzes_and_buzzes(n + 1)[i] for i in range(1, n + 1) ]

for i in fizzbuzz(100):
	print(i)

