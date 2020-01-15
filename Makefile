#
# main makefile for kata
#

KATAS = src/fizzbuzz
TESTS = ${KATAS:src/%=test/%}

DIRS = bin/fizzbuzz

all: ${DIRS} clean config test

clean:
	@rm -rf bin/*/*

config:
	@echo "config for katas:"
	@echo "KATAS =	${KATAS}"
	@echo "TESTS =	${TESTS}"
	@echo " "

test:
	@echo "Starting tests for all katas..."
	@for TEST in ${TESTS}        ;  \
	do                              \
		echo " "             ;  \
		_CWD_="$$(pwd)"      ;  \
		cd "$$TEST"          && \
			make -s      && \
			cd "$$_CWD_" ;  \
	done
	@echo ""

${DIRS}:
	@mkdir -p $@

.PHONY: all clean config test

