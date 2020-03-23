#
# Makefile rules and targets for tests
#

include colors.mk

# Helper targets {{{
message_before: # This target allows the tests to be separated by sections
	@echo "${YELLOW}STARTING" ${KATA} "TESTS...${RESET}"
	@echo ""
# Helper targets }}}

# Common predicates {{{
# These predicates are fairly common and are available to be used to construct
# more strict test cases without repeating common predicates.
predicate_test_file_is_executable = [ -x  "$$FILE" ]
predicate_test_program_has_output = [ "$$("$$FILE" | wc -c | awk '{print $$1}')" -gt 0 ]
predicate_test_output_is_at_least_3_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 2 ]
predicate_test_output_is_at_least_5_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 4 ]
predicate_test_output_is_at_least_15_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 14 ]
predicate_test_output_is_at_least_100_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 99 ]
predicate_test_output_has_numbers = ${predicate_test_program_has_output} && "$$FILE" | grep -Eq "[0123456789]*"
predicate_test_input_line_count_matches_output_line_count = [ "$$(awk "BEGIN {for (j = 1; j <= 10; j++) print j}" | "$$FILE" | wc -l)" -eq "10" ]
# Common predicates }}}

# Main test loop target {{{
# This target runs the test predicates defined in the kata's tests.mk file
${TEST_CASES}: ${TEST_FILES}
	@echo "${BOLD}Starting:${RESET} $@..." | tr '_' ' '
	@_RESULT="" ; \
	for FILE in $^ ; \
	do \
		if ${predicate_${@}} ; \
		then \
			continue ; \
		else \
			_RESULT="$${_RESULT} $${FILE}" ; \
		fi ; \
	done 1>/dev/null 2>&1 ; \
	if [ -z "$$_RESULT" ] ; \
	then \
		echo "${BOLD}${GREEN}PASS${RESET}" ; \
	else \
		for FILE in $$_RESULT ; \
		do \
			echo "${BOLD}${RED}FAIL${RESET}: ${BOLD}$$FILE${RESET}" ; \
		done ; \
	fi
	@echo " "
# Main test loop target }}}

.PHONY: ${TEST_CASES}

