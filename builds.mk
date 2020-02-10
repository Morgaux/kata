#
# Makefile rules to build executables
#

clean:
	@rm -rf bin src/*/*.o src/*/*.hi

bin/%/python_implementation: src/%/python_implementation.py bin/%
	@echo "Building $@..."
	@cp $< $@
	@chmod 755 $@
	@echo "DONE"
	@echo " "

bin/%/shell_implementation: src/%/shell_implementation.sh bin/%
	@echo "Building $@..."
	@cp $< $@
	@chmod 755 $@
	@echo "DONE"
	@echo " "

bin/%/sed_implementation: src/%/sed_implementation.sed bin/%
	@echo "Building $@..."
	@{ \
		echo "#!/bin/sh" ; \
		echo "# vi:syntax=sed" ; \
		echo "# POSIX sh / sed polyglot wrapper" ; \
		echo "" ; \
		echo "b ()" ; \
		echo "{" ; \
		echo "x" ; \
		echo "}" ; \
		echo "" ; \
		echo "i\\" ; \
		echo "f true ; then exec sed -f "$0" "$@" ; fi" ; \
		echo "" ; \
		echo ":()" ; \
		echo "" ; \
		echo "# pure sed from here" ; \
		echo "" ; \
	} > $@
	@cat $< >> $@
	@chmod 755 $@
	@echo "DONE"
	@echo " "

bin/%/awk_implementation: src/%/awk_implementation.awk bin/%
	@echo "Building $@..."
	@{ \
		echo "#!/bin/sh" ; \
		echo "# vi: syntax=awk" ; \
		echo "# POSIX sh / awk polyglot wrapper" ; \
		echo "" ; \
		echo "true + /; exec awk -f "$0" -- "$@"; exit; / {}" ; \
		echo "" ; \
		echo "# pure awk from here" ; \
		echo "" ; \
	} > $@
	@cat $< >> $@
	@chmod 755 $@
	@echo "DONE"
	@echo " "

bin/%/haskell_implementation: src/%/haskell_implementation.hs bin/%
	@echo "Building $@..."
	@ghc -o $@ $< >/dev/null
	@echo "DONE"
	@echo " "

.PHONY: clean

