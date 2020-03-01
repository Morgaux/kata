#
# Tests for a sort implementation
#

#
# The interface is as follows:
# - STDIN is read
# - lines are sorted ASCIIbetically, in Natural sort order


TEST_CASES = test_file_is_executable                         \
             test_input_line_count_matches_output_line_count \
             test_single_letters                             \
             test_single_digits                              \
             test_multiletter                                \
             test_multidigit                                 \
             test_uppercase_first                            \
             test_zeros_correct                              \
             test_digits_before_letters                      \
             test_natural_order

TEST_FILES = bin/sort/python_implementation

all: ${TEST_CASES}

include test/tests.mk
include builds.mk

predicate_test_input_line_count_matches_output_line_count = [ "$$(awk "BEGIN {for (j = 1; j <= 10; j++) print j}" | "$$FILE" | wc -l)" -eq "10" ]

predicate_test_single_letters = [ "$$({ echo "c" ; echo "d" ; echo "b" ; echo "e" ; echo "a" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "abcde" ]

predicate_test_single_digits = [ "$$({ echo "3" ; echo "4" ; echo "2" ; echo "5" ; echo "1" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "12345" ]

predicate_test_multiletter = [ "$$({ echo "abc" ; echo "d" ; echo "aef" ; echo "gh" ; echo "lm" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "abcaefdghlm" ]

predicate_test_multidigit = [ "$$({ echo "123" ; echo "45" ; echo "6" ; echo "78" ; echo "90" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "6457890123" ]

predicate_test_uppercase_first = [ "$$({ echo "B" ; echo "a" ; echo "A" ; echo "C" ; echo "b" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "AaBbC" ]

predicate_test_zeros_correct = [ "$$({ echo "1" ; echo "3" ; echo "0" ; echo "2" ; echo "0" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "00123" ]

predicate_test_digits_before_letters = [ "$$({ echo "b" ; echo "5" ; echo "a" ; echo "0" ; echo "d" ; echo "c" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "05abcd" ]

predicate_test_natural_order = [ "$$({ echo "a4" ; echo "a0" ; echo "a40" ; echo "a4" ; echo "a11" ; } | $$FILE | tr '\n' '_' | sed 's/_//g')" = "a0a4a4a11a40" ]

