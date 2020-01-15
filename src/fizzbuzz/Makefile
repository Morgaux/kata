#
# Builds for fizz buzz implementations in src
#

BIN = ../../bin/fizzbuzz/python-implementation  \
      ../../bin/fizzbuzz/shell-implementation   \
      ../../bin/fizzbuzz/haskell-implementation

all: config ${BIN}

config:
	@echo "config for FizzBuzz builds:"
	@echo "NONE"
	@echo " "

../../bin/fizzbuzz/python-implementation: fizzbuzz.py
	@cp $< $@
	@chmod 755 $@

../../bin/fizzbuzz/shell-implementation: fizzbuzz.sh
	@cp $< $@
	@chmod 755 $@

../../bin/fizzbuzz/haskell-implementation: fizzbuzz.hs
	@ghc -o $@ $<

.PHONY: all config

