#
# _ROMAN_TESTS for a fizz buzz implementation
#

_ROMAN_TESTS = test_roman_file_is_executable                         \
               test_roman_input_line_count_matches_output_line_count \
               test_roman_powers_of_10_are_correct                   \
               test_roman_1_to_20_are_correct                        \
               test_roman_100_random_values_are_correct              \
               test_roman_correctly_converts_multiple_inputs

_ROMAN_FILES = bin/roman/python_implementation \
               bin/roman/shell_implementation  \
               bin/fizzbuzz/sed_implementation

test_roman: ${_ROMAN_TESTS}
	@echo "All roman tests completed..."
	@echo " "

${_ROMAN_TESTS}: ${_ROMAN_FILES}

test_roman_file_is_executable:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if [ -x "$$FILE" ] >/dev/null 2>&1 ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_input_line_count_matches_output_line_count:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		_COUNT="$$((RANDOM / 100))" ; \
		if [ "$$(awk "BEGIN {for (j = 1; j <= $$_COUNT; j++) print j}" | "$$FILE" | wc -l)" -eq "$$_COUNT" ] >/dev/null 2>&1 ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_powers_of_10_are_correct:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if [ "$$(echo '0'     | "$$FILE")" = ""           ] >/dev/null 2>&1 && \
		   [ "$$(echo '1'     | "$$FILE")" = "I"          ] >/dev/null 2>&1 && \
		   [ "$$(echo '10'    | "$$FILE")" = "X"          ] >/dev/null 2>&1 && \
		   [ "$$(echo '100'   | "$$FILE")" = "C"          ] >/dev/null 2>&1 && \
		   [ "$$(echo '1000'  | "$$FILE")" = "M"          ] >/dev/null 2>&1 && \
		   [ "$$(echo '10000' | "$$FILE")" = "MMMMMMMMMM" ] >/dev/null 2>&1 ;  \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_1_to_20_are_correct:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if [ "$$(echo '1'  | "$$FILE")" = "I"    ] >/dev/null 2>&1 && \
		   [ "$$(echo '2'  | "$$FILE")" = "II"   ] >/dev/null 2>&1 && \
		   [ "$$(echo '3'  | "$$FILE")" = "III"  ] >/dev/null 2>&1 && \
		   [ "$$(echo '4'  | "$$FILE")" = "IV"   ] >/dev/null 2>&1 && \
		   [ "$$(echo '5'  | "$$FILE")" = "V"    ] >/dev/null 2>&1 && \
		   [ "$$(echo '6'  | "$$FILE")" = "VI"   ] >/dev/null 2>&1 && \
		   [ "$$(echo '7'  | "$$FILE")" = "VII"  ] >/dev/null 2>&1 && \
		   [ "$$(echo '8'  | "$$FILE")" = "IIX"  ] >/dev/null 2>&1 && \
		   [ "$$(echo '9'  | "$$FILE")" = "IX"   ] >/dev/null 2>&1 && \
		   [ "$$(echo '10' | "$$FILE")" = "X"    ] >/dev/null 2>&1 && \
		   [ "$$(echo '11' | "$$FILE")" = "XI"   ] >/dev/null 2>&1 && \
		   [ "$$(echo '12' | "$$FILE")" = "XII"  ] >/dev/null 2>&1 && \
		   [ "$$(echo '13' | "$$FILE")" = "XIII" ] >/dev/null 2>&1 && \
		   [ "$$(echo '14' | "$$FILE")" = "XIV"  ] >/dev/null 2>&1 && \
		   [ "$$(echo '15' | "$$FILE")" = "XV"   ] >/dev/null 2>&1 && \
		   [ "$$(echo '16' | "$$FILE")" = "XVI"  ] >/dev/null 2>&1 && \
		   [ "$$(echo '17' | "$$FILE")" = "XVII" ] >/dev/null 2>&1 && \
		   [ "$$(echo '18' | "$$FILE")" = "XIIX" ] >/dev/null 2>&1 && \
		   [ "$$(echo '19' | "$$FILE")" = "XIX"  ] >/dev/null 2>&1 && \
		   [ "$$(echo '20' | "$$FILE")" = "XX"   ] >/dev/null 2>&1 ;  \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_100_random_values_are_correct:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		_RESULT="PASS" ; \
		for i in $$(awk 'BEGIN {for (j = 1; j <= 100; j++) print j}') ; \
		do \
			_NUM="$$RANDOM" ; \
			if [ "$$(echo "$$_NUM" | \
				"$$FILE" | \
				sed 's/CCCCM/DC/g; s/CCCM/DCC/g; s/CCM/DCCC/g; s/CM/DCCCC/g; s/M/DD/g;       \
				     s/CCCCD/C/g;  s/CCCD/CC/g;  s/CCD/CCC/g;  s/CD/CCCC/g;  s/D/CCCCC/g;    \
				     s/XXXXC/LX/g; s/XXXC/LXX/g; s/XXC/LXXX/g; s/XC/LXXXX/g; s/C/LL/g;       \
				     s/XXXXL/X/g;  s/XXXL/XX/g;  s/XXL/XXX/g;  s/XL/XXXX/g;  s/L/XXXXX/g;    \
				     s/IIIIX/VI/g; s/IIIX/VII/g; s/IIX/VIII/g; s/IX/VIIII/g; s/X/VV/g;       \
				     s/IIIIV/I/g;  s/IIIV/II/g;  s/IIV/III/g;  s/IV/IIII/g;  s/V/IIIII/g;' | \
				wc -c)" -eq "$$(($$_NUM + 1))" ] >/dev/null 2>&1 ; \
			then \
				_RESULT="PASS" ; \
			else \
				_RESULT="FAIL" ; \
			fi ; \
		done ; \
		if [ "$$_RESULT" = "PASS" ] ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_correctly_converts_multiple_inputs:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if [ "$$({ \
			echo "0" ; \
			echo "1" ; \
			echo "2" ; \
			echo "3" ; \
			echo "4" ; \
		} | "$$FILE" | tr '\n' ' ' | sed 's/ //g')" = "IIIIIIIV" ] >/dev/null 2>&1 ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

test_roman_template:
	@echo "Starting: $@..." | sed 's/test_roman/test_that/g' | tr '_' ' '
	@for FILE in ${_ROMAN_FILES} ; \
	do \
		if false >/dev/null 2>&1 ; \
		then \
			echo "PASS" ; \
		else \
			echo "FAIL for "$$(basename "$$FILE")"" ; \
		fi ; \
	done
	@echo " "

.PHONY: test_roman ${_ROMAN_TESTS}

