#
# Tests for a palindrome checker implementation
#

#
# The interface is as follows:
#

KATA = "PALINDROME"

TEST_CASES = test_file_is_executable                         \
             test_input_line_count_matches_output_line_count \
             test_empty_line_fails

TEST_FILES = bin/palindrome/python_implementation

all: message_before ${TEST_CASES}

include test/tests.mk
include builds.mk

predicate_test_empty_line_fails = [ "$$(echo "" | $$FILE)" = "false" ]

