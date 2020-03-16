#
# Tests for a palindrome checker implementation
#

#
# The interface is as follows:
# - for every line that is input either "true" or "false" is output
# - "true" is output if the line, when striped of whitespace, is the same when
#   reversed
# - "false" is output if the line doesn't match the criteria for "true"
# - empty lines are not considered palindromes
#

KATA = "PALINDROME"

TEST_CASES = test_file_is_executable                         \
             test_input_line_count_matches_output_line_count

TEST_FILES = bin/palindrome/python_implementation

all: message_before ${TEST_CASES}

include test/tests.mk
include builds.mk

