#
# _UTC_TO_UNIX_TIMESTAMP_TESTS for a utc_to_unix_timestamp implementation
#

_UTC_TO_UNIX_TIMESTAMP_TESTS = test_utc_to_unix_timestamp_file_is_executable

_UTC_TO_UNIX_TIMESTAMP_FILES = 

predicate_test_utc_to_unix_timestamp_file_is_executable = [ -x  $$FILE ]

test_utc_to_unix_timestamp: ${_UTC_TO_UNIX_TIMESTAMP_TESTS}
	@echo All utc_to_unix_timestamp tests completed...
	@echo  

.PHONY: test_utc_to_unix_timestamp 

