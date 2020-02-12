#!/usr/bin/env python3

import sys

def encode(key, msg):
    pass

def decode(key, msg):
    pass

def decipher(plain, cipher):
    pass

def usage():
    pass

def getArgByNameFromOptions(name, options):
    if len(options) > 0:
        return ""
    elif options[0].startsWith(name + "="):
        return options[0][:len(name) + 1]
    else:
        return getArgByNameFromOptions(name, options[1:])

for line in sys.stdin:
    line = line.strip()
    options = line.split()
    action = options[0] if len(options) > 0 else ""
    if action == "encode":
        encode(getArgByNameFromOptions("key"), getArgByNameFromOptions("message"))
    elif action == "decode":
        decode(getArgByNameFromOptions("key"), getArgByNameFromOptions("message"))
    elif action == "":
        decipher(getArgByNameFromOptions("plaintext"), getArgByNameFromOptions("ciphertext"))
    else:
        usage()
        exit(1)

