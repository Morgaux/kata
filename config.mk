#
# Makefile rules and variables for configuration of builds and tests
#

KATAS = fizzbuzz roman_numerals alphabet_cipher sort
TESTS = ${KATAS:%=test/%/tests.mk}
SRC   = ${KATAS:%=src/%}
BIN   = ${KATAS:%=bin/%}

config:
	@echo "config for katas:"
	@echo "KATAS =	${KATAS}" | sed 's/ \([^=]\)/\n\t\1/g'
	@echo "TESTS =	${TESTS}" | sed 's/ \([^=]\)/\n\t\1/g'
	@echo "SRC =	${SRC}" | sed 's/ \([^=]\)/\n\t\1/g'
	@echo "BIN =	${BIN}" | sed 's/ \([^=]\)/\n\t\1/g'
	@echo ""

${BIN} ${SRC} ${KATAS:%=test/%}:
	@mkdir -p $@

${KATAS}:
	@[ -f "test/$@/tests.mk" ] || { \
		echo "Creating new kata: $@..." ; \
		echo "" ; \
	}

.PHONY: config ${KATAS}

