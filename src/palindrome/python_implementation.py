#!/usr/bin/env python3

import sys

def isPalindrome(line: str) -> bool:
    letters = []
    for letter in line.lower():
        if letter in [
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
            "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
        ]:
            letters.append(letter)
    return letters == letters[::-1] and len(letters) > 0

if __name__ == "__main__":
    for line in sys.stdin:
        if isPalindrome(line):
            print("true")
        else:
            print("false")

