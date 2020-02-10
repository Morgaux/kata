#
# Makefile rules and targets for tests
#

include colors.mk
include ${TESTS}

TEST_CASES = ${_FIZZBUZZ_TESTS} ${_ROMAN_TESTS} ${_ALPHABET_CIPHER_TESTS} ${_SORT_TESTS} ${_UTC_TO_UNIX_TIMESTAMP_TESTS} ${_KATA_TESTS}
TEST_FILES = ${_FIZZBUZZ_FILES} ${_ROMAN_FILES} ${_ALPHABET_CIPHER_FILES} ${_SORT_FILES} ${_UTC_TO_UNIX_TIMESTAMP_FILES} ${_KATA_FILES}

test_all: ${KATAS:%=test_%}

#
# This target auto generates kata tests.mk files if they don't yet exist
#
${TESTS}: test/%/tests.mk : % test/% src/%
	@[ -f "$@" ] || { \
		sed "s/KATA_\(.*}\)\$$/$$(echo "$<" | tr [:lower:] [:upper:])_\1 \$${_KATA_\1/g" < tests.mk > tests.mk.tmp ; \
		rm tests.mk ; \
		cp tests.mk.tmp tests.mk ; \
	}
	@[ -f "$@" ] || { \
		echo "#" ; \
		echo "# _KATA_TESTS for a kata implementation" ; \
		echo "#" ; \
		echo "" ; \
		echo "_KATA_TESTS = test_kata_file_is_executable" ; \
		echo "" ; \
		echo "_KATA_FILES = " ; \
		echo "" ; \
		echo "predicate_test_kata_file_is_executable = [ -x  "\$$\$$FILE" ]" ; \
		echo "" ; \
		echo "test_kata: \$${_KATA_TESTS}" ; \
		echo "	@echo \"\$${YELLOW}All kata tests completed...\$${RESET_OUTPUT}\"" ; \
		echo "	@echo \" \"" ; \
		echo "" ; \
		echo ".PHONY: test_kata $${_KATA_TESTS}" ; \
		echo "" ; \
	} | \
	sed 's/kata/$</g' | \
	sed "s/KATA/$$(echo "$<" | tr '[:lower:]' '[:upper:]')/g" > $@
	@[ ! -f "tests.mk.tmp" ] || { \
		touch src/$</.gitkeep ; \
		git add tests.mk config.mk "$@" "src/$<" ; \
		git commit -m "Added $< to framework" tests.mk config.mk "$@" "src/$<" ; \
		rm tests.mk.tmp ; \
	}

#
# This target runs the test predicates defined in the kata's tests.mk file
#
${TEST_CASES}: ${TEST_FILES}
	@echo "${BOLD}Starting:${RESET_OUTPUT} $@..." | tr '_' ' '
	@_RESULT="" ; \
	for FILE in $^ ; \
	do \
		if ! echo "$@" | grep -q "$$(echo "$$FILE" | sed 's/bin\/\(.*\)\/.*/\1/g')" ; \
		then \
			continue ; \
		fi ; \
		if ${predicate_${@}} ; \
		then \
			continue ; \
		else \
			_RESULT="$${_RESULT} $${FILE}" ; \
		fi ; \
	done ; \
	if [ -z "$$_RESULT" ] ; \
	then \
		echo "${BOLD}${GREEN}PASS${RESET_OUTPUT}" ; \
	else \
		for FILE in $$_RESULT ; \
		do \
			echo "${BOLD}${RED}FAIL${RESET_OUTPUT}: ${BOLD}$$FILE${RESET_OUTPUT}" ; \
		done ; \
	fi
	@echo " "

.PHONY: test_all

