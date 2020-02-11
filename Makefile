#
# Main Makefile for kata unit tests and builds
#

include config.mk

all: clean ${TESTS}

include builds.mk

${TESTS}:
	@make -s -f ${@:test_%=test/%/tests.mk} all

.SILENT:

.PHONY: all ${TESTS}

