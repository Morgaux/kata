#
# Configuration for katas and unit tests
#

KATAS = alphabet_cipher fizzbuzz roman_numerals sort palindrome leap_year
LANGS = awk c haskell java python shell
TMOUT = 30s
TESTS = ${KATAS:%=test_%}

_JAVA_FLAGS  = -enablesystemassertions -Xbatch
_JAVAC_FLAGS = -Xlint:all -Werror ${_JAVA_FLAGS:%=-J%}

