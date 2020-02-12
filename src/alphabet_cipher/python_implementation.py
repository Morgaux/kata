#!/usr/bin/env python3

import sys

letterMap = {
    "a" : { "a" : "a", "b" : "b", "c" : "c", "d" : "d", "e" : "e", "f" : "f", "g" : "g", "h" : "h", "i" : "i", "j" : "j", "k" : "k", "l" : "l", "m" : "m", "n" : "n", "o" : "o", "p" : "p", "q" : "q", "r" : "r", "s" : "s", "t" : "t", "u" : "u", "v" : "v", "w" : "w", "x" : "x", "y" : "y", "z" : "z" },
    "b" : { "a" : "b", "b" : "c", "c" : "d", "d" : "e", "e" : "f", "f" : "g", "g" : "h", "h" : "i", "i" : "j", "j" : "k", "k" : "l", "l" : "m", "m" : "n", "n" : "o", "o" : "p", "p" : "q", "q" : "r", "r" : "s", "s" : "t", "t" : "u", "u" : "v", "v" : "w", "w" : "x", "x" : "y", "y" : "z", "z" : "a" },
    "c" : { "a" : "c", "b" : "d", "c" : "e", "d" : "f", "e" : "g", "f" : "h", "g" : "i", "h" : "j", "i" : "k", "j" : "l", "k" : "m", "l" : "n", "m" : "o", "n" : "p", "o" : "q", "p" : "r", "q" : "s", "r" : "t", "s" : "u", "t" : "v", "u" : "w", "v" : "x", "w" : "y", "x" : "z", "y" : "a", "z" : "b" },
    "d" : { "a" : "d", "b" : "e", "c" : "f", "d" : "g", "e" : "h", "f" : "i", "g" : "j", "h" : "k", "i" : "l", "j" : "m", "k" : "n", "l" : "o", "m" : "p", "n" : "q", "o" : "r", "p" : "s", "q" : "t", "r" : "u", "s" : "v", "t" : "w", "u" : "x", "v" : "y", "w" : "z", "x" : "a", "y" : "b", "z" : "c" },
    "e" : { "a" : "e", "b" : "f", "c" : "g", "d" : "h", "e" : "i", "f" : "j", "g" : "k", "h" : "l", "i" : "m", "j" : "n", "k" : "o", "l" : "p", "m" : "q", "n" : "r", "o" : "s", "p" : "t", "q" : "u", "r" : "v", "s" : "w", "t" : "x", "u" : "y", "v" : "z", "w" : "a", "x" : "b", "y" : "c", "z" : "d" },
    "f" : { "a" : "f", "b" : "g", "c" : "h", "d" : "i", "e" : "j", "f" : "k", "g" : "l", "h" : "m", "i" : "n", "j" : "o", "k" : "p", "l" : "q", "m" : "r", "n" : "s", "o" : "t", "p" : "u", "q" : "v", "r" : "w", "s" : "x", "t" : "y", "u" : "z", "v" : "a", "w" : "b", "x" : "c", "y" : "d", "z" : "e" },
    "g" : { "a" : "g", "b" : "h", "c" : "i", "d" : "j", "e" : "k", "f" : "l", "g" : "m", "h" : "n", "i" : "o", "j" : "p", "k" : "q", "l" : "r", "m" : "s", "n" : "t", "o" : "u", "p" : "v", "q" : "w", "r" : "x", "s" : "y", "t" : "z", "u" : "a", "v" : "b", "w" : "c", "x" : "d", "y" : "e", "z" : "f" },
    "h" : { "a" : "h", "b" : "i", "c" : "j", "d" : "k", "e" : "l", "f" : "m", "g" : "n", "h" : "o", "i" : "p", "j" : "q", "k" : "r", "l" : "s", "m" : "t", "n" : "u", "o" : "v", "p" : "w", "q" : "x", "r" : "y", "s" : "z", "t" : "a", "u" : "b", "v" : "c", "w" : "d", "x" : "e", "y" : "f", "z" : "g" },
    "i" : { "a" : "i", "b" : "j", "c" : "k", "d" : "l", "e" : "m", "f" : "n", "g" : "o", "h" : "p", "i" : "q", "j" : "r", "k" : "s", "l" : "t", "m" : "u", "n" : "v", "o" : "w", "p" : "x", "q" : "y", "r" : "z", "s" : "a", "t" : "b", "u" : "c", "v" : "d", "w" : "e", "x" : "f", "y" : "g", "z" : "h" },
    "j" : { "a" : "j", "b" : "k", "c" : "l", "d" : "m", "e" : "n", "f" : "o", "g" : "p", "h" : "q", "i" : "r", "j" : "s", "k" : "t", "l" : "u", "m" : "v", "n" : "w", "o" : "x", "p" : "y", "q" : "z", "r" : "a", "s" : "b", "t" : "c", "u" : "d", "v" : "e", "w" : "f", "x" : "g", "y" : "h", "z" : "i" },
    "k" : { "a" : "k", "b" : "l", "c" : "m", "d" : "n", "e" : "o", "f" : "p", "g" : "q", "h" : "r", "i" : "s", "j" : "t", "k" : "u", "l" : "v", "m" : "w", "n" : "x", "o" : "y", "p" : "z", "q" : "a", "r" : "b", "s" : "c", "t" : "d", "u" : "e", "v" : "f", "w" : "g", "x" : "h", "y" : "i", "z" : "j" },
    "l" : { "a" : "l", "b" : "m", "c" : "n", "d" : "o", "e" : "p", "f" : "q", "g" : "r", "h" : "s", "i" : "t", "j" : "u", "k" : "v", "l" : "w", "m" : "x", "n" : "y", "o" : "z", "p" : "a", "q" : "b", "r" : "c", "s" : "d", "t" : "e", "u" : "f", "v" : "g", "w" : "h", "x" : "i", "y" : "j", "z" : "k" },
    "m" : { "a" : "m", "b" : "n", "c" : "o", "d" : "p", "e" : "q", "f" : "r", "g" : "s", "h" : "t", "i" : "u", "j" : "v", "k" : "w", "l" : "x", "m" : "y", "n" : "z", "o" : "a", "p" : "b", "q" : "c", "r" : "d", "s" : "e", "t" : "f", "u" : "g", "v" : "h", "w" : "i", "x" : "j", "y" : "k", "z" : "l" },
    "n" : { "a" : "n", "b" : "o", "c" : "p", "d" : "q", "e" : "r", "f" : "s", "g" : "t", "h" : "u", "i" : "v", "j" : "w", "k" : "x", "l" : "y", "m" : "z", "n" : "a", "o" : "b", "p" : "c", "q" : "d", "r" : "e", "s" : "f", "t" : "g", "u" : "h", "v" : "i", "w" : "j", "x" : "k", "y" : "l", "z" : "m" },
    "o" : { "a" : "o", "b" : "p", "c" : "q", "d" : "r", "e" : "s", "f" : "t", "g" : "u", "h" : "v", "i" : "w", "j" : "x", "k" : "y", "l" : "z", "m" : "a", "n" : "b", "o" : "c", "p" : "d", "q" : "e", "r" : "f", "s" : "g", "t" : "h", "u" : "i", "v" : "j", "w" : "k", "x" : "l", "y" : "m", "z" : "n" },
    "p" : { "a" : "p", "b" : "q", "c" : "r", "d" : "s", "e" : "t", "f" : "u", "g" : "v", "h" : "w", "i" : "x", "j" : "y", "k" : "z", "l" : "a", "m" : "b", "n" : "c", "o" : "d", "p" : "e", "q" : "f", "r" : "g", "s" : "h", "t" : "i", "u" : "j", "v" : "k", "w" : "l", "x" : "m", "y" : "n", "z" : "o" },
    "q" : { "a" : "q", "b" : "r", "c" : "s", "d" : "t", "e" : "u", "f" : "v", "g" : "w", "h" : "x", "i" : "y", "j" : "z", "k" : "a", "l" : "b", "m" : "c", "n" : "d", "o" : "e", "p" : "f", "q" : "g", "r" : "h", "s" : "i", "t" : "j", "u" : "k", "v" : "l", "w" : "m", "x" : "n", "y" : "o", "z" : "p" },
    "r" : { "a" : "r", "b" : "s", "c" : "t", "d" : "u", "e" : "v", "f" : "w", "g" : "x", "h" : "y", "i" : "z", "j" : "a", "k" : "b", "l" : "c", "m" : "d", "n" : "e", "o" : "f", "p" : "g", "q" : "h", "r" : "i", "s" : "j", "t" : "k", "u" : "l", "v" : "m", "w" : "n", "x" : "o", "y" : "p", "z" : "q" },
    "s" : { "a" : "s", "b" : "t", "c" : "u", "d" : "v", "e" : "w", "f" : "x", "g" : "y", "h" : "z", "i" : "a", "j" : "b", "k" : "c", "l" : "d", "m" : "e", "n" : "f", "o" : "g", "p" : "h", "q" : "i", "r" : "j", "s" : "k", "t" : "l", "u" : "m", "v" : "n", "w" : "o", "x" : "p", "y" : "q", "z" : "r" },
    "t" : { "a" : "t", "b" : "u", "c" : "v", "d" : "w", "e" : "x", "f" : "y", "g" : "z", "h" : "a", "i" : "b", "j" : "c", "k" : "d", "l" : "e", "m" : "f", "n" : "g", "o" : "h", "p" : "i", "q" : "j", "r" : "k", "s" : "l", "t" : "m", "u" : "n", "v" : "o", "w" : "p", "x" : "q", "y" : "r", "z" : "s" },
    "u" : { "a" : "u", "b" : "v", "c" : "w", "d" : "x", "e" : "y", "f" : "z", "g" : "a", "h" : "b", "i" : "c", "j" : "d", "k" : "e", "l" : "f", "m" : "g", "n" : "h", "o" : "i", "p" : "j", "q" : "k", "r" : "l", "s" : "m", "t" : "n", "u" : "o", "v" : "p", "w" : "q", "x" : "r", "y" : "s", "z" : "t" },
    "v" : { "a" : "v", "b" : "w", "c" : "x", "d" : "y", "e" : "z", "f" : "a", "g" : "b", "h" : "c", "i" : "d", "j" : "e", "k" : "f", "l" : "g", "m" : "h", "n" : "i", "o" : "j", "p" : "k", "q" : "l", "r" : "m", "s" : "n", "t" : "o", "u" : "p", "v" : "q", "w" : "r", "x" : "s", "y" : "t", "z" : "u" },
    "w" : { "a" : "w", "b" : "x", "c" : "y", "d" : "z", "e" : "a", "f" : "b", "g" : "c", "h" : "d", "i" : "e", "j" : "f", "k" : "g", "l" : "h", "m" : "i", "n" : "j", "o" : "k", "p" : "l", "q" : "m", "r" : "n", "s" : "o", "t" : "p", "u" : "q", "v" : "r", "w" : "s", "x" : "t", "y" : "u", "z" : "v" },
    "x" : { "a" : "x", "b" : "y", "c" : "z", "d" : "a", "e" : "b", "f" : "c", "g" : "d", "h" : "e", "i" : "f", "j" : "g", "k" : "h", "l" : "i", "m" : "j", "n" : "k", "o" : "l", "p" : "m", "q" : "n", "r" : "o", "s" : "p", "t" : "q", "u" : "r", "v" : "s", "w" : "t", "x" : "u", "y" : "v", "z" : "w" },
    "y" : { "a" : "y", "b" : "z", "c" : "a", "d" : "b", "e" : "c", "f" : "d", "g" : "e", "h" : "f", "i" : "g", "j" : "h", "k" : "i", "l" : "j", "m" : "k", "n" : "l", "o" : "m", "p" : "n", "q" : "o", "r" : "p", "s" : "q", "t" : "r", "u" : "s", "v" : "t", "w" : "u", "x" : "v", "y" : "w", "z" : "x" },
    "z" : { "a" : "z", "b" : "a", "c" : "b", "d" : "c", "e" : "d", "f" : "e", "g" : "f", "h" : "g", "i" : "h", "j" : "i", "k" : "j", "l" : "k", "m" : "l", "n" : "m", "o" : "n", "p" : "o", "q" : "p", "r" : "q", "s" : "r", "t" : "s", "u" : "t", "v" : "u", "w" : "v", "x" : "w", "y" : "x", "z" : "y" }
}

def reverseLookup(key, value, mapper):
    for k in mapper[key].keys():
        if mapper[key][k] == value:
            return k
    return None

def encode(key, msg):
    for i in range(len(msg)):
        print(letterMap[(key * (int(len(msg) / len(key)) + 1))[i]][msg[i]], end="")
    print("\n", end="")

def decode(key, msg):
    for i in range(len(msg)):
        print(reverseLookup((key * (int(len(msg) / len(key)) + 1))[i], msg[i], letterMap), end="")
    print("\n", end="")

def decipher(plain, cipher):
    for i in range(len(cipher)):
        print(reverseLookup(plain[i], cipher[i], letterMap), end="")
    print("\n", end="")

def usage():
    print("usage: " + __file__ + ": enter lines to stdin in any of the following formats")
    print("\tencode key=<keystring> message=<msgstring>")
    print("\tdecode key=<keystring> message=<msgstring>")
    print("\tdecipher plaintext=<cleartxtmsg> ciphertext=<ciphertxtmsg>")

def getArgByNameFromOptions(name, options):
    if len(options) == 0:
        return ""
    elif options[0].startswith(name + "="):
        return options[0][len(name + "="):]
    else:
        return getArgByNameFromOptions(name, options[1:])

for line in sys.stdin:
    line = line.strip()
    options = line.split()
    action = options[0] if len(options) > 0 else ""
    if action == "encode":
        encode(getArgByNameFromOptions("key", options), getArgByNameFromOptions("message", options))
    elif action == "decode":
        decode(getArgByNameFromOptions("key", options), getArgByNameFromOptions("message", options))
    elif action == "decipher":
        decipher(getArgByNameFromOptions("plaintext", options), getArgByNameFromOptions("ciphertext", options))
    else:
        usage()
        exit(1)

