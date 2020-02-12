#!/usr/bin/env python3

import sys

letterMap = {
    "a" : { "a" : "a", "b" : "b", "c" : "c", "d" : "d", "e" : "e", "f" : "f", "g" : "g", "h" : "h", "i" : "i", "j" : "j", "k" : "k", "l" : "l", "m" : "m", "n" : "n", "o" : "o", "p" : "p", "q" : "q", "r" : "r", "s" : "s", "t" : "t", "u" : "u", "v" : "v", "w" : "w", "x" : "x", "y" : "y", "z" : "z" },
    "b" : { "b" : "a", "c" : "b", "d" : "c", "e" : "d", "f" : "e", "g" : "f", "h" : "g", "i" : "h", "j" : "i", "k" : "j", "l" : "k", "m" : "l", "n" : "m", "o" : "n", "p" : "o", "q" : "p", "r" : "q", "s" : "r", "t" : "s", "u" : "t", "v" : "u", "w" : "v", "x" : "w", "y" : "x", "z" : "y", "a" : "z" },
    "c" : { "c" : "a", "d" : "b", "e" : "c", "f" : "d", "g" : "e", "h" : "f", "i" : "g", "j" : "h", "k" : "i", "l" : "j", "m" : "k", "n" : "l", "o" : "m", "p" : "n", "q" : "o", "r" : "p", "s" : "q", "t" : "r", "u" : "s", "v" : "t", "w" : "u", "x" : "v", "y" : "w", "z" : "x", "a" : "y", "b" : "z" },
    "d" : { "d" : "a", "e" : "b", "f" : "c", "g" : "d", "h" : "e", "i" : "f", "j" : "g", "k" : "h", "l" : "i", "m" : "j", "n" : "k", "o" : "l", "p" : "m", "q" : "n", "r" : "o", "s" : "p", "t" : "q", "u" : "r", "v" : "s", "w" : "t", "x" : "u", "y" : "v", "z" : "w", "a" : "x", "b" : "y", "c" : "z" },
    "e" : { "e" : "a", "f" : "b", "g" : "c", "h" : "d", "i" : "e", "j" : "f", "k" : "g", "l" : "h", "m" : "i", "n" : "j", "o" : "k", "p" : "l", "q" : "m", "r" : "n", "s" : "o", "t" : "p", "u" : "q", "v" : "r", "w" : "s", "x" : "t", "y" : "u", "z" : "v", "a" : "w", "b" : "x", "c" : "y", "d" : "z" },
    "f" : { "f" : "a", "g" : "b", "h" : "c", "i" : "d", "j" : "e", "k" : "f", "l" : "g", "m" : "h", "n" : "i", "o" : "j", "p" : "k", "q" : "l", "r" : "m", "s" : "n", "t" : "o", "u" : "p", "v" : "q", "w" : "r", "x" : "s", "y" : "t", "z" : "u", "a" : "v", "b" : "w", "c" : "x", "d" : "y", "e" : "z" },
    "g" : { "g" : "a", "h" : "b", "i" : "c", "j" : "d", "k" : "e", "l" : "f", "m" : "g", "n" : "h", "o" : "i", "p" : "j", "q" : "k", "r" : "l", "s" : "m", "t" : "n", "u" : "o", "v" : "p", "w" : "q", "x" : "r", "y" : "s", "z" : "t", "a" : "u", "b" : "v", "c" : "w", "d" : "x", "e" : "y", "f" : "z" },
    "h" : { "h" : "a", "i" : "b", "j" : "c", "k" : "d", "l" : "e", "m" : "f", "n" : "g", "o" : "h", "p" : "i", "q" : "j", "r" : "k", "s" : "l", "t" : "m", "u" : "n", "v" : "o", "w" : "p", "x" : "q", "y" : "r", "z" : "s", "a" : "t", "b" : "u", "c" : "v", "d" : "w", "e" : "x", "f" : "y", "g" : "z" },
    "i" : { "i" : "a", "j" : "b", "k" : "c", "l" : "d", "m" : "e", "n" : "f", "o" : "g", "p" : "h", "q" : "i", "r" : "j", "s" : "k", "t" : "l", "u" : "m", "v" : "n", "w" : "o", "x" : "p", "y" : "q", "z" : "r", "a" : "s", "b" : "t", "c" : "u", "d" : "v", "e" : "w", "f" : "x", "g" : "y", "h" : "z" },
    "j" : { "j" : "a", "k" : "b", "l" : "c", "m" : "d", "n" : "e", "o" : "f", "p" : "g", "q" : "h", "r" : "i", "s" : "j", "t" : "k", "u" : "l", "v" : "m", "w" : "n", "x" : "o", "y" : "p", "z" : "q", "a" : "r", "b" : "s", "c" : "t", "d" : "u", "e" : "v", "f" : "w", "g" : "x", "h" : "y", "i" : "z" },
    "k" : { "k" : "a", "l" : "b", "m" : "c", "n" : "d", "o" : "e", "p" : "f", "q" : "g", "r" : "h", "s" : "i", "t" : "j", "u" : "k", "v" : "l", "w" : "m", "x" : "n", "y" : "o", "z" : "p", "a" : "q", "b" : "r", "c" : "s", "d" : "t", "e" : "u", "f" : "v", "g" : "w", "h" : "x", "i" : "y", "j" : "z" },
    "l" : { "l" : "a", "m" : "b", "n" : "c", "o" : "d", "p" : "e", "q" : "f", "r" : "g", "s" : "h", "t" : "i", "u" : "j", "v" : "k", "w" : "l", "x" : "m", "y" : "n", "z" : "o", "a" : "p", "b" : "q", "c" : "r", "d" : "s", "e" : "t", "f" : "u", "g" : "v", "h" : "w", "i" : "x", "j" : "y", "k" : "z" },
    "m" : { "m" : "a", "n" : "b", "o" : "c", "p" : "d", "q" : "e", "r" : "f", "s" : "g", "t" : "h", "u" : "i", "v" : "j", "w" : "k", "x" : "l", "y" : "m", "z" : "n", "a" : "o", "b" : "p", "c" : "q", "d" : "r", "e" : "s", "f" : "t", "g" : "u", "h" : "v", "i" : "w", "j" : "x", "k" : "y", "l" : "z" },
    "n" : { "n" : "a", "o" : "b", "p" : "c", "q" : "d", "r" : "e", "s" : "f", "t" : "g", "u" : "h", "v" : "i", "w" : "j", "x" : "k", "y" : "l", "z" : "m", "a" : "n", "b" : "o", "c" : "p", "d" : "q", "e" : "r", "f" : "s", "g" : "t", "h" : "u", "i" : "v", "j" : "w", "k" : "x", "l" : "y", "m" : "z" },
    "o" : { "o" : "a", "p" : "b", "q" : "c", "r" : "d", "s" : "e", "t" : "f", "u" : "g", "v" : "h", "w" : "i", "x" : "j", "y" : "k", "z" : "l", "a" : "m", "b" : "n", "c" : "o", "d" : "p", "e" : "q", "f" : "r", "g" : "s", "h" : "t", "i" : "u", "j" : "v", "k" : "w", "l" : "x", "m" : "y", "n" : "z" },
    "p" : { "p" : "a", "q" : "b", "r" : "c", "s" : "d", "t" : "e", "u" : "f", "v" : "g", "w" : "h", "x" : "i", "y" : "j", "z" : "k", "a" : "l", "b" : "m", "c" : "n", "d" : "o", "e" : "p", "f" : "q", "g" : "r", "h" : "s", "i" : "t", "j" : "u", "k" : "v", "l" : "w", "m" : "x", "n" : "y", "o" : "z" },
    "q" : { "q" : "a", "r" : "b", "s" : "c", "t" : "d", "u" : "e", "v" : "f", "w" : "g", "x" : "h", "y" : "i", "z" : "j", "a" : "k", "b" : "l", "c" : "m", "d" : "n", "e" : "o", "f" : "p", "g" : "q", "h" : "r", "i" : "s", "j" : "t", "k" : "u", "l" : "v", "m" : "w", "n" : "x", "o" : "y", "p" : "z" },
    "r" : { "r" : "a", "s" : "b", "t" : "c", "u" : "d", "v" : "e", "w" : "f", "x" : "g", "y" : "h", "z" : "i", "a" : "j", "b" : "k", "c" : "l", "d" : "m", "e" : "n", "f" : "o", "g" : "p", "h" : "q", "i" : "r", "j" : "s", "k" : "t", "l" : "u", "m" : "v", "n" : "w", "o" : "x", "p" : "y", "q" : "z" },
    "s" : { "s" : "a", "t" : "b", "u" : "c", "v" : "d", "w" : "e", "x" : "f", "y" : "g", "z" : "h", "a" : "i", "b" : "j", "c" : "k", "d" : "l", "e" : "m", "f" : "n", "g" : "o", "h" : "p", "i" : "q", "j" : "r", "k" : "s", "l" : "t", "m" : "u", "n" : "v", "o" : "w", "p" : "x", "q" : "y", "r" : "z" },
    "t" : { "t" : "a", "u" : "b", "v" : "c", "w" : "d", "x" : "e", "y" : "f", "z" : "g", "a" : "h", "b" : "i", "c" : "j", "d" : "k", "e" : "l", "f" : "m", "g" : "n", "h" : "o", "i" : "p", "j" : "q", "k" : "r", "l" : "s", "m" : "t", "n" : "u", "o" : "v", "p" : "w", "q" : "x", "r" : "y", "s" : "z" },
    "u" : { "u" : "a", "v" : "b", "w" : "c", "x" : "d", "y" : "e", "z" : "f", "a" : "g", "b" : "h", "c" : "i", "d" : "j", "e" : "k", "f" : "l", "g" : "m", "h" : "n", "i" : "o", "j" : "p", "k" : "q", "l" : "r", "m" : "s", "n" : "t", "o" : "u", "p" : "v", "q" : "w", "r" : "x", "s" : "y", "t" : "z" },
    "v" : { "v" : "a", "w" : "b", "x" : "c", "y" : "d", "z" : "e", "a" : "f", "b" : "g", "c" : "h", "d" : "i", "e" : "j", "f" : "k", "g" : "l", "h" : "m", "i" : "n", "j" : "o", "k" : "p", "l" : "q", "m" : "r", "n" : "s", "o" : "t", "p" : "u", "q" : "v", "r" : "w", "s" : "x", "t" : "y", "u" : "z" },
    "w" : { "w" : "a", "x" : "b", "y" : "c", "z" : "d", "a" : "e", "b" : "f", "c" : "g", "d" : "h", "e" : "i", "f" : "j", "g" : "k", "h" : "l", "i" : "m", "j" : "n", "k" : "o", "l" : "p", "m" : "q", "n" : "r", "o" : "s", "p" : "t", "q" : "u", "r" : "v", "s" : "w", "t" : "x", "u" : "y", "v" : "z" },
    "x" : { "x" : "a", "y" : "b", "z" : "c", "a" : "d", "b" : "e", "c" : "f", "d" : "g", "e" : "h", "f" : "i", "g" : "j", "h" : "k", "i" : "l", "j" : "m", "k" : "n", "l" : "o", "m" : "p", "n" : "q", "o" : "r", "p" : "s", "q" : "t", "r" : "u", "s" : "v", "t" : "w", "u" : "x", "v" : "y", "w" : "z" },
    "y" : { "y" : "a", "z" : "b", "a" : "c", "b" : "d", "c" : "e", "d" : "f", "e" : "g", "f" : "h", "g" : "i", "h" : "j", "i" : "k", "j" : "l", "k" : "m", "l" : "n", "m" : "o", "n" : "p", "o" : "q", "p" : "r", "q" : "s", "r" : "t", "s" : "u", "t" : "v", "u" : "w", "v" : "x", "w" : "y", "x" : "z" },
    "z" : { "z" : "a", "a" : "b", "b" : "c", "c" : "d", "d" : "e", "e" : "f", "f" : "g", "g" : "h", "h" : "i", "i" : "j", "j" : "k", "k" : "l", "l" : "m", "m" : "n", "n" : "o", "o" : "p", "p" : "q", "q" : "r", "r" : "s", "s" : "t", "t" : "u", "u" : "v", "v" : "w", "w" : "x", "x" : "y", "y" : "z" }
}

def encode(key, msg):
    print()

def decode(key, msg):
    print()

def decipher(plain, cipher):
    print()

def usage():
    print()

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

