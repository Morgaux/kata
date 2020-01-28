#
# _SORT_TESTS for a sort implementation
#

_SORT_TESTS = test_sort_file_is_executable                         \
              test_sort_input_line_count_matches_output_line_count \
              test_sort_single_letters                             \
              test_sort_single_digits                              \
              test_sort_multiletter                                \
              test_sort_multidigit                                 \
              test_sort_uppercase_first                            \
              test_sort_zeros_correct                              \
              test_sort_digits_before_letters

_SORT_FILES = bin/sort/python_implementation

predicate_test_sort_file_is_executable = [ -x  $$FILE ]
predicate_test_sort_input_line_count_matches_output_line_count = _COUNT="$$((RANDOM / 100))" ; [ "$$(awk "BEGIN {for (j = 1; j <= $$_COUNT; j++) print j}" | "$$FILE" | wc -l)" -eq "$$_COUNT" ]
predicate_test_sort_single_letters = [ "$$({ echo "c" ; echo "d" ; echo "b" ; echo "e" ; echo "a" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "abcde" ]
predicate_test_sort_single_digits = [ "$$({ echo "3" ; echo "4" ; echo "2" ; echo "5" ; echo "1" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "12345" ]
predicate_test_sort_multiletter = [ "$$({ echo "abc" ; echo "d" ; echo "aef" ; echo "gh" ; echo "lm" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "abcaefdghlm" ]
predicate_test_sort_multidigit = [ "$$({ echo "123" ; echo "45" ; echo "6" ; echo "78" ; echo "90" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "6457890123" ]
predicate_test_sort_uppercase_first = [ "$$({ echo "B" ; echo "a" ; echo "A" ; echo "C" ; echo "b" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "AaBbC" ]
predicate_test_sort_zeros_correct = [ "$$({ echo "1" ; echo "3" ; echo "0" ; echo "2" ; echo "0" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "00123" ]
predicate_test_sort_digits_before_letters = [ "$$({ echo "b" ; echo "5" ; echo "a" ; echo "0" ; echo "d" ; echo "c" ; } | "$$FILE" | tr '\n' '_' | sed 's/_//g')" = "05abcd" ]


test_sort: ${_SORT_TESTS}
	@echo All sort tests completed...
	@echo  

.PHONY: test_sort 

