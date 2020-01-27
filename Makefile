#
# main makefile for kata
#

all: config clean test_all

include config.mk
include builds.mk
include tests.mk

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

${BIN}:
	@mkdir -p $@

.PHONY: all clean config test-all

