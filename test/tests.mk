#
# Makefile rules and targets for tests
#

include colors.mk

#
# This target runs the test predicates defined in the kata's tests.mk file
#
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

.PHONY: ${TEST_CASES}

