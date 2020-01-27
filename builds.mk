#
# Makefile rules to build executables
#

clean:
	@rm -rf ${BIN} src/*/*.o src/*/*.hi

bin/%/python_implementation: src/%/python_implementation.py bin/%
	@cp $< $@
	@chmod 755 $@

bin/%/shell_implementation: src/%/shell_implementation.sh bin/%
	@cp $< $@
	@chmod 755 $@

bin/%/sed_implementation: src/%/sed_implementation.sed bin/%
	@{ \
		echo "#!/bin/sh" ; \
		echo "# vi:syntax=sed" ; \
		echo "" ; \
		echo "# gloriously ugly exec hack (portable sh/sed)" ; \
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
	} > $@
	@cat $< >> $@
	@chmod 755 $@

bin/%/awk_implementation: src/%/awk_implementation.awk bin/%
	@cp $< $@
	@chmod 755 $@

bin/%/haskell_implementation: src/%/haskell_implementation.hs bin/%
	@ghc -o $@ $<

.PHONY: clean

