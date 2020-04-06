#!/usr/bin/env python3

for i in range(1, 101, 1):
        if i % 3 == 0 and not i % 15 == 0:
            print("Fizz")
        elif i % 5 == 0 and not i % 15 == 0:
            print("Buzz")
        elif i % 15 == 0:
            print("FizzBuzz")
        else:
            print(i)
