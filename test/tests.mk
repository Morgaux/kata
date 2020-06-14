#
# Makefile rules and targets for tests
#

include colors.mk
include config.mk

# Helper variables {{{
RANDOM     := "$$(od -vAn -N4 -tu4 < /dev/urandom | sed 's/^ *0*//g')"
TEST_FILES := ${TEST_LANGS:%=bin/${KATA_DIR}/%_implementation}
# Helper variables }}}

# Helper targets {{{
# This target allows the tests to be separated into sections by headings
message_before: start_kata_heading list_implementations

# This target allows each section to be terminated by a message
message_after: end_kata_heading show_test_results

# This target shows a heading for each kata section
start_kata_heading:
	@echo "${YELLOW}STARTING" ${KATA} "TESTS...${RESET}"
	@echo ""

# This target shows a closing message for each section
end_kata_heading:
	@echo "${YELLOW}FINISHED" ${KATA} "TESTS${RESET}"
	@echo ""

# This target allows the files to be tested to be listed for viewing
list_implementations:
	@echo "${YELLOW}IMPLEMENTATIONS:${RESET}"
	@for FILE in ${TEST_FILES} ; \
	do \
		FILE="$$(basename "$$FILE" | tr '_' ' ')" ; \
		printf "\t${BOLD}%s${RESET}\n" "$$FILE" ; \
	done
	@echo ""

# This target shows a summary report of the tests
show_test_results:
	@echo "TODO"
	@echo ""
# Helper targets }}}

# Common predicates {{{
# These predicates are fairly common and are available to be used to construct
# more strict test cases without repeating common predicates. Note, FILE is
# replaced with the command to run the current implementation, whereas _FILE is
# replaced with the relative path to the implementation file.
predicate_test_file_is_executable = [ -x  "$$_FILE" ]
predicate_test_program_has_output = [ "$$("$$FILE" | wc -c | awk '{print $$1}')" -gt 0 ]
predicate_test_output_is_at_least_3_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 2 ]
predicate_test_output_is_at_least_5_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 4 ]
predicate_test_output_is_at_least_15_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 14 ]
predicate_test_output_is_at_least_100_lines = ${predicate_test_program_has_output} && [ "$$("$$FILE" | wc -l)" -gt 99 ]
predicate_test_output_has_numbers = ${predicate_test_program_has_output} && "$$FILE" | grep -Eq "[0123456789]+"
predicate_test_input_line_count_matches_output_line_count = [ "$$(awk "BEGIN {for (j = 1; j <= 10; j++) print j}" | "$$FILE" | wc -l)" -eq "10" ]
# Common predicates }}}

# Main test loop target {{{
# This target runs the test predicates defined in the kata's tests.mk file
${TEST_CASES}: ${TEST_FILES}
	@echo "${BOLD}Starting:${RESET} $@..." | tr '_' ' '
	@ERRORS="" ; \
	for _FILE in $^ ; \
	do \
		FILE="timeout ${TFLAG} ${TMOUT} $${_FILE}" ; \
		${predicate_${@}} ; \
		case "$$?" in \
			0)   continue ;; \
			124) ERROR_TYPE="TIMEOUT" ;; \
			*)   ERROR_TYPE="FAIL" ;; \
		esac ; \
		ERRORS="$${ERRORS} $${ERROR_TYPE}:$$(basename "$${_FILE}")" ; \
	done 1>/dev/null 2>&1 ; \
	for ERROR in $$ERRORS ; \
	do \
		ERROR_TYPE="$$(echo "$$ERROR" | sed 's/:.*$$//g')" ; \
		ERROR_FILE="$$(echo "$$ERROR" | sed 's/^.*://g; s/_/ /g')" ; \
		printf "%s: " "${BOLD}${RED}$${ERROR_TYPE}${RESET}" ; \
		printf "%s\n" "${BOLD}$${ERROR_FILE}${RESET}" ; \
	done ; \
	[ -n "$$ERRORS" ] || echo "${BOLD}${GREEN}PASS${RESET}"
	@echo " "
# Main test loop target }}}

.PHONY: ${TEST_CASES} message_before start_kata_heading list_implementations

