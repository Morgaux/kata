#!/usr/bin/env python3

import sys

letterMap = {
    "a" : { "a" : "a", "b" : "b", "c" : "c", "d" : "d", "e" : "e", "f" : "f", "g" : "g", "h" : "h", "i" : "i", "j" : "j", "k" : "k", "l" : "l", "mnopqrstuvwxyz" },
    "b" : { "b" : "a", "c" : "b", "d" : "c", "e" : "d", "f" : "e", "g" : "f", "h" : "g", "i" : "h", "j" : "i", "k" : "j", "l" : "k", "m" : "l", "nopqrstuvwxyza" },
    "c" : { "c" : "a", "d" : "b", "e" : "c", "f" : "d", "g" : "e", "h" : "f", "i" : "g", "j" : "h", "k" : "i", "l" : "j", "m" : "k", "n" : "l", "opqrstuvwxyzab" },
    "d" : { "d" : "a", "e" : "b", "f" : "c", "g" : "d", "h" : "e", "i" : "f", "j" : "g", "k" : "h", "l" : "i", "m" : "j", "n" : "k", "o" : "l", "pqrstuvwxyzabc" },
    "e" : { "e" : "a", "f" : "b", "g" : "c", "h" : "d", "i" : "e", "j" : "f", "k" : "g", "l" : "h", "m" : "i", "n" : "j", "o" : "k", "p" : "l", "qrstuvwxyzabcd" },
    "f" : { "f" : "a", "g" : "b", "h" : "c", "i" : "d", "j" : "e", "k" : "f", "l" : "g", "m" : "h", "n" : "i", "o" : "j", "p" : "k", "q" : "l", "rstuvwxyzabcde" },
    "g" : { "g" : "a", "h" : "b", "i" : "c", "j" : "d", "k" : "e", "l" : "f", "m" : "g", "n" : "h", "o" : "i", "p" : "j", "q" : "k", "r" : "l", "stuvwxyzabcdef" },
    "h" : { "h" : "a", "i" : "b", "j" : "c", "k" : "d", "l" : "e", "m" : "f", "n" : "g", "o" : "h", "p" : "i", "q" : "j", "r" : "k", "s" : "l", "tuvwxyzabcdefg" },
    "i" : { "i" : "a", "j" : "b", "k" : "c", "l" : "d", "m" : "e", "n" : "f", "o" : "g", "p" : "h", "q" : "i", "r" : "j", "s" : "k", "t" : "l", "uvwxyzabcdefgh" },
    "j" : { "j" : "a", "k" : "b", "l" : "c", "m" : "d", "n" : "e", "o" : "f", "p" : "g", "q" : "h", "r" : "i", "s" : "j", "t" : "k", "u" : "l", "vwxyzabcdefghi" },
    "k" : { "k" : "a", "l" : "b", "m" : "c", "n" : "d", "o" : "e", "p" : "f", "q" : "g", "r" : "h", "s" : "i", "t" : "j", "u" : "k", "v" : "l", "wxyzabcdefghij" },
    "l" : { "l" : "a", "m" : "b", "n" : "c", "o" : "d", "p" : "e", "q" : "f", "r" : "g", "s" : "h", "t" : "i", "u" : "j", "v" : "k", "w" : "l", "xyzabcdefghijk" },
    "m" : { "m" : "a", "n" : "b", "o" : "c", "p" : "d", "q" : "e", "r" : "f", "s" : "g", "t" : "h", "u" : "i", "v" : "j", "w" : "k", "x" : "l", "yzabcdefghijkl" },
    "n" : { "n" : "a", "o" : "b", "p" : "c", "q" : "d", "r" : "e", "s" : "f", "t" : "g", "u" : "h", "v" : "i", "w" : "j", "x" : "k", "y" : "l", "zabcdefghijklm" },
    "o" : { "o" : "a", "p" : "b", "q" : "c", "r" : "d", "s" : "e", "t" : "f", "u" : "g", "v" : "h", "w" : "i", "x" : "j", "y" : "k", "z" : "l", "abcdefghijklmn" },
    "p" : { "p" : "a", "q" : "b", "r" : "c", "s" : "d", "t" : "e", "u" : "f", "v" : "g", "w" : "h", "x" : "i", "y" : "j", "z" : "k", "a" : "l", "bcdefghijklmno" },
    "q" : { "q" : "a", "r" : "b", "s" : "c", "t" : "d", "u" : "e", "v" : "f", "w" : "g", "x" : "h", "y" : "i", "z" : "j", "a" : "k", "b" : "l", "cdefghijklmnop" },
    "r" : { "r" : "a", "s" : "b", "t" : "c", "u" : "d", "v" : "e", "w" : "f", "x" : "g", "y" : "h", "z" : "i", "a" : "j", "b" : "k", "c" : "l", "defghijklmnopq" },
    "s" : { "s" : "a", "t" : "b", "u" : "c", "v" : "d", "w" : "e", "x" : "f", "y" : "g", "z" : "h", "a" : "i", "b" : "j", "c" : "k", "d" : "l", "efghijklmnopqr" },
    "t" : { "t" : "a", "u" : "b", "v" : "c", "w" : "d", "x" : "e", "y" : "f", "z" : "g", "a" : "h", "b" : "i", "c" : "j", "d" : "k", "e" : "l", "fghijklmnopqrs" },
    "u" : { "u" : "a", "v" : "b", "w" : "c", "x" : "d", "y" : "e", "z" : "f", "a" : "g", "b" : "h", "c" : "i", "d" : "j", "e" : "k", "f" : "l", "ghijklmnopqrst" },
    "v" : { "v" : "a", "w" : "b", "x" : "c", "y" : "d", "z" : "e", "a" : "f", "b" : "g", "c" : "h", "d" : "i", "e" : "j", "f" : "k", "g" : "l", "hijklmnopqrstu" },
    "w" : { "w" : "a", "x" : "b", "y" : "c", "z" : "d", "a" : "e", "b" : "f", "c" : "g", "d" : "h", "e" : "i", "f" : "j", "g" : "k", "h" : "l", "ijklmnopqrstuv" },
    "x" : { "x" : "a", "y" : "b", "z" : "c", "a" : "d", "b" : "e", "c" : "f", "d" : "g", "e" : "h", "f" : "i", "g" : "j", "h" : "k", "i" : "l", "jklmnopqrstuvw" },
    "y" : { "y" : "a", "z" : "b", "a" : "c", "b" : "d", "c" : "e", "d" : "f", "e" : "g", "f" : "h", "g" : "i", "h" : "j", "i" : "k", "j" : "l", "klmnopqrstuvwx" },
    "z" : { "z" : "a", "a" : "b", "b" : "c", "c" : "d", "d" : "e", "e" : "f", "f" : "g", "g" : "h", "h" : "i", "i" : "j", "j" : "k", "k" : "l", "lmnopqrstuvwxy" }
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

