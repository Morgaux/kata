#
# Configuration for katas and unit tests
#

KATAS = alphabet_cipher fizzbuzz roman_numerals sort palindrome leap_year
LANGS = awk c haskell java python shell
TMOUT = 30s
TESTS = ${KATAS:%=test_%}

