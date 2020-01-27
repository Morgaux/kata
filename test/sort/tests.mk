#
# _SORT_TESTS for a sort implementation
#

_SORT_TESTS = test_sort_file_is_executable

_SORT_FILES = 

predicate_test_sort_file_is_executable = [ -x  $$FILE ]

test_sort: ${_SORT_TESTS}
	@echo All sort tests completed...
	@echo  

.PHONY: test_sort 

