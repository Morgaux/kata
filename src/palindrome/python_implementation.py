#!/usr/bin/env python3

import sys

def isPalindrome(line: str) -> bool:
    return False

if __name__ == "__main__":
    for line in sys.stdin:
        if isPalindrome(line):
            print("true")
        else:
            print("false")

