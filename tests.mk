#
# Makefile rules and targets for tests
#

include config.mk
include ${TESTS}

TEST_CASES = ${_FIZZBUZZ_TESTS} ${_ROMAN_TESTS}
TEST_FILES = ${_FIZZBUZZ_FILES} ${_ROMAN_FILES}

test_all: test_fizzbuzz test_roman

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

