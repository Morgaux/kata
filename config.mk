#
# Makefile rules and variables for configuration of builds and tests
#

KATAS = fizzbuzz roman
TESTS = ${KATAS:%=test/%/tests.mk}
SRC   = ${KATAS:%=src/%}
BIN   = ${KATAS:%=bin/%}

