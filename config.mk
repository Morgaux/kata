#
# Makefile rules and variables for configuration of builds and tests
#

KATAS = fizzbuzz roman
TESTS = ${KATAS:%=test/%/tests.mk}
SRC   = ${KATAS:%=src/%}
BIN   = ${KATAS:%=bin/%}

config:
	@echo "config for katas:"
	@echo "KATAS =	${KATAS}"
	@echo "TESTS =	${TESTS}"
	@echo " "
	@echo "SRC =	${SRC}"
	@echo "BIN =	${BIN}"
	@echo " "

${BIN}:
	@mkdir -p $@

.PHONY: config

