#
# Tests for a fizz buzz implementation
#
# Implementation is tested for the following features:
# - A FizzBuzz program MUST output only base ten numbers, OR the string "Fizz",
#   OR the string "Buzz", OR the string "FizzBuzz"
# - A FizzBuzz program MUST output positive numbers
# - A FizzBuzz program MUST output numbers in order
# - Every third output MUST be a "Fizz", except if "FizzBuzz"
# - Every fifth output MUST be a "Buzz", except if "FizzBuzz"
# - Every fifteenth output MUST be a "FizzBuzz"
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
		echo "FAIL" ; \
		exit 1 ; \
	done
	@echo "Finnished Test $@"
	@echo " "

test_program_has_output:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		echo "FAIL" ; \
		exit 1 ; \
	done
	@echo "Finnished Test $@"
	@echo " "

test_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if ./$$FILE | grep -Eq "^Fizz|Buzz|FizzBuzz|\d*$$" ; \
		then \
			echo "TEST1 passed for $$FILE" ; \
		else \
			echo "TEST1 failed for $$FILE" ; \
			echo "A FizzBuzz program MUST output only base ten " ; \
			echo "numbers, OR the string 'Fizz', OR the string " ; \
			echo "'Buzz', OR the string 'FizzBuzz'" ; \
			exit 1 ; \
		fi ; \
	done
	@echo "Finnished Test $@"
	@echo " "

test_numbers_are_positive:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		if ./$$FILE | grep -Eq "\d*" ; \
		then \
			continue ; \
		fi ; \
		if ! ./$$FILE | grep -Eq "-\d*" ; \
		then \
			echo "TEST2 passed for $$FILE" ; \
		else \
			echo "TEST1 failed for $$FILE" ; \
			echo "A FizzBuzz program MUST output positive numbers" ; \
			exit 1 ; \
		fi ; \
	done
	@echo "Finnished Test $@"
	@echo " "

test_numbers_are_in_order:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		echo "FAIL" ; \
		exit 1 ; \
	done
	@echo "Finnished Test $@"
	@echo " "

test_every_third_output_is_fizz:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		echo "FAIL" ; \
		exit 1 ; \
	done
	@echo "Finnished Test $@"
	@echo " "

test_every_fifth_output_is_buzz:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		echo "FAIL" ; \
		exit 1 ; \
	done
	@echo "Finnished Test $@"
	@echo " "

test_every_fifteenth_output_is_fizzbuzz:
	@echo "Starting Test $@..."
	@for FILE in ${FILES} ; \
	do \
		echo "FAIL" ; \
		exit 1 ; \
	done
	@echo "Finnished Test $@"
	@echo " "

.PHONY: all config ${TESTS}
