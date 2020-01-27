#
# Makefile rules and targets for tests
#

include config.mk
include ${TESTS}

TEST_CASES = ${_FIZZBUZZ_TESTS} ${_ROMAN_TESTS}
TEST_FILES = ${_FIZZBUZZ_FILES} ${_ROMAN_FILES}

