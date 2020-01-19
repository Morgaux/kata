#
# Builds for roman numeral implementations in src
#

BIN = ../../bin/roman/python-implementation

all: config ${BIN}

config:
	@echo "config for Roman Numeral builds:"
	@echo "NONE"
	@echo " "

../../bin/roman/python-implementation: roman.py
	@cp $< $@
	@chmod 755 $@

.PHONY: all config

