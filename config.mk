#
# Makefile rules and variables for configuration of builds and tests
#

include colors.mk

KATAS = fizzbuzz              \
        roman_numerals        \
        alphabet_cipher       \
        sort                  \
        utc_to_unix_timestamp
TESTS = ${KATAS:%=test/%/tests.mk}
SRC   = ${KATAS:%=src/%}
BIN   = ${KATAS:%=bin/%}

config:
	@echo "${BOLD}config for katas:${RESET_OUTPUT}"
	@echo "${BOLD}KATAS${RESET_OUTPUT} =	${KATAS}" | sed 's/ \([^=]\)/\n\t\1/g'
	@echo "${BOLD}TESTS${RESET_OUTPUT} =	${TESTS}" | sed 's/ \([^=]\)/\n\t\1/g'
	@echo "${BOLD}SRC${RESET_OUTPUT} =	${SRC}" | sed 's/ \([^=]\)/\n\t\1/g'
	@echo "${BOLD}BIN${RESET_OUTPUT} =	${BIN}" | sed 's/ \([^=]\)/\n\t\1/g'
	@echo " "

${BIN} ${SRC} ${KATAS:%=test/%}:
	@mkdir -p $@

${KATAS}:
	@[ -f "test/$@/tests.mk" ] || { \
		echo "${GREEN}Creating new kata: $@...${RESET_OUTPUT}" ; \
		echo "" ; \
	}

.PHONY: config ${KATAS}

