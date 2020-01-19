#
# _ROMAN_TESTS for a fizz buzz implementation
#

_ROMAN_TESTS = test_roman_file_is_executable               \
               test_roman_file_exits_failure_without_stdin \
               test_roman_file_exits_success_with_stdin

_ROMAN_FILES = bin/roman/python_implementation

test_roman: ${_ROMAN_TESTS}
	@echo "All roman tests completed..."
	@echo " "

${_ROMAN_TESTS}: ${_ROMAN_FILES}

test_roman_file_is_executable:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if [ -x "$$FILE" ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_file_exits_failure_without_stdin:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if ! "$$FILE" ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_file_exits_success_with_stdin:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if echo "" | "$$FILE" ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_template:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if false ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

.PHONY: test_roman ${_ROMAN_TESTS}

