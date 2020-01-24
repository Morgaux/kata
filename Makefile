#
# main makefile for kata
#

KATAS = fizzbuzz roman
TESTS = ${KATAS:%=test/%/tests.mk}
SRC   = ${KATAS:%=src/%}
BIN   = ${KATAS:%=bin/%}

all: config clean test_all

include ${TESTS}

TEST_CASES = ${_FIZZBUZZ_TESTS}
TEST_FILES = ${_FIZZBUZZ_FILES}

config:
	@echo "config for katas:"
	@echo "KATAS =	${KATAS}"
	@echo "TESTS =	${TESTS}"
	@echo " "
	@echo "SRC =	${SRC}"
	@echo "BIN =	${BIN}"
	@echo " "

clean:
	@rm -rf ${BIN} src/*/*.o src/*/*.hi

test_all: test_fizzbuzz test_roman

${TEST_CASES}: ${TEST_FILES}
	@echo "Starting: $@..." | tr '_' ' '
	@_RESULT="" ; \
	for FILE in $^ ; \
	do \
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

${BIN}:
	@mkdir -p $@

bin/%/python_implementation: src/%/python_implementation.py bin/%
	@cp $< $@
	@chmod 755 $@

bin/%/shell_implementation: src/%/shell_implementation.sh bin/%
	@cp $< $@
	@chmod 755 $@

bin/%/sed_implementation: src/%/sed_implementation.sed bin/%
	@cp $< $@
	@chmod 755 $@

bin/%/awk_implementation: src/%/awk_implementation.awk bin/%
	@cp $< $@
	@chmod 755 $@

bin/%/haskell_implementation: src/%/haskell_implementation.hs bin/%
	@ghc -o $@ $<

.PHONY: all clean config test-all

