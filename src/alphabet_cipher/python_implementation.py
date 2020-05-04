#!/usr/bin/env python3

import sys

def uncycle(string, n = 1):
    if string.startswith(string[n:]): # and string[1:n + 1] == string[n:][1:n + 1]:
        return string[:n]
    else:
        return uncycle(string, n + 1)

letters = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]

def encode(key, msg):
    result = []
    for i in range(len(msg)):
        keyLetter   = (key * (int(len(msg) / len(key)) + 1))[i]
        msgLetter   = msg[i]
        keyAlphabet = letters[letters.index(keyLetter):] + letters[:letters.index(keyLetter)]
        result.append(keyAlphabet[letters.index(msgLetter)])
    return "".join(result)

def decode(key, msg):
    result = []
    for i in range(len(msg)):
        keyLetter   = (key * (int(len(msg) / len(key)) + 1))[i]
        msgLetter   = msg[i]
        keyAlphabet = letters[letters.index(keyLetter):] + letters[:letters.index(keyLetter)]
        result.append(letters[keyAlphabet.index(msgLetter)])
    return "".join(result)

def decipher(plain, cipher):
    key=[]
    for i in range(len(cipher)):
        for letter in letters:
            if encode(letter, plain[i]) == cipher[i]:
                key.append(letter)
    return uncycle("".join(key))

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

if __name__ == "__main__":
    for line in sys.stdin:
        line = line.strip()
        options = line.split()
        action = options[0] if len(options) > 0 else ""

        if action == "encode":
            print(encode(getArgByNameFromOptions("key", options), getArgByNameFromOptions("message", options)))
        elif action == "decode":
            print(decode(getArgByNameFromOptions("key", options), getArgByNameFromOptions("message", options)))
        elif action == "decipher":
            print(decipher(getArgByNameFromOptions("plaintext", options), getArgByNameFromOptions("ciphertext", options)))
        else:
            usage()
            exit(1)

