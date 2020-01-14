#
# main makefile for kata
#

KATAS = src/fizzbuzz
TESTS = ${KATAS:src/%=test/%}

all: config test

config:
	@echo "config for katas:"
	@echo "KATAS =	${KATAS}"
	@echo "TESTS =	${TESTS}"
	@echo " "

test:
	@echo "Starting tests for all katas..."
	@for TEST in ${TESTS}        ;  \
	do                              \
		_CWD_="$$(pwd)"      ;  \
		cd "$$TEST"          && \
			make         && \
			cd "$$_CWD_" ;  \
	done
	@echo ""

.PHONY: all config test

