#
# _ROMAN_TESTS for a fizz buzz implementation
#

_ROMAN_TESTS = test_roman_file_is_executable                         \
               test_roman_input_line_count_matches_output_line_count \
               test_roman_powers_of_10_are_correct                   \
               test_roman_1_to_20_are_correct                        \
               test_roman_100_random_values_are_correct              \
               test_roman_correctly_converts_multiple_inputs

_ROMAN_FILES = bin/roman_numerals/python_implementation  \
               bin/roman_numerals/shell_implementation   \
               bin/roman_numerals/haskell_implementation \
               bin/roman_numerals/sed_implementation

predicate_test_roman_file_is_executable = [ -x "$$FILE" ] >/dev/null 2>&1 
predicate_test_roman_input_line_count_matches_output_line_count = _COUNT="$$((RANDOM / 100))" ; [ "$$(awk "BEGIN {for (j = 1; j <= $$_COUNT; j++) print j}" | "$$FILE" | wc -l)" -eq "$$_COUNT" ] >/dev/null 2>&1 
predicate_test_roman_powers_of_10_are_correct = [ "$$(echo '1'     | "$$FILE")" = "I"          ] >/dev/null 2>&1 && \
                                      [ "$$(echo '10'    | "$$FILE")" = "X"          ] >/dev/null 2>&1 && \
                                      [ "$$(echo '100'   | "$$FILE")" = "C"          ] >/dev/null 2>&1 && \
                                      [ "$$(echo '1000'  | "$$FILE")" = "M"          ] >/dev/null 2>&1 && \
                                      [ "$$(echo '10000' | "$$FILE")" = "MMMMMMMMMM" ] >/dev/null 2>&1
predicate_test_roman_1_to_20_are_correct = [ "$$(echo '1'  | "$$FILE")" = "I"    ] >/dev/null 2>&1 && \
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
                                 [ "$$(echo '20' | "$$FILE")" = "XX"   ] >/dev/null 2>&1
predicate_test_roman_100_random_values_are_correct = [ -z "$$(for i in $$(awk 'BEGIN {for (j = 1; j <= 100; j++) print j}') ; \
		do \
			_NUM="$$RANDOM" ; \
			if [ "$$(echo "$$_NUM" | \
				"$$FILE" | \
				sed 's/CCCCM/DC/g; s/CCCM/DCC/g; s/CCM/DCCC/g; s/CM/DCCCC/g; s/M/DD/g;       \
				     s/CCCCD/C/g;  s/CCCD/CC/g;  s/CCD/CCC/g;  s/CD/CCCC/g;  s/D/CCCCC/g;    \
				     s/XXXXC/LX/g; s/XXXC/LXX/g; s/XXC/LXXX/g; s/XC/LXXXX/g; s/C/LL/g;       \
				     s/XXXXL/X/g;  s/XXXL/XX/g;  s/XXL/XXX/g;  s/XL/XXXX/g;  s/L/XXXXX/g;    \
				     s/IIIIX/VI/g; s/IIIX/VII/g; s/IIX/VIII/g; s/IX/VIIII/g; s/X/VV/g;       \
				     s/IIIIV/I/g;  s/IIIV/II/g;  s/IIV/III/g;  s/IV/IIII/g;  s/V/IIIII/g;' | wc -c)" -eq "$$(($$_NUM + 1))" ] >/dev/null 2>&1 ; \
			then echo "" ; \
			else echo "FAIL" ; \
			fi ; \
		done)" ]
predicate_test_roman_correctly_converts_multiple_inputs = [ "$$({ echo "1" ; echo "2" ; echo "3" ; echo "4" ; } | "$$FILE" | tr '\n' ' ' | sed 's/ //g')" = "IIIIIIIV" ] >/dev/null 2>&1 

test_roman_numerals: ${_ROMAN_TESTS}
	@echo "${YELLOW}All roman tests completed...${RESET}"
	@echo " "

.PHONY: test_roman_numerals ${_ROMAN_TESTS}

