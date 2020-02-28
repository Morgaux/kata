#
# Configuration for katas and unit tests
#

KATAS = fizzbuzz
TESTS = ${KATAS:%=test_%}

BIN = ${KATAS:%=bin/%/haskell_implementation}

