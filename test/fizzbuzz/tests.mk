#
# Tests for a fizz buzz implementation
#

#
# The interface is as follows:
# - STDOUT should print numbers or strings
# - These strings should either be "Fizz", "Buzz", or "FizzBuzz"
# - The numbers should be in order, from 1 to at least 100
# - The numbers should correspond to there ordinal positions
# - All positions divisible by 3 should be "Fizz" or "FizzBuzz"
# - All positions divisible by 5 should be "Buzz" or "FizzBuzz"
# - All positions divisible by 15 should be "FizzBuzz"
# - "Fizz" or "FizzBuzz" can only occur at positions divisible by 3
# - "Buzz" of "FizzBuzz" can only occur at positions divisible by 5
# - "FizzBuzz" should only occur at positions divisible by 15
# - All positions NOT divisible by any of 3, 5, or 15, should be numbers
#

TEST_CASES = test_file_is_executable                                    \
             test_program_has_output                                    \
             test_output_has_numbers                                    \
             test_numbers_are_positive                                  \
             test_numbers_are_in_order                                  \
             test_numbers_corespond_to_ordinal_position_counting_from_1 \
             test_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes       \
             test_every_third_output_is_fizz                            \
             test_fizzes_are_only_at_every_third_position               \
             test_every_fifth_output_is_buzz                            \
             test_buzzes_are_only_at_every_fifth_position               \
             test_every_fifteenth_output_is_fizzbuzz                    \
             test_fizzbuzzes_are_only_at_every_fifteenth_position       \
             test_output_is_at_least_100_lines

TEST_FILES = bin/fizzbuzz/python_implementation

all: ${TEST_CASES}

include test/tests.mk
include builds.mk

predicate_test_file_is_executable = [ -x  "$$FILE" ]

predicate_test_program_has_output = [ "$$("$$FILE" | wc -c | awk '{print $$1}')" -gt 0 ]

predicate_test_output_is_at_least_3_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 2 ]

predicate_test_output_is_at_least_5_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 4 ]

predicate_test_output_is_at_least_15_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 14 ]

predicate_test_output_is_at_least_100_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 99 ]

predicate_test_output_has_numbers = ${predicate_test_program_has_output} && "$$FILE" | grep -Eq "[0123456789]*"

predicate_test_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes = ${predicate_test_program_has_output} && "$$FILE" | grep -Eq "^Fizz$$|^Buzz$$|^FizzBuzz$$|^[0123456789]*$$" && ! "$$FILE" | grep -Eq "^$$"

predicate_test_numbers_are_positive = ${predicate_test_output_has_numbers} && ! "$$FILE" | grep -E "\-[0123456789]"

predicate_test_numbers_are_in_order = ${predicate_test_output_has_numbers} && "$$FILE" | grep -E "[0123456789]" | sort -n -c - 2>/dev/null

predicate_test_every_third_output_is_fizz = ${predicate_test_output_is_at_least_3_lines} && [ "$$("$$FILE" | awk 'NR % 3 == 0' | grep -v "Fizz" | wc -l)" -eq 0 ]

predicate_test_every_fifth_output_is_buzz = ${predicate_test_output_is_at_least_5_lines} && [ "$$("$$FILE" | awk 'NR % 5 == 0' | grep -v "Buzz" | wc -l)" -eq 0 ]

predicate_test_every_fifteenth_output_is_fizzbuzz = ${predicate_test_output_is_at_least_15_lines} && [ "$$("$$FILE" | awk 'NR % 15 == 0' | grep -v "FizzBuzz" | wc -l)" -eq 0 ]

predicate_test_fizzes_are_only_at_every_third_position = ${predicate_test_program_has_output} && ! "$$FILE" | awk 'NR % 3 != 0' | grep -q "Fizz"

predicate_test_buzzes_are_only_at_every_fifth_position = ${predicate_test_program_has_output} && ! "$$FILE" | awk 'NR % 5 != 0' | grep -q "Buzz"

predicate_test_fizzbuzzes_are_only_at_every_fifteenth_position = ${predicate_test_program_has_output} && ! "$$FILE" | awk 'NR % 15 != 0' | grep -q "FizzBuzz"

predicate_test_numbers_corespond_to_ordinal_position_counting_from_1 = ${predicate_test_output_has_numbers} && "$$FILE" | awk '/^[0-9]*$$/ {if (NR != $$0) exit 1}'

