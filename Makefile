#
# main makefile for kata
#

KATAS = fizzbuzz roman
TESTS = ${KATAS:%=test/%}
SRC   = ${KATAS:%=src/%}
BIN   = ${KATAS:%=bin/%}
DIRS  = ${BIN}

all: ${DIRS} clean config test-all

clean:
	@rm -rf bin/*/*

config:
	@echo "config for katas:"
	@echo "KATAS =	${KATAS}"
	@echo "TESTS =	${TESTS}"
	@echo " "

test-all:
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

.PHONY: all clean config test-all

