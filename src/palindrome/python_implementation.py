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

    for i in range(len(letters)):
        if (all([letters[i] == letters[-1-i] for i in range(len(letters))])):
            return True

    return False

if __name__ == "__main__":
    for line in sys.stdin:
        print("true" if isPalindrome(line) else "false")

