#
# Tests for a roman numeral converter implementation
#

TESTS = test_file_is_executable

FILES = ../../bin/roman/python-implementation

all: config ${TESTS}

config:
	@echo "config for Roman Numeral tests:"
	@echo "FILES:	" ${FILES} | sed 's/ /\n\t/g'
	@echo "TESTS:	" ${TESTS} | sed 's/ /\n\t/g'
	@echo " "

test: ${TESTS}
	@echo "All tests completed..."
	@echo " "

${TESTS}: ${FILES}

${FILES}:
	@echo "Building $@..." | tr '_' ' '
	@cd ../../src/roman && make $@
	@echo " "

# don't put this target in the TESTS, it's just a template, copy for new tests
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

test_file_is_executable:
	@echo "Starting: $@..." | tr '_' ' '
	@for FILE in ${FILES} ; \
	do \
		if [ -x "$$FILE" ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

.PHONY: all config test test_template ${TESTS}
