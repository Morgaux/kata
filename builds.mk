#
# Makefile rules to build executables
#

include config.mk

# Helper targets {{{
clean:
	@rm -rf bin src/*/*.o src/*/*.hi
# Helper targets }}}

# Target to create kata specific bin directories {{{
${KATAS:%=bin/%}:
	@mkdir -p $@
# Target to create kata specific bin directories }}}

# Source targets {{{

# Create a python source file {{{
src/*/python_implementation.py:
	@#TODO
	@touch $@
# Create a python source file }}}

# Create a shell source file {{{
src/*/shell_implementation.sh:
	@#TODO
	@touch $@
# Create a shell source file }}}

# Create a SED source file {{{
src/*/sed_implementation.sed:
	@#TODO
	@touch $@
# Create a SED source file }}}

# Create a AWK source file {{{
src/*/awk_implementation.awk:
	@#TODO
	@touch $@
# Create a AWK source file }}}

# Create a haskell source file {{{
src/*/haskell_implementation.hs:
	@#TODO
	@touch $@
# Create a haskell source file }}}

# Create a java source file {{{
src/*/java_implementation.java:
	@#TODO
	@touch $@
# Create a java source file }}}

# Create a c source file {{{
src/*/c_implementation.c:
	@#TODO
	@touch $@
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

# SED Build {{{
bin/%/sed_implementation: src/%/sed_implementation.sed bin/%
	@{ \
		echo '#!/bin/sh' ; \
		echo '# vi:syntax=sed' ; \
		echo '# POSIX sh / sed polyglot wrapper' ; \
		echo '' ; \
		echo 'b ()' ; \
		echo '{' ; \
		echo 'x' ; \
		echo '}' ; \
		echo '' ; \
		echo "i\\" ; \
		echo 'f true ; then exec sed -f "$$0" "$$@" ; fi' ; \
		echo '' ; \
		echo ':()' ; \
		echo '' ; \
		echo '# pure sed from here' ; \
		echo '' ; \
	} > $@
	@cat $< >> $@
	@chmod 755 $@
# SED Build }}}

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

