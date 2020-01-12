#
# Tests for a fizz buzz implementation
#

TESTS = test_file_is_executable                              \
        test_program_has_output                              \
        test_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes \
        test_numbers_are_positive                            \
        test_numbers_are_in_order                            \
        test_every_third_output_is_fizz                      \
        test_every_fifth_output_is_buzz                      \
        test_every_fifteenth_output_is_fizzbuzz

FILES = ../../src/fizzbuzz/*

all: config ${TESTS}

config:
	@echo "config for FizzBuzz tests:"
	@echo "FILES:	" ${FILES}
	@echo "TESTS:	" ${TESTS}
	@echo " "

${TESTS}: ${FILES}

test_file_is_executable:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if [ -x $$FILE ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "Failed for $$FILE" ; \
		fi ; \
	done
	@echo " "

test_program_has_output:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if [ "$$(wc -c < "$$FILE" | awk '{print $$1}')" -gt 0 ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "Failed for $$FILE" ; \
		fi ; \
	done
	@echo " "

test_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if ./$$FILE | grep -Eq "^Fizz|Buzz|FizzBuzz|\d*$$" ; \
		then \
			echo "PASS" ; \
		else \
			echo "Failed for $$FILE" ; \
		fi ; \
	done
	@echo " "

test_numbers_are_positive:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if ! ./$$FILE | grep -Eq "^-\d*" ; \
		then \
			echo "PASS" ; \
		else \
			echo "Failed for $$FILE" ; \
		fi ; \
	done
	@echo " "

test_numbers_are_in_order:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if sort -n -c $$FILE 2>/dev/null ; \
		then \
			echo "PASS" ; \
		else \
			echo "Failed for $$FILE" ; \
		fi ; \
	done
	@echo " "

test_every_third_output_is_fizz:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if false ; \
		then \
			echo "PASS" ; \
		else \
			echo "Failed for $$FILE" ; \
		fi ; \
	done
	@echo " "

test_every_fifth_output_is_buzz:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if false ; \
		then \
			echo "PASS" ; \
		else \
			echo "$@ failed for $$FILE" ; \
		fi ; \
	done
	@echo " "

test_every_fifteenth_output_is_fizzbuzz:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if false ; \
		then \
			echo "PASS" ; \
		else \
			echo "$@ failed for $$FILE" ; \
		fi ; \
	done
	@echo " "

.PHONY: all config ${TESTS}
