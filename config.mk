#
# Configuration for katas and unit tests
#

KATAS = alphabet_cipher fizzbuzz roman_numerals sort palindrome
TESTS = ${KATAS:%=test_%}

BIN = ${KATAS:%=bin/%/haskell_implementation}

