#
# Makefile rules and targets for tests
#

include ${TESTS}

TEST_CASES = ${_FIZZBUZZ_TESTS} ${_ROMAN_TESTS} ${_KATA_TESTS}
TEST_FILES = ${_FIZZBUZZ_FILES} ${_ROMAN_FILES} ${_KATA_FILES}

test_all: ${KATAS:%=test_%}

${TESTS}: test/%/tests.mk : % test/% src/%
	# create a kata specific tests.mk file
	@[ -f "$@" ] || { \
		echo "#" ; \
		echo "# _KATA_TESTS for a kata implementation" ; \
		echo "#" ; \
		echo "" ; \
		echo "_KATA_TESTS = test_kata_file_is_executable" ; \
		echo "" ; \
		echo "_KATA_FILES = bin/kata/python_implementation" ; \
		echo "" ; \
		echo "predicate_test_kata_file_is_executable = [ -x  "\$$\$$FILE" ]" ; \
		echo "" ; \
		echo "test_kata: \$${_KATA_TESTS}" ; \
		echo "	@echo "All kata tests completed..."" ; \
		echo "	@echo " "" ; \
		echo "" ; \
		echo ".PHONY: test_kata $${_KATA_TESTS}" ; \
		echo "" ; \
	} | \
	sed 's/kata/$</g' | \
	sed "s/KATA/$$(echo "$<" | tr '[:lower:]' '[:upper:]')/g" > $@
	# update the master tests.mk file
	@[ -f "$@" ] || { \
		sed "s/KATA_\(.*}\)\$$/$$(echo "$<" | tr [:lower:] [:upper:])_\1 \$${_KATA_\1/g" < tests.mk > tests.mk.tmp ; \
		rm tests.mk ; \
		mv tests.mk.tmp tests.mk ; \
	}

${TEST_CASES}: ${TEST_FILES}
	@echo "Starting: $@..." | tr '_' ' '
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
		echo "PASS" ; \
	else \
		for FILE in $$_RESULT ; \
		do \
			echo "FAIL: $$FILE" ; \
		done ; \
	fi
	@echo " "

.PHONY: test_all

