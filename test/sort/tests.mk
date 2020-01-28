#
# _SORT_TESTS for a sort implementation
#

_SORT_TESTS = test_sort_file_is_executable                         \
              test_sort_input_line_count_matches_output_line_count

_SORT_FILES = bin/sort/python_implementation

predicate_test_sort_file_is_executable = [ -x  $$FILE ]
predicate_test_sort_input_line_count_matches_output_line_count = _COUNT="$$((RANDOM / 100))" ; [ "$$(awk "BEGIN {for (j = 1; j <= $$_COUNT; j++) print j}" | "$$FILE" | wc -l)" -eq "$$_COUNT" ] >/dev/null 2>&1 

test_sort: ${_SORT_TESTS}
	@echo All sort tests completed...
	@echo  

.PHONY: test_sort 

