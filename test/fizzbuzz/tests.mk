#
# _FIZZBUZZ_TESTS for a fizz buzz implementation
#

_FIZZBUZZ_TESTS = test_fizzbuzz_file_is_executable                                    \
                  test_fizzbuzz_program_has_output                                    \
                  test_fizzbuzz_output_has_numbers                                    \
                  test_fizzbuzz_numbers_are_positive                                  \
                  test_fizzbuzz_numbers_are_in_order                                  \
                  test_fizzbuzz_numbers_corespond_to_ordinal_position_counting_from_1 \
                  test_fizzbuzz_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes       \
                  test_fizzbuzz_every_third_output_is_fizz                            \
                  test_fizzbuzz_fizzes_are_only_at_every_third_position               \
                  test_fizzbuzz_every_fifth_output_is_buzz                            \
                  test_fizzbuzz_buzzes_are_only_at_every_fifth_position               \
                  test_fizzbuzz_every_fifteenth_output_is_fizzbuzz                    \
                  test_fizzbuzz_fizzbuzzes_are_only_at_every_fifteenth_position       \
                  test_fizzbuzz_output_is_at_least_100_lines

_FIZZBUZZ_FILES = bin/fizzbuzz/python_implementation  \
                  bin/fizzbuzz/shell_implementation   \
                  bin/fizzbuzz/haskell_implementation

predicate_test_fizzbuzz_file_is_executable = [ -x  "$$FILE" ]
predicate_test_fizzbuzz_program_has_output = [ "$$("$$FILE" | wc -c | awk '{print $$1}')" -gt 0 ] 
predicate_test_fizzbuzz_outputs_are_numbers_fizzes_buzzes_or_fizzbuzzes = "$$FILE" | grep -Eq "^Fizz$$|^Buzz$$|^FizzBuzz$$|^[0123456789]*$$" && ! "$$FILE" | grep -Eq "^$$"
predicate_test_fizzbuzz_numbers_are_positive = ! "$$FILE" | grep -E "\-[0123456789]" 
predicate_test_fizzbuzz_numbers_are_in_order = "$$FILE" | grep -E "[0123456789]" | sort -n -c - 2>/dev/null 
predicate_test_fizzbuzz_every_third_output_is_fizz = [ "$$("$$FILE" | wc -l)" -gt 2 ]  && [ "$$("$$FILE" | awk 'NR % 3 == 0' | grep -v "Fizz" | wc -l)" -eq 0 ] 
predicate_test_fizzbuzz_every_fifth_output_is_buzz = [ "$$("$$FILE" | wc -l)" -gt 4 ]  && [ "$$("$$FILE" | awk 'NR % 5 == 0' | grep -v "Buzz" | wc -l)" -eq 0 ] 
predicate_test_fizzbuzz_every_fifteenth_output_is_fizzbuzz = [ "$$("$$FILE" | wc -l)" -gt 14 ]  && [ "$$("$$FILE" | awk 'NR % 15 == 0' | grep -v "FizzBuzz" | wc -l)" -eq 0 ] 
predicate_test_fizzbuzz_output_is_at_least_100_lines = [ "$$("$$FILE" | wc -l)" -gt 99 ] 
predicate_test_fizzbuzz_output_has_numbers = "$$FILE" | grep -Eq "[0123456789]*" 
predicate_test_fizzbuzz_fizzes_are_only_at_every_third_position = ! "$$FILE" | awk 'NR % 3 != 0' | grep -q "Fizz" 
predicate_test_fizzbuzz_buzzes_are_only_at_every_fifth_position = ! "$$FILE" | awk 'NR % 5 != 0' | grep -q "Buzz" 
predicate_test_fizzbuzz_fizzbuzzes_are_only_at_every_fifteenth_position = ! "$$FILE" | awk 'NR % 15 != 0' | grep -q "FizzBuzz" 
predicate_test_fizzbuzz_numbers_corespond_to_ordinal_position_counting_from_1 = "$$FILE" | awk '/\d/ {if (NR != $$0) exit 1}' 

test_fizzbuzz: ${_FIZZBUZZ_TESTS}
	@echo "All fizzbuzz tests completed..."
	@echo " "

.PHONY: test_fizzbuzz ${_FIZZBUZZ_TESTS}

