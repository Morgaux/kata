#
# Makefile rules to build executables
#

include config.mk

# Helper targets {{{
clean:
	@rm -rf bin src/*/*.o src/*/*.hi
# Helper targets }}}

# Target to create kata specific directories {{{
${KATAS:%=bin/%}:
	@mkdir -p $@

${KATAS:%=src/%}:
	@mkdir -p $@
# Target to create kata specific directories }}}

# Source targets {{{
# These targets create simple Hello World placeholder programs, this allows a
# new implementation for any kata to be started by simply adding it to the list
# of file to test in test/<KATA>/tests.mk.

# Create a python source file {{{
src/%/python_implementation.py: src/%
	@[ -f "$@" ] || { \
		echo "#!/usr/bin/env python3" ; \
		echo "" ; \
		echo "# A python $$(basename $<) implementation" ; \
		echo "" ; \
		echo "import sys" ; \
		echo "" ; \
		echo "def main(argv):" ; \
		echo "	print(\"Hello World!\")" ; \
		echo "" ; \
		echo "if __name__ == \"main\":" ; \
		echo "	main(sys.argv)" ; \
		echo "" ; \
	} > $@ 
# Create a python source file }}}

# Create a shell source file {{{
src/%/shell_implementation.sh: src/%
	@[ -f "$@" ] || { \
		echo "#!/bin/sh" ; \
		echo "" ; \
		echo "# A POSIX  $$(basename $<) implementation" ; \
		echo "" ; \
		echo "echo \"Hello World!\"" ; \
		echo "" ; \
	} > $@
# Create a shell source file }}}

# Create a AWK source file {{{
src/%/awk_implementation.awk: src/%
	@[ -f "$@" ] || { \
		echo "#!/usr/bin/awk -f" ; \
		echo "# note, this shebang is reasonably portable, however," ; \
		echo "# for best portability or to pass aditional arguments" ; \
		echo "# to the interpreter a shell wrapper should be used." ; \
		echo "" ; \
		echo "# A POSIX AWK $$(basename $< implementation)" ; \
		echo "" ; \
		echo "BEGIN {print \"Hello World!\"; exit}" ; \
		echo "" ; \
	} > $@
# Create a AWK source file }}}

# Create a haskell source file {{{
src/%/haskell_implementation.hs: src/%
	@[ -f "$@" ] || { \
		echo "--" ; \
		echo "-- A Haskell $$(basename $<) implementation" ; \
		echo "--" ; \
		echo "" ; \
		echo "main :: IO ()" ; \
		echo "main = putStrLn \"Hello World\"" ; \
		echo "" ; \
	} > $@
# Create a haskell source file }}}

# Create a java source file {{{
src/%/java_implementation.java: src/%
	@[ -f "$@" ] || { \
		echo "/**" ; \
		echo " *" ; \
		echo " * A Java $$(basename $<) implementation" ; \
		echo " *" ; \
		echo " */" ; \
		echo "" ; \
		echo "class Kata {" ; \
		echo "	public static void main(String[] argv) {" ; \
		echo "	System.out.println(\"Hello World!\");" ; \
		echo "	}" ; \
		echo "}" ; \
		echo "" ; \
	} > $@
# Create a java source file }}}

# Create a c source file {{{
# This consists of a foo.c and matching foo.h file
src/%/c_implementation.h: src/%
	@[ -f "$@" ] || { \
		echo "/**" ; \
		echo " * Header file for a C $$(basename $<) implementation" ; \
		echo " */" ; \
		echo "" ; \
		echo "int main(char[], int);" ; \
		echo "" ; \
	} > $@

src/%/c_implementation.c: src/% src/%/c_implementation.h
	@[ -f "$@" ] || { \
		echo "/**" ; \
		echo " * A C $$(basename $<) implementation" ; \
		echo " */" ; \
		echo "" ; \
		echo "#include <stdio.h>" ; \
		echo "" ; \
		echo "#include \"c_implementation.h\"" ; \
		echo "" ; \
		echo "int main(char argv[], int argc) {" ; \
		echo "	printf(\"Hello World!\\\\n\");" ; \
		echo "" ; \
		echo "	return 0;" ; \
		echo "}" ; \
		echo "" ; \
	} > $@
# Create a c source file }}}

# Source targets }}}

# Build targets {{{

# Python Build {{{
bin/%/python_implementation: src/%/python_implementation.py bin/%
	@cp $< $@
	@chmod 755 $@
# Python Build }}}

# Shell Build {{{
bin/%/shell_implementation: src/%/shell_implementation.sh bin/%
	@cp $< $@
	@chmod 755 $@
# Shell Build }}}

# AWK Build {{{
bin/%/awk_implementation: src/%/awk_implementation.awk bin/%
	@{ \
		echo '#!/bin/sh' ; \
		echo '# vi: syntax=awk' ; \
		echo '# POSIX sh / awk polyglot wrapper' ; \
		echo '' ; \
		echo 'true + /; exec awk -f "$$0" -- "$$@"; exit; / {}' ; \
		echo '' ; \
		echo '# pure awk from here' ; \
		echo '' ; \
	} > $@
	@cat $< >> $@
	@chmod 755 $@
# AWK Build }}}

# Haskell Build {{{
bin/%/haskell_implementation: src/%/haskell_implementation.hs bin/%
	@ghc -o $@ $< >/dev/null
# Haskell Build }}}

# Java Build {{{
bin/%/java_implementation: src/%/java_implementation.java bin/%
	@javac -d bin/$* $< # this generates a Kata.class file
	@{ \
		echo '#!/bin/sh' ; \
		echo '# POSIX sh wrapper to call the Java classfile' ; \
		echo '' ; \
		echo '# Setup' ; \
		echo 'OLD_DIR="$$(pwd)"' ; \
		echo 'EX_CODE="0"' ; \
		echo '' ; \
		echo '# Go to classfile location' ; \
		echo 'cd bin/$*' ; \
		echo '' ; \
		echo '# Attempt to run classfile' ; \
		echo '[ -x "$$(command -v java)" ] && java Kata' ; \
		echo '' ; \
		echo '# Determine success' ; \
		echo 'EX_CODE="$$?"' ; \
		echo '' ; \
		echo '# Return to origin' ; \
		echo 'cd "$$OLD_DIR"' ; \
		echo '' ; \
		echo '# Exit result' ; \
		echo 'exit "$$EX_CODE"' ; \
		echo '' ; \
	} > $@
	@chmod 755 $@
# Java Build }}}

# C Build {{{
bin/%/c_implementation: src/%/c_implementation.c bin/%
	@${CC} -o $@ $< >/dev/null
# C Build }}}

# Build targets }}}

.PHONY: clean

.SECONDARY:

