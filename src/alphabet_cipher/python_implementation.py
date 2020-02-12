#!/usr/bin/env python3

import sys

def encode(key, msg):
    pass

def decode(key, msg):
    pass

def decipher(plain, crypt):
    pass

def usage():
    pass

for line in sys.stdin:
    line = line.strip()
    options = line.split()
    action = options[0]
    if action == "encode":
        encode("", "")
    elif action == "decode":
        decode("", "")
    elif action == "":
        decipher("", "")
    else:
        usage()
        exit(1)

