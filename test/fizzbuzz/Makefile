#
# Tests for a fizz buzz implementation
#

TESTS = test_file_is_executable                              \
        test_program_has_output                              \
        test_output_is_at_least_100_lines                    \
        test_output_has_numbers                              \
        test_numbers_are_positive                            \
        test_numbers_are_in_order                            \
        test_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes \
        test_every_third_output_is_fizz                      \
        test_every_fifth_output_is_buzz                      \
        test_every_fifteenth_output_is_fizzbuzz

FILES = ../../bin/fizzbuzz/python-implementation  \
        ../../bin/fizzbuzz/shell-implementation   \
        ../../bin/fizzbuzz/haskell-implementation

all: config ${TESTS}

config:
	@echo "config for FizzBuzz tests:"
	@echo "FILES:	" ${FILES}
	@echo "TESTS:	" ${TESTS}
	@echo " "

test: ${TESTS}
	@echo "All tests completed..."
	@echo " "

${TESTS}: ${FILES}

${FILES}:
	@echo "Building $@..." | tr '_' ' '
	@cd ../../src/fizzbuzz && make $@
	@echo " "

test_file_is_executable:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if [ -x "$$FILE" ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_program_has_output:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if [ "$$("$$FILE" | wc -c | awk '{print $$1}')" -gt 0 ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if "$$FILE" | grep -Eq "^Fizz$$|^Buzz$$|^FizzBuzz$$|^[0123456789]*$$" && \
			! "$$FILE" | grep -Eq "^$$"; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_numbers_are_positive:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if ! "$$FILE" | grep -E "\-[0123456789]" ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_numbers_are_in_order:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if "$$FILE" | grep -E "[0123456789]" | sort -n -c - 2>/dev/null ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_every_third_output_is_fizz:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if [ "$$("$$FILE" | wc -l)" -gt 2 ]  && \
			[ "$$("$$FILE" | awk 'NR % 3 == 0' | grep -v "Fizz" | wc -l)" -eq 0 ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_every_fifth_output_is_buzz:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if [ "$$("$$FILE" | wc -l)" -gt 4 ]  && \
			[ "$$("$$FILE" | awk 'NR % 5 == 0' | grep -v "Buzz" | wc -l)" -eq 0 ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_every_fifteenth_output_is_fizzbuzz:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if [ "$$("$$FILE" | wc -l)" -gt 14 ]  && \
			[ "$$("$$FILE" | awk 'NR % 15 == 0' | grep -v "FizzBuzz" | wc -l)" -eq 0 ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_output_is_at_least_100_lines:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if [ "$$("$$FILE" | wc -l)" -gt 99 ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_output_has_numbers:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if "$$FILE" | grep -Eq "[0123456789]*" ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

.PHONY: all config test ${TESTS}
