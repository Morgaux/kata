#
# Makefile rules and variables for configuration of builds and tests
#

KATAS = fizzbuzz roman_numerals alphabet_cipher sort
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

${BIN} ${SRC} ${KATAS:%=test/%}:
	@mkdir -p $@

${KATAS}:
	@[ -f "test/$@/tests.mk" ] || { \
		echo "Creating new kata: $@..." ; \
		echo "" ; \
	}

.PHONY: config ${KATAS}

