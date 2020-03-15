#
# Tests for a palindrome checker implementation
#

#
# The interface is as follows:
#

KATA = "PALINDROME"

TEST_CASES = test_file_is_executable

TEST_FILES = bin/palindrome/python_implementation

all: message_before ${TEST_CASES}

include test/tests.mk
include builds.mk

