#
# main makefile for kata
#

KATAS = fizzbuzz roman
TESTS = ${KATAS:%=test/%/tests.mk}
SRC   = ${KATAS:%=src/%}
BIN   = ${KATAS:%=bin/%}

all: config clean test_all

include ${TESTS}

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

# don't put this target in the tests, it's just a template, copy for new tests
test_template:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if false ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
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

