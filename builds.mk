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
	@cp $< $@
	@chmod 755 $@

bin/%/awk_implementation: src/%/awk_implementation.awk bin/%
	@cp $< $@
	@chmod 755 $@

bin/%/haskell_implementation: src/%/haskell_implementation.hs bin/%
	@ghc -o $@ $<

.PHONY: clean

