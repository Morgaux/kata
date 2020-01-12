#
# Tests for a fizz buzz implementation
#
# Implementation is tested for the following features:
# TEST1 - A FizzBuzz program MUST output only base ten numbers, OR the string
#         "Fizz", OR the string "Buzz", OR the string "FizzBuzz"
# TEST2 - A FizzBuzz program MUST output positive numbers
# TEST3 _ A FizzBuzz program MUST output numbers in order
# TEST4 - Every third output MUST be a "Fizz", except if "FizzBuzz"
# TEST5 - Every fifth output MUST be a "Buzz", except if "FizzBuzz"
# TEST6 - Every fifteenth output MUST be a "FizzBuzz"
#

TESTS = TEST1 TEST2 TEST3 TEST4 TEST5 TEST6
FILES = ../../src/fizzbuzz/*

all: config ${TESTS}

config:
	@echo "config:"
	@echo "FILES:	" ${FILES}
	@echo " "

${TESTS}: ${FILES}

TEST1:
	@echo "Starting Test 1..."
	@for FILE in ${FILES}; \
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
	@echo "Finnished Test 1"
	@echo " "

TEST2:
	@echo "Starting Test 2..."
	@for FILE in ${FILES}; \
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
	@echo "Finnished Test 2"
	@echo " "

TEST3:
	@echo "Starting Test 3..."
	@echo "Finnished Test 3"
	@echo " "

TEST4:
	@echo "Starting Test 4..."
	@echo "Finnished Test 4"
	@echo " "

TEST5:
	@echo "Starting Test 5..."
	@echo "Finnished Test 5"
	@echo " "

TEST6:
	@echo "Starting Test 6..."
	@echo "Finnished Test 6"
	@echo " "

.PHONY: all config ${TESTS}
