#
# _ROMAN_TESTS for a fizz buzz implementation
#

_ROMAN_TESTS = test_roman_file_is_executable                         \
               test_roman_file_exits_failure_without_stdin           \
               test_roman_file_exits_success_with_stdin              \
               test_roman_input_line_count_matches_output_line_count \
               test_roman_output_consists_of_only_IVXLCDM            \
               test_roman_powers_of_10_are_correct

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
		if echo "$$RANDOM" | "$$FILE" >/dev/null ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_input_line_count_matches_output_line_count:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		_COUNT="$$RANDOM" ; \
		if [ "$$(awk "BEGIN {for (j = 1; j <= $$_COUNT; j++) print j}" | "$$FILE" | wc -l)" = "$$_COUNT" ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_output_consists_of_only_IVXLCDM:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if [ "$$(echo "$$RANDOM" | "$$FILE" | tr '[:upper:]' '[:lower:]' | grep -Ev "^[ivxlcdm]*$$" | wc -l)" -eq 0 ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_powers_of_10_are_correct:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if [ "$$(echo ''      | "$$FILE")" = ""           ] && \
		   [ "$$(echo '1'     | "$$FILE")" = "I"          ] && \
		   [ "$$(echo '10'    | "$$FILE")" = "X"          ] && \
		   [ "$$(echo '100'   | "$$FILE")" = "C"          ] && \
		   [ "$$(echo '1000'  | "$$FILE")" = "M"          ] && \
		   [ "$$(echo '10000' | "$$FILE")" = "MMMMMMMMMM" ] ;  \
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

