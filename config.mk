#
# Configuration for katas and unit tests
#

KATAS = alphabet_cipher fizzbuzz roman_numerals sort palindrome leap_year
TESTS = ${KATAS:%=test_%}

