#
# Tests for a leap year checker implementation
#

#
# The interface is as follows:
# - positive numbers are read on per line
# - if the number represents a leap year, "true" is output
# - else "false" is output
#

#
# Leap years are defined as follows:
# - Leap years can only be divisible by 4
# - Years divisible by 100 can only be leap years if also divisible by 400
# - Years divisible by 400 are leap years
# - Years divisible by 4 but not divisible by 100 are leap years
#

# Setup {{{
KATA = "LEAP_YEAR"

TEST_CASES = test_file_is_executable                 \
             test_years_divisible_by_4               \
             test_years_not_divisible_by_4           \
             test_years_divisible_by_100_but_not_400 \
             test_years_divisible_by_400
TEST_FILES = bin/leap_year/haskell_implementation

all: message_before ${TEST_CASES}

include test/tests.mk
include builds.mk
# Setup }}}

# Test case predicates {{{

# Test cases for years divisible by 4 {{{

# Multiples of 4 under 100 {{{
predicate_test_4  = [ "$$(echo "4"  | $$FILE)" = "true" ]
predicate_test_8  = [ "$$(echo "8"  | $$FILE)" = "true" ]
predicate_test_12 = [ "$$(echo "12" | $$FILE)" = "true" ]
predicate_test_16 = [ "$$(echo "16" | $$FILE)" = "true" ]
predicate_test_20 = [ "$$(echo "20" | $$FILE)" = "true" ]
predicate_test_24 = [ "$$(echo "24" | $$FILE)" = "true" ]
predicate_test_28 = [ "$$(echo "28" | $$FILE)" = "true" ]
predicate_test_32 = [ "$$(echo "32" | $$FILE)" = "true" ]
predicate_test_36 = [ "$$(echo "36" | $$FILE)" = "true" ]
predicate_test_40 = [ "$$(echo "40" | $$FILE)" = "true" ]
predicate_test_44 = [ "$$(echo "44" | $$FILE)" = "true" ]
predicate_test_48 = [ "$$(echo "48" | $$FILE)" = "true" ]
predicate_test_52 = [ "$$(echo "52" | $$FILE)" = "true" ]
predicate_test_56 = [ "$$(echo "56" | $$FILE)" = "true" ]
predicate_test_60 = [ "$$(echo "60" | $$FILE)" = "true" ]
predicate_test_64 = [ "$$(echo "64" | $$FILE)" = "true" ]
predicate_test_68 = [ "$$(echo "68" | $$FILE)" = "true" ]
predicate_test_72 = [ "$$(echo "72" | $$FILE)" = "true" ]
predicate_test_76 = [ "$$(echo "76" | $$FILE)" = "true" ]
predicate_test_80 = [ "$$(echo "80" | $$FILE)" = "true" ]
predicate_test_84 = [ "$$(echo "84" | $$FILE)" = "true" ]
predicate_test_88 = [ "$$(echo "88" | $$FILE)" = "true" ]
predicate_test_92 = [ "$$(echo "92" | $$FILE)" = "true" ]
predicate_test_96 = [ "$$(echo "96" | $$FILE)" = "true" ]
# Multiples of 4 under 100 }}}

# Multiples of 4 exclusively between 100 and 200 {{{
predicate_test_104 = [ "$$(echo "104" | $$FILE)" = "true" ]
predicate_test_108 = [ "$$(echo "108" | $$FILE)" = "true" ]
predicate_test_112 = [ "$$(echo "112" | $$FILE)" = "true" ]
predicate_test_116 = [ "$$(echo "116" | $$FILE)" = "true" ]
predicate_test_120 = [ "$$(echo "120" | $$FILE)" = "true" ]
predicate_test_124 = [ "$$(echo "124" | $$FILE)" = "true" ]
predicate_test_128 = [ "$$(echo "128" | $$FILE)" = "true" ]
predicate_test_132 = [ "$$(echo "132" | $$FILE)" = "true" ]
predicate_test_136 = [ "$$(echo "136" | $$FILE)" = "true" ]
predicate_test_140 = [ "$$(echo "140" | $$FILE)" = "true" ]
predicate_test_144 = [ "$$(echo "144" | $$FILE)" = "true" ]
predicate_test_148 = [ "$$(echo "148" | $$FILE)" = "true" ]
predicate_test_152 = [ "$$(echo "152" | $$FILE)" = "true" ]
predicate_test_156 = [ "$$(echo "156" | $$FILE)" = "true" ]
predicate_test_160 = [ "$$(echo "160" | $$FILE)" = "true" ]
predicate_test_164 = [ "$$(echo "164" | $$FILE)" = "true" ]
predicate_test_168 = [ "$$(echo "168" | $$FILE)" = "true" ]
predicate_test_172 = [ "$$(echo "172" | $$FILE)" = "true" ]
predicate_test_176 = [ "$$(echo "176" | $$FILE)" = "true" ]
predicate_test_180 = [ "$$(echo "180" | $$FILE)" = "true" ]
predicate_test_184 = [ "$$(echo "184" | $$FILE)" = "true" ]
predicate_test_188 = [ "$$(echo "188" | $$FILE)" = "true" ]
predicate_test_192 = [ "$$(echo "192" | $$FILE)" = "true" ]
predicate_test_196 = [ "$$(echo "196" | $$FILE)" = "true" ]
# Multiples of 4 exclusively between 100 and 200 }}}

# Multiples of 4 exclusively between 200 and 300 {{{
predicate_test_204 = [ "$$(echo "204" | $$FILE)" = "true" ]
predicate_test_208 = [ "$$(echo "208" | $$FILE)" = "true" ]
predicate_test_212 = [ "$$(echo "212" | $$FILE)" = "true" ]
predicate_test_216 = [ "$$(echo "216" | $$FILE)" = "true" ]
predicate_test_220 = [ "$$(echo "220" | $$FILE)" = "true" ]
predicate_test_224 = [ "$$(echo "224" | $$FILE)" = "true" ]
predicate_test_228 = [ "$$(echo "228" | $$FILE)" = "true" ]
predicate_test_232 = [ "$$(echo "232" | $$FILE)" = "true" ]
predicate_test_236 = [ "$$(echo "236" | $$FILE)" = "true" ]
predicate_test_240 = [ "$$(echo "240" | $$FILE)" = "true" ]
predicate_test_244 = [ "$$(echo "244" | $$FILE)" = "true" ]
predicate_test_248 = [ "$$(echo "248" | $$FILE)" = "true" ]
predicate_test_252 = [ "$$(echo "252" | $$FILE)" = "true" ]
predicate_test_256 = [ "$$(echo "256" | $$FILE)" = "true" ]
predicate_test_260 = [ "$$(echo "260" | $$FILE)" = "true" ]
predicate_test_264 = [ "$$(echo "264" | $$FILE)" = "true" ]
predicate_test_268 = [ "$$(echo "268" | $$FILE)" = "true" ]
predicate_test_272 = [ "$$(echo "272" | $$FILE)" = "true" ]
predicate_test_276 = [ "$$(echo "276" | $$FILE)" = "true" ]
predicate_test_280 = [ "$$(echo "280" | $$FILE)" = "true" ]
predicate_test_284 = [ "$$(echo "284" | $$FILE)" = "true" ]
predicate_test_288 = [ "$$(echo "288" | $$FILE)" = "true" ]
predicate_test_292 = [ "$$(echo "292" | $$FILE)" = "true" ]
predicate_test_296 = [ "$$(echo "296" | $$FILE)" = "true" ]
# Multiples of 4 exclusively between 200 and 300 }}}

# Random multiples of 4 but NOT 100 {{{
predicate_test_RANDOM_ending_in_04 = [ "$$(echo "$${RANDOM}04" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_08 = [ "$$(echo "$${RANDOM}08" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_12 = [ "$$(echo "$${RANDOM}12" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_16 = [ "$$(echo "$${RANDOM}16" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_20 = [ "$$(echo "$${RANDOM}20" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_24 = [ "$$(echo "$${RANDOM}24" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_28 = [ "$$(echo "$${RANDOM}28" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_32 = [ "$$(echo "$${RANDOM}32" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_36 = [ "$$(echo "$${RANDOM}36" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_40 = [ "$$(echo "$${RANDOM}40" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_44 = [ "$$(echo "$${RANDOM}44" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_48 = [ "$$(echo "$${RANDOM}48" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_52 = [ "$$(echo "$${RANDOM}52" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_56 = [ "$$(echo "$${RANDOM}56" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_60 = [ "$$(echo "$${RANDOM}60" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_64 = [ "$$(echo "$${RANDOM}64" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_68 = [ "$$(echo "$${RANDOM}68" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_72 = [ "$$(echo "$${RANDOM}72" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_76 = [ "$$(echo "$${RANDOM}76" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_80 = [ "$$(echo "$${RANDOM}80" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_84 = [ "$$(echo "$${RANDOM}84" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_88 = [ "$$(echo "$${RANDOM}88" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_92 = [ "$$(echo "$${RANDOM}92" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_96 = [ "$$(echo "$${RANDOM}96" | $$FILE)" = "true" ]
# Random multiples of 4 but NOT 100 }}}

# Combined predicate {{{
predicate_test_years_divisible_by_4 = ${predicate_test_4}                   && \
                                      ${predicate_test_8}                   && \
                                      ${predicate_test_12}                  && \
                                      ${predicate_test_16}                  && \
                                      ${predicate_test_20}                  && \
                                      ${predicate_test_24}                  && \
                                      ${predicate_test_28}                  && \
                                      ${predicate_test_32}                  && \
                                      ${predicate_test_36}                  && \
                                      ${predicate_test_40}                  && \
                                      ${predicate_test_44}                  && \
                                      ${predicate_test_48}                  && \
                                      ${predicate_test_52}                  && \
                                      ${predicate_test_56}                  && \
                                      ${predicate_test_60}                  && \
                                      ${predicate_test_64}                  && \
                                      ${predicate_test_68}                  && \
                                      ${predicate_test_72}                  && \
                                      ${predicate_test_76}                  && \
                                      ${predicate_test_80}                  && \
                                      ${predicate_test_84}                  && \
                                      ${predicate_test_88}                  && \
                                      ${predicate_test_92}                  && \
                                      ${predicate_test_96}                  && \
                                      ${predicate_test_104}                 && \
                                      ${predicate_test_108}                 && \
                                      ${predicate_test_112}                 && \
                                      ${predicate_test_116}                 && \
                                      ${predicate_test_120}                 && \
                                      ${predicate_test_124}                 && \
                                      ${predicate_test_128}                 && \
                                      ${predicate_test_132}                 && \
                                      ${predicate_test_136}                 && \
                                      ${predicate_test_140}                 && \
                                      ${predicate_test_144}                 && \
                                      ${predicate_test_148}                 && \
                                      ${predicate_test_152}                 && \
                                      ${predicate_test_156}                 && \
                                      ${predicate_test_160}                 && \
                                      ${predicate_test_164}                 && \
                                      ${predicate_test_168}                 && \
                                      ${predicate_test_172}                 && \
                                      ${predicate_test_176}                 && \
                                      ${predicate_test_180}                 && \
                                      ${predicate_test_184}                 && \
                                      ${predicate_test_188}                 && \
                                      ${predicate_test_192}                 && \
                                      ${predicate_test_196}                 && \
                                      ${predicate_test_204}                 && \
                                      ${predicate_test_208}                 && \
                                      ${predicate_test_212}                 && \
                                      ${predicate_test_216}                 && \
                                      ${predicate_test_220}                 && \
                                      ${predicate_test_224}                 && \
                                      ${predicate_test_228}                 && \
                                      ${predicate_test_232}                 && \
                                      ${predicate_test_236}                 && \
                                      ${predicate_test_240}                 && \
                                      ${predicate_test_244}                 && \
                                      ${predicate_test_248}                 && \
                                      ${predicate_test_252}                 && \
                                      ${predicate_test_256}                 && \
                                      ${predicate_test_260}                 && \
                                      ${predicate_test_264}                 && \
                                      ${predicate_test_268}                 && \
                                      ${predicate_test_272}                 && \
                                      ${predicate_test_276}                 && \
                                      ${predicate_test_280}                 && \
                                      ${predicate_test_284}                 && \
                                      ${predicate_test_288}                 && \
                                      ${predicate_test_292}                 && \
                                      ${predicate_test_296}                 && \
                                      ${predicate_test_RANDOM_ending_in_04} && \
                                      ${predicate_test_RANDOM_ending_in_08} && \
                                      ${predicate_test_RANDOM_ending_in_12} && \
                                      ${predicate_test_RANDOM_ending_in_16} && \
                                      ${predicate_test_RANDOM_ending_in_20} && \
                                      ${predicate_test_RANDOM_ending_in_24} && \
                                      ${predicate_test_RANDOM_ending_in_28} && \
                                      ${predicate_test_RANDOM_ending_in_32} && \
                                      ${predicate_test_RANDOM_ending_in_36} && \
                                      ${predicate_test_RANDOM_ending_in_40} && \
                                      ${predicate_test_RANDOM_ending_in_44} && \
                                      ${predicate_test_RANDOM_ending_in_48} && \
                                      ${predicate_test_RANDOM_ending_in_52} && \
                                      ${predicate_test_RANDOM_ending_in_56} && \
                                      ${predicate_test_RANDOM_ending_in_60} && \
                                      ${predicate_test_RANDOM_ending_in_64} && \
                                      ${predicate_test_RANDOM_ending_in_68} && \
                                      ${predicate_test_RANDOM_ending_in_72} && \
                                      ${predicate_test_RANDOM_ending_in_76} && \
                                      ${predicate_test_RANDOM_ending_in_80} && \
                                      ${predicate_test_RANDOM_ending_in_84} && \
                                      ${predicate_test_RANDOM_ending_in_88} && \
                                      ${predicate_test_RANDOM_ending_in_92} && \
                                      ${predicate_test_RANDOM_ending_in_96}
# Combined predicate }}}

# Test cases for years divisible by 4 }}}

# Test cases for years not divisible by 4 {{{

# Numbers under 100 that aren't divisible by 4 {{{
predicate_test_1  = [ "$$(echo "1"  | $$FILE)" = "false" ]
predicate_test_2  = [ "$$(echo "2"  | $$FILE)" = "false" ]
predicate_test_3  = [ "$$(echo "3"  | $$FILE)" = "false" ]
predicate_test_5  = [ "$$(echo "5"  | $$FILE)" = "false" ]
predicate_test_6  = [ "$$(echo "6"  | $$FILE)" = "false" ]
predicate_test_7  = [ "$$(echo "7"  | $$FILE)" = "false" ]
predicate_test_9  = [ "$$(echo "9"  | $$FILE)" = "false" ]
predicate_test_10 = [ "$$(echo "10" | $$FILE)" = "false" ]
predicate_test_11 = [ "$$(echo "11" | $$FILE)" = "false" ]
predicate_test_13 = [ "$$(echo "13" | $$FILE)" = "false" ]
predicate_test_14 = [ "$$(echo "14" | $$FILE)" = "false" ]
predicate_test_15 = [ "$$(echo "15" | $$FILE)" = "false" ]
predicate_test_17 = [ "$$(echo "17" | $$FILE)" = "false" ]
predicate_test_18 = [ "$$(echo "18" | $$FILE)" = "false" ]
predicate_test_19 = [ "$$(echo "19" | $$FILE)" = "false" ]
predicate_test_21 = [ "$$(echo "21" | $$FILE)" = "false" ]
predicate_test_22 = [ "$$(echo "22" | $$FILE)" = "false" ]
predicate_test_23 = [ "$$(echo "23" | $$FILE)" = "false" ]
predicate_test_25 = [ "$$(echo "25" | $$FILE)" = "false" ]
predicate_test_26 = [ "$$(echo "26" | $$FILE)" = "false" ]
predicate_test_27 = [ "$$(echo "27" | $$FILE)" = "false" ]
predicate_test_29 = [ "$$(echo "29" | $$FILE)" = "false" ]
predicate_test_30 = [ "$$(echo "30" | $$FILE)" = "false" ]
predicate_test_31 = [ "$$(echo "31" | $$FILE)" = "false" ]
predicate_test_33 = [ "$$(echo "33" | $$FILE)" = "false" ]
predicate_test_34 = [ "$$(echo "34" | $$FILE)" = "false" ]
predicate_test_35 = [ "$$(echo "35" | $$FILE)" = "false" ]
predicate_test_37 = [ "$$(echo "37" | $$FILE)" = "false" ]
predicate_test_38 = [ "$$(echo "38" | $$FILE)" = "false" ]
predicate_test_39 = [ "$$(echo "39" | $$FILE)" = "false" ]
predicate_test_41 = [ "$$(echo "41" | $$FILE)" = "false" ]
predicate_test_42 = [ "$$(echo "42" | $$FILE)" = "false" ]
predicate_test_43 = [ "$$(echo "43" | $$FILE)" = "false" ]
predicate_test_45 = [ "$$(echo "45" | $$FILE)" = "false" ]
predicate_test_46 = [ "$$(echo "46" | $$FILE)" = "false" ]
predicate_test_47 = [ "$$(echo "47" | $$FILE)" = "false" ]
predicate_test_49 = [ "$$(echo "49" | $$FILE)" = "false" ]
predicate_test_50 = [ "$$(echo "50" | $$FILE)" = "false" ]
predicate_test_51 = [ "$$(echo "51" | $$FILE)" = "false" ]
predicate_test_53 = [ "$$(echo "53" | $$FILE)" = "false" ]
predicate_test_54 = [ "$$(echo "54" | $$FILE)" = "false" ]
predicate_test_55 = [ "$$(echo "55" | $$FILE)" = "false" ]
predicate_test_57 = [ "$$(echo "57" | $$FILE)" = "false" ]
predicate_test_58 = [ "$$(echo "58" | $$FILE)" = "false" ]
predicate_test_59 = [ "$$(echo "59" | $$FILE)" = "false" ]
predicate_test_61 = [ "$$(echo "61" | $$FILE)" = "false" ]
predicate_test_62 = [ "$$(echo "62" | $$FILE)" = "false" ]
predicate_test_63 = [ "$$(echo "63" | $$FILE)" = "false" ]
predicate_test_65 = [ "$$(echo "65" | $$FILE)" = "false" ]
predicate_test_66 = [ "$$(echo "66" | $$FILE)" = "false" ]
predicate_test_67 = [ "$$(echo "67" | $$FILE)" = "false" ]
predicate_test_69 = [ "$$(echo "69" | $$FILE)" = "false" ]
predicate_test_70 = [ "$$(echo "70" | $$FILE)" = "false" ]
predicate_test_71 = [ "$$(echo "71" | $$FILE)" = "false" ]
predicate_test_73 = [ "$$(echo "73" | $$FILE)" = "false" ]
predicate_test_74 = [ "$$(echo "74" | $$FILE)" = "false" ]
predicate_test_75 = [ "$$(echo "75" | $$FILE)" = "false" ]
predicate_test_77 = [ "$$(echo "77" | $$FILE)" = "false" ]
predicate_test_78 = [ "$$(echo "78" | $$FILE)" = "false" ]
predicate_test_79 = [ "$$(echo "79" | $$FILE)" = "false" ]
predicate_test_81 = [ "$$(echo "81" | $$FILE)" = "false" ]
predicate_test_82 = [ "$$(echo "82" | $$FILE)" = "false" ]
predicate_test_83 = [ "$$(echo "83" | $$FILE)" = "false" ]
predicate_test_85 = [ "$$(echo "85" | $$FILE)" = "false" ]
predicate_test_86 = [ "$$(echo "86" | $$FILE)" = "false" ]
predicate_test_87 = [ "$$(echo "87" | $$FILE)" = "false" ]
predicate_test_89 = [ "$$(echo "89" | $$FILE)" = "false" ]
predicate_test_90 = [ "$$(echo "90" | $$FILE)" = "false" ]
predicate_test_91 = [ "$$(echo "91" | $$FILE)" = "false" ]
predicate_test_93 = [ "$$(echo "93" | $$FILE)" = "false" ]
predicate_test_94 = [ "$$(echo "94" | $$FILE)" = "false" ]
predicate_test_95 = [ "$$(echo "95" | $$FILE)" = "false" ]
predicate_test_97 = [ "$$(echo "97" | $$FILE)" = "false" ]
predicate_test_98 = [ "$$(echo "98" | $$FILE)" = "false" ]
predicate_test_99 = [ "$$(echo "99" | $$FILE)" = "false" ]
# Numbers under 100 that aren't divisible by 4 }}}

# Numbers exclusively between 100 and 200 that aren't divisible by 4 {{{
predicate_test_101 = [ "$$(echo "101" | $$FILE)" = "false" ]
predicate_test_102 = [ "$$(echo "102" | $$FILE)" = "false" ]
predicate_test_103 = [ "$$(echo "103" | $$FILE)" = "false" ]
predicate_test_105 = [ "$$(echo "105" | $$FILE)" = "false" ]
predicate_test_106 = [ "$$(echo "106" | $$FILE)" = "false" ]
predicate_test_107 = [ "$$(echo "107" | $$FILE)" = "false" ]
predicate_test_109 = [ "$$(echo "109" | $$FILE)" = "false" ]
predicate_test_110 = [ "$$(echo "110" | $$FILE)" = "false" ]
predicate_test_111 = [ "$$(echo "111" | $$FILE)" = "false" ]
predicate_test_113 = [ "$$(echo "113" | $$FILE)" = "false" ]
predicate_test_114 = [ "$$(echo "114" | $$FILE)" = "false" ]
predicate_test_115 = [ "$$(echo "115" | $$FILE)" = "false" ]
predicate_test_117 = [ "$$(echo "117" | $$FILE)" = "false" ]
predicate_test_118 = [ "$$(echo "118" | $$FILE)" = "false" ]
predicate_test_119 = [ "$$(echo "119" | $$FILE)" = "false" ]
predicate_test_121 = [ "$$(echo "121" | $$FILE)" = "false" ]
predicate_test_122 = [ "$$(echo "122" | $$FILE)" = "false" ]
predicate_test_123 = [ "$$(echo "123" | $$FILE)" = "false" ]
predicate_test_125 = [ "$$(echo "125" | $$FILE)" = "false" ]
predicate_test_126 = [ "$$(echo "126" | $$FILE)" = "false" ]
predicate_test_127 = [ "$$(echo "127" | $$FILE)" = "false" ]
predicate_test_129 = [ "$$(echo "129" | $$FILE)" = "false" ]
predicate_test_130 = [ "$$(echo "130" | $$FILE)" = "false" ]
predicate_test_131 = [ "$$(echo "131" | $$FILE)" = "false" ]
predicate_test_133 = [ "$$(echo "133" | $$FILE)" = "false" ]
predicate_test_134 = [ "$$(echo "134" | $$FILE)" = "false" ]
predicate_test_135 = [ "$$(echo "135" | $$FILE)" = "false" ]
predicate_test_137 = [ "$$(echo "137" | $$FILE)" = "false" ]
predicate_test_138 = [ "$$(echo "138" | $$FILE)" = "false" ]
predicate_test_139 = [ "$$(echo "139" | $$FILE)" = "false" ]
predicate_test_141 = [ "$$(echo "141" | $$FILE)" = "false" ]
predicate_test_142 = [ "$$(echo "142" | $$FILE)" = "false" ]
predicate_test_143 = [ "$$(echo "143" | $$FILE)" = "false" ]
predicate_test_145 = [ "$$(echo "145" | $$FILE)" = "false" ]
predicate_test_146 = [ "$$(echo "146" | $$FILE)" = "false" ]
predicate_test_147 = [ "$$(echo "147" | $$FILE)" = "false" ]
predicate_test_149 = [ "$$(echo "149" | $$FILE)" = "false" ]
predicate_test_150 = [ "$$(echo "150" | $$FILE)" = "false" ]
predicate_test_151 = [ "$$(echo "151" | $$FILE)" = "false" ]
predicate_test_153 = [ "$$(echo "153" | $$FILE)" = "false" ]
predicate_test_154 = [ "$$(echo "154" | $$FILE)" = "false" ]
predicate_test_155 = [ "$$(echo "155" | $$FILE)" = "false" ]
predicate_test_157 = [ "$$(echo "157" | $$FILE)" = "false" ]
predicate_test_158 = [ "$$(echo "158" | $$FILE)" = "false" ]
predicate_test_159 = [ "$$(echo "159" | $$FILE)" = "false" ]
predicate_test_161 = [ "$$(echo "161" | $$FILE)" = "false" ]
predicate_test_162 = [ "$$(echo "162" | $$FILE)" = "false" ]
predicate_test_163 = [ "$$(echo "163" | $$FILE)" = "false" ]
predicate_test_165 = [ "$$(echo "165" | $$FILE)" = "false" ]
predicate_test_166 = [ "$$(echo "166" | $$FILE)" = "false" ]
predicate_test_167 = [ "$$(echo "167" | $$FILE)" = "false" ]
predicate_test_169 = [ "$$(echo "169" | $$FILE)" = "false" ]
predicate_test_170 = [ "$$(echo "170" | $$FILE)" = "false" ]
predicate_test_171 = [ "$$(echo "171" | $$FILE)" = "false" ]
predicate_test_173 = [ "$$(echo "173" | $$FILE)" = "false" ]
predicate_test_174 = [ "$$(echo "174" | $$FILE)" = "false" ]
predicate_test_175 = [ "$$(echo "175" | $$FILE)" = "false" ]
predicate_test_177 = [ "$$(echo "177" | $$FILE)" = "false" ]
predicate_test_178 = [ "$$(echo "178" | $$FILE)" = "false" ]
predicate_test_179 = [ "$$(echo "179" | $$FILE)" = "false" ]
predicate_test_181 = [ "$$(echo "181" | $$FILE)" = "false" ]
predicate_test_182 = [ "$$(echo "182" | $$FILE)" = "false" ]
predicate_test_183 = [ "$$(echo "183" | $$FILE)" = "false" ]
predicate_test_185 = [ "$$(echo "185" | $$FILE)" = "false" ]
predicate_test_186 = [ "$$(echo "186" | $$FILE)" = "false" ]
predicate_test_187 = [ "$$(echo "187" | $$FILE)" = "false" ]
predicate_test_189 = [ "$$(echo "189" | $$FILE)" = "false" ]
predicate_test_190 = [ "$$(echo "190" | $$FILE)" = "false" ]
predicate_test_191 = [ "$$(echo "191" | $$FILE)" = "false" ]
predicate_test_193 = [ "$$(echo "193" | $$FILE)" = "false" ]
predicate_test_194 = [ "$$(echo "194" | $$FILE)" = "false" ]
predicate_test_195 = [ "$$(echo "195" | $$FILE)" = "false" ]
predicate_test_197 = [ "$$(echo "197" | $$FILE)" = "false" ]
predicate_test_198 = [ "$$(echo "198" | $$FILE)" = "false" ]
predicate_test_199 = [ "$$(echo "199" | $$FILE)" = "false" ]
# Numbers exclusively between 100 and 200 that aren't divisible by 4 }}}

# Numbers exclusively between 200 and 300 that aren't divisible by 4 {{{
predicate_test_201 = [ "$$(echo "201" | $$FILE)" = "false" ]
predicate_test_202 = [ "$$(echo "202" | $$FILE)" = "false" ]
predicate_test_203 = [ "$$(echo "203" | $$FILE)" = "false" ]
predicate_test_205 = [ "$$(echo "205" | $$FILE)" = "false" ]
predicate_test_206 = [ "$$(echo "206" | $$FILE)" = "false" ]
predicate_test_207 = [ "$$(echo "207" | $$FILE)" = "false" ]
predicate_test_209 = [ "$$(echo "209" | $$FILE)" = "false" ]
predicate_test_210 = [ "$$(echo "210" | $$FILE)" = "false" ]
predicate_test_211 = [ "$$(echo "211" | $$FILE)" = "false" ]
predicate_test_213 = [ "$$(echo "213" | $$FILE)" = "false" ]
predicate_test_214 = [ "$$(echo "214" | $$FILE)" = "false" ]
predicate_test_215 = [ "$$(echo "215" | $$FILE)" = "false" ]
predicate_test_217 = [ "$$(echo "217" | $$FILE)" = "false" ]
predicate_test_218 = [ "$$(echo "218" | $$FILE)" = "false" ]
predicate_test_219 = [ "$$(echo "219" | $$FILE)" = "false" ]
predicate_test_221 = [ "$$(echo "221" | $$FILE)" = "false" ]
predicate_test_222 = [ "$$(echo "222" | $$FILE)" = "false" ]
predicate_test_223 = [ "$$(echo "223" | $$FILE)" = "false" ]
predicate_test_225 = [ "$$(echo "225" | $$FILE)" = "false" ]
predicate_test_226 = [ "$$(echo "226" | $$FILE)" = "false" ]
predicate_test_227 = [ "$$(echo "227" | $$FILE)" = "false" ]
predicate_test_229 = [ "$$(echo "229" | $$FILE)" = "false" ]
predicate_test_230 = [ "$$(echo "230" | $$FILE)" = "false" ]
predicate_test_231 = [ "$$(echo "231" | $$FILE)" = "false" ]
predicate_test_233 = [ "$$(echo "233" | $$FILE)" = "false" ]
predicate_test_234 = [ "$$(echo "234" | $$FILE)" = "false" ]
predicate_test_235 = [ "$$(echo "235" | $$FILE)" = "false" ]
predicate_test_237 = [ "$$(echo "237" | $$FILE)" = "false" ]
predicate_test_238 = [ "$$(echo "238" | $$FILE)" = "false" ]
predicate_test_239 = [ "$$(echo "239" | $$FILE)" = "false" ]
predicate_test_241 = [ "$$(echo "241" | $$FILE)" = "false" ]
predicate_test_242 = [ "$$(echo "242" | $$FILE)" = "false" ]
predicate_test_243 = [ "$$(echo "243" | $$FILE)" = "false" ]
predicate_test_245 = [ "$$(echo "245" | $$FILE)" = "false" ]
predicate_test_246 = [ "$$(echo "246" | $$FILE)" = "false" ]
predicate_test_247 = [ "$$(echo "247" | $$FILE)" = "false" ]
predicate_test_249 = [ "$$(echo "249" | $$FILE)" = "false" ]
predicate_test_250 = [ "$$(echo "250" | $$FILE)" = "false" ]
predicate_test_251 = [ "$$(echo "251" | $$FILE)" = "false" ]
predicate_test_253 = [ "$$(echo "253" | $$FILE)" = "false" ]
predicate_test_254 = [ "$$(echo "254" | $$FILE)" = "false" ]
predicate_test_255 = [ "$$(echo "255" | $$FILE)" = "false" ]
predicate_test_257 = [ "$$(echo "257" | $$FILE)" = "false" ]
predicate_test_258 = [ "$$(echo "258" | $$FILE)" = "false" ]
predicate_test_259 = [ "$$(echo "259" | $$FILE)" = "false" ]
predicate_test_261 = [ "$$(echo "261" | $$FILE)" = "false" ]
predicate_test_262 = [ "$$(echo "262" | $$FILE)" = "false" ]
predicate_test_263 = [ "$$(echo "263" | $$FILE)" = "false" ]
predicate_test_265 = [ "$$(echo "265" | $$FILE)" = "false" ]
predicate_test_266 = [ "$$(echo "266" | $$FILE)" = "false" ]
predicate_test_267 = [ "$$(echo "267" | $$FILE)" = "false" ]
predicate_test_269 = [ "$$(echo "269" | $$FILE)" = "false" ]
predicate_test_270 = [ "$$(echo "270" | $$FILE)" = "false" ]
predicate_test_271 = [ "$$(echo "271" | $$FILE)" = "false" ]
predicate_test_273 = [ "$$(echo "273" | $$FILE)" = "false" ]
predicate_test_274 = [ "$$(echo "274" | $$FILE)" = "false" ]
predicate_test_275 = [ "$$(echo "275" | $$FILE)" = "false" ]
predicate_test_277 = [ "$$(echo "277" | $$FILE)" = "false" ]
predicate_test_278 = [ "$$(echo "278" | $$FILE)" = "false" ]
predicate_test_279 = [ "$$(echo "279" | $$FILE)" = "false" ]
predicate_test_281 = [ "$$(echo "281" | $$FILE)" = "false" ]
predicate_test_282 = [ "$$(echo "282" | $$FILE)" = "false" ]
predicate_test_283 = [ "$$(echo "283" | $$FILE)" = "false" ]
predicate_test_285 = [ "$$(echo "285" | $$FILE)" = "false" ]
predicate_test_286 = [ "$$(echo "286" | $$FILE)" = "false" ]
predicate_test_287 = [ "$$(echo "287" | $$FILE)" = "false" ]
predicate_test_289 = [ "$$(echo "289" | $$FILE)" = "false" ]
predicate_test_290 = [ "$$(echo "290" | $$FILE)" = "false" ]
predicate_test_291 = [ "$$(echo "291" | $$FILE)" = "false" ]
predicate_test_293 = [ "$$(echo "293" | $$FILE)" = "false" ]
predicate_test_294 = [ "$$(echo "294" | $$FILE)" = "false" ]
predicate_test_295 = [ "$$(echo "295" | $$FILE)" = "false" ]
predicate_test_297 = [ "$$(echo "297" | $$FILE)" = "false" ]
predicate_test_298 = [ "$$(echo "298" | $$FILE)" = "false" ]
predicate_test_299 = [ "$$(echo "299" | $$FILE)" = "false" ]
# Numbers exclusively between 200 and 300 that aren't divisible by 4 }}}

# Random numbers divisible by neither 4 NOR 100 {{{
predicate_test_RANDOM_ending_in_01 = [ "$$(echo "$${RANDOM}01" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_02 = [ "$$(echo "$${RANDOM}02" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_03 = [ "$$(echo "$${RANDOM}03" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_05 = [ "$$(echo "$${RANDOM}05" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_06 = [ "$$(echo "$${RANDOM}06" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_07 = [ "$$(echo "$${RANDOM}07" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_09 = [ "$$(echo "$${RANDOM}09" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_10 = [ "$$(echo "$${RANDOM}10" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_11 = [ "$$(echo "$${RANDOM}11" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_13 = [ "$$(echo "$${RANDOM}13" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_14 = [ "$$(echo "$${RANDOM}14" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_15 = [ "$$(echo "$${RANDOM}15" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_17 = [ "$$(echo "$${RANDOM}17" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_18 = [ "$$(echo "$${RANDOM}18" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_19 = [ "$$(echo "$${RANDOM}19" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_21 = [ "$$(echo "$${RANDOM}21" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_22 = [ "$$(echo "$${RANDOM}22" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_23 = [ "$$(echo "$${RANDOM}23" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_25 = [ "$$(echo "$${RANDOM}25" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_26 = [ "$$(echo "$${RANDOM}26" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_27 = [ "$$(echo "$${RANDOM}27" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_29 = [ "$$(echo "$${RANDOM}29" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_30 = [ "$$(echo "$${RANDOM}30" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_31 = [ "$$(echo "$${RANDOM}31" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_33 = [ "$$(echo "$${RANDOM}33" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_34 = [ "$$(echo "$${RANDOM}34" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_35 = [ "$$(echo "$${RANDOM}35" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_37 = [ "$$(echo "$${RANDOM}37" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_38 = [ "$$(echo "$${RANDOM}38" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_39 = [ "$$(echo "$${RANDOM}39" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_41 = [ "$$(echo "$${RANDOM}41" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_42 = [ "$$(echo "$${RANDOM}42" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_43 = [ "$$(echo "$${RANDOM}43" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_45 = [ "$$(echo "$${RANDOM}45" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_46 = [ "$$(echo "$${RANDOM}46" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_47 = [ "$$(echo "$${RANDOM}47" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_49 = [ "$$(echo "$${RANDOM}49" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_50 = [ "$$(echo "$${RANDOM}50" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_51 = [ "$$(echo "$${RANDOM}51" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_53 = [ "$$(echo "$${RANDOM}53" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_54 = [ "$$(echo "$${RANDOM}54" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_55 = [ "$$(echo "$${RANDOM}55" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_57 = [ "$$(echo "$${RANDOM}57" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_58 = [ "$$(echo "$${RANDOM}58" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_59 = [ "$$(echo "$${RANDOM}59" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_61 = [ "$$(echo "$${RANDOM}61" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_62 = [ "$$(echo "$${RANDOM}62" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_63 = [ "$$(echo "$${RANDOM}63" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_65 = [ "$$(echo "$${RANDOM}65" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_66 = [ "$$(echo "$${RANDOM}66" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_67 = [ "$$(echo "$${RANDOM}67" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_69 = [ "$$(echo "$${RANDOM}69" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_70 = [ "$$(echo "$${RANDOM}70" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_71 = [ "$$(echo "$${RANDOM}71" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_73 = [ "$$(echo "$${RANDOM}73" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_74 = [ "$$(echo "$${RANDOM}74" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_75 = [ "$$(echo "$${RANDOM}75" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_77 = [ "$$(echo "$${RANDOM}77" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_78 = [ "$$(echo "$${RANDOM}78" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_79 = [ "$$(echo "$${RANDOM}79" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_81 = [ "$$(echo "$${RANDOM}81" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_82 = [ "$$(echo "$${RANDOM}82" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_83 = [ "$$(echo "$${RANDOM}83" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_85 = [ "$$(echo "$${RANDOM}85" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_86 = [ "$$(echo "$${RANDOM}86" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_87 = [ "$$(echo "$${RANDOM}87" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_89 = [ "$$(echo "$${RANDOM}89" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_90 = [ "$$(echo "$${RANDOM}90" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_91 = [ "$$(echo "$${RANDOM}91" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_93 = [ "$$(echo "$${RANDOM}93" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_94 = [ "$$(echo "$${RANDOM}94" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_95 = [ "$$(echo "$${RANDOM}95" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_97 = [ "$$(echo "$${RANDOM}97" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_98 = [ "$$(echo "$${RANDOM}98" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_99 = [ "$$(echo "$${RANDOM}99" | $$FILE)" = "false" ]
# Random numbers divisible by neither 4 NOR 100 }}}

# Combined predicate {{{
predicate_test_years_not_divisible_by_4 = ${predicate_test_1}                   && \
                                          ${predicate_test_2}                   && \
                                          ${predicate_test_3}                   && \
                                          ${predicate_test_5}                   && \
                                          ${predicate_test_6}                   && \
                                          ${predicate_test_7}                   && \
                                          ${predicate_test_9}                   && \
                                          ${predicate_test_10}                  && \
                                          ${predicate_test_11}                  && \
                                          ${predicate_test_13}                  && \
                                          ${predicate_test_14}                  && \
                                          ${predicate_test_15}                  && \
                                          ${predicate_test_17}                  && \
                                          ${predicate_test_18}                  && \
                                          ${predicate_test_19}                  && \
                                          ${predicate_test_21}                  && \
                                          ${predicate_test_22}                  && \
                                          ${predicate_test_23}                  && \
                                          ${predicate_test_25}                  && \
                                          ${predicate_test_26}                  && \
                                          ${predicate_test_27}                  && \
                                          ${predicate_test_29}                  && \
                                          ${predicate_test_30}                  && \
                                          ${predicate_test_31}                  && \
                                          ${predicate_test_33}                  && \
                                          ${predicate_test_34}                  && \
                                          ${predicate_test_35}                  && \
                                          ${predicate_test_37}                  && \
                                          ${predicate_test_38}                  && \
                                          ${predicate_test_39}                  && \
                                          ${predicate_test_41}                  && \
                                          ${predicate_test_42}                  && \
                                          ${predicate_test_43}                  && \
                                          ${predicate_test_45}                  && \
                                          ${predicate_test_46}                  && \
                                          ${predicate_test_47}                  && \
                                          ${predicate_test_49}                  && \
                                          ${predicate_test_50}                  && \
                                          ${predicate_test_51}                  && \
                                          ${predicate_test_53}                  && \
                                          ${predicate_test_54}                  && \
                                          ${predicate_test_55}                  && \
                                          ${predicate_test_57}                  && \
                                          ${predicate_test_58}                  && \
                                          ${predicate_test_59}                  && \
                                          ${predicate_test_61}                  && \
                                          ${predicate_test_62}                  && \
                                          ${predicate_test_63}                  && \
                                          ${predicate_test_65}                  && \
                                          ${predicate_test_66}                  && \
                                          ${predicate_test_67}                  && \
                                          ${predicate_test_69}                  && \
                                          ${predicate_test_70}                  && \
                                          ${predicate_test_71}                  && \
                                          ${predicate_test_73}                  && \
                                          ${predicate_test_74}                  && \
                                          ${predicate_test_75}                  && \
                                          ${predicate_test_77}                  && \
                                          ${predicate_test_78}                  && \
                                          ${predicate_test_79}                  && \
                                          ${predicate_test_81}                  && \
                                          ${predicate_test_82}                  && \
                                          ${predicate_test_83}                  && \
                                          ${predicate_test_85}                  && \
                                          ${predicate_test_86}                  && \
                                          ${predicate_test_87}                  && \
                                          ${predicate_test_89}                  && \
                                          ${predicate_test_90}                  && \
                                          ${predicate_test_91}                  && \
                                          ${predicate_test_93}                  && \
                                          ${predicate_test_94}                  && \
                                          ${predicate_test_95}                  && \
                                          ${predicate_test_97}                  && \
                                          ${predicate_test_98}                  && \
                                          ${predicate_test_99}                  && \
                                          ${predicate_test_101}                 && \
                                          ${predicate_test_102}                 && \
                                          ${predicate_test_103}                 && \
                                          ${predicate_test_105}                 && \
                                          ${predicate_test_106}                 && \
                                          ${predicate_test_107}                 && \
                                          ${predicate_test_109}                 && \
                                          ${predicate_test_110}                 && \
                                          ${predicate_test_111}                 && \
                                          ${predicate_test_113}                 && \
                                          ${predicate_test_114}                 && \
                                          ${predicate_test_115}                 && \
                                          ${predicate_test_117}                 && \
                                          ${predicate_test_118}                 && \
                                          ${predicate_test_119}                 && \
                                          ${predicate_test_121}                 && \
                                          ${predicate_test_122}                 && \
                                          ${predicate_test_123}                 && \
                                          ${predicate_test_125}                 && \
                                          ${predicate_test_126}                 && \
                                          ${predicate_test_127}                 && \
                                          ${predicate_test_129}                 && \
                                          ${predicate_test_130}                 && \
                                          ${predicate_test_131}                 && \
                                          ${predicate_test_133}                 && \
                                          ${predicate_test_134}                 && \
                                          ${predicate_test_135}                 && \
                                          ${predicate_test_137}                 && \
                                          ${predicate_test_138}                 && \
                                          ${predicate_test_139}                 && \
                                          ${predicate_test_141}                 && \
                                          ${predicate_test_142}                 && \
                                          ${predicate_test_143}                 && \
                                          ${predicate_test_145}                 && \
                                          ${predicate_test_146}                 && \
                                          ${predicate_test_147}                 && \
                                          ${predicate_test_149}                 && \
                                          ${predicate_test_150}                 && \
                                          ${predicate_test_151}                 && \
                                          ${predicate_test_153}                 && \
                                          ${predicate_test_154}                 && \
                                          ${predicate_test_155}                 && \
                                          ${predicate_test_157}                 && \
                                          ${predicate_test_158}                 && \
                                          ${predicate_test_159}                 && \
                                          ${predicate_test_161}                 && \
                                          ${predicate_test_162}                 && \
                                          ${predicate_test_163}                 && \
                                          ${predicate_test_165}                 && \
                                          ${predicate_test_166}                 && \
                                          ${predicate_test_167}                 && \
                                          ${predicate_test_169}                 && \
                                          ${predicate_test_170}                 && \
                                          ${predicate_test_171}                 && \
                                          ${predicate_test_173}                 && \
                                          ${predicate_test_174}                 && \
                                          ${predicate_test_175}                 && \
                                          ${predicate_test_177}                 && \
                                          ${predicate_test_178}                 && \
                                          ${predicate_test_179}                 && \
                                          ${predicate_test_181}                 && \
                                          ${predicate_test_182}                 && \
                                          ${predicate_test_183}                 && \
                                          ${predicate_test_185}                 && \
                                          ${predicate_test_186}                 && \
                                          ${predicate_test_187}                 && \
                                          ${predicate_test_189}                 && \
                                          ${predicate_test_190}                 && \
                                          ${predicate_test_191}                 && \
                                          ${predicate_test_193}                 && \
                                          ${predicate_test_194}                 && \
                                          ${predicate_test_195}                 && \
                                          ${predicate_test_197}                 && \
                                          ${predicate_test_198}                 && \
                                          ${predicate_test_199}                 && \
                                          ${predicate_test_201}                 && \
                                          ${predicate_test_202}                 && \
                                          ${predicate_test_203}                 && \
                                          ${predicate_test_205}                 && \
                                          ${predicate_test_206}                 && \
                                          ${predicate_test_207}                 && \
                                          ${predicate_test_209}                 && \
                                          ${predicate_test_210}                 && \
                                          ${predicate_test_211}                 && \
                                          ${predicate_test_213}                 && \
                                          ${predicate_test_214}                 && \
                                          ${predicate_test_215}                 && \
                                          ${predicate_test_217}                 && \
                                          ${predicate_test_218}                 && \
                                          ${predicate_test_219}                 && \
                                          ${predicate_test_221}                 && \
                                          ${predicate_test_222}                 && \
                                          ${predicate_test_223}                 && \
                                          ${predicate_test_225}                 && \
                                          ${predicate_test_226}                 && \
                                          ${predicate_test_227}                 && \
                                          ${predicate_test_229}                 && \
                                          ${predicate_test_230}                 && \
                                          ${predicate_test_231}                 && \
                                          ${predicate_test_233}                 && \
                                          ${predicate_test_234}                 && \
                                          ${predicate_test_235}                 && \
                                          ${predicate_test_237}                 && \
                                          ${predicate_test_238}                 && \
                                          ${predicate_test_239}                 && \
                                          ${predicate_test_241}                 && \
                                          ${predicate_test_242}                 && \
                                          ${predicate_test_243}                 && \
                                          ${predicate_test_245}                 && \
                                          ${predicate_test_246}                 && \
                                          ${predicate_test_247}                 && \
                                          ${predicate_test_249}                 && \
                                          ${predicate_test_250}                 && \
                                          ${predicate_test_251}                 && \
                                          ${predicate_test_253}                 && \
                                          ${predicate_test_254}                 && \
                                          ${predicate_test_255}                 && \
                                          ${predicate_test_257}                 && \
                                          ${predicate_test_258}                 && \
                                          ${predicate_test_259}                 && \
                                          ${predicate_test_261}                 && \
                                          ${predicate_test_262}                 && \
                                          ${predicate_test_263}                 && \
                                          ${predicate_test_265}                 && \
                                          ${predicate_test_266}                 && \
                                          ${predicate_test_267}                 && \
                                          ${predicate_test_269}                 && \
                                          ${predicate_test_270}                 && \
                                          ${predicate_test_271}                 && \
                                          ${predicate_test_273}                 && \
                                          ${predicate_test_274}                 && \
                                          ${predicate_test_275}                 && \
                                          ${predicate_test_277}                 && \
                                          ${predicate_test_278}                 && \
                                          ${predicate_test_279}                 && \
                                          ${predicate_test_281}                 && \
                                          ${predicate_test_282}                 && \
                                          ${predicate_test_283}                 && \
                                          ${predicate_test_285}                 && \
                                          ${predicate_test_286}                 && \
                                          ${predicate_test_287}                 && \
                                          ${predicate_test_289}                 && \
                                          ${predicate_test_290}                 && \
                                          ${predicate_test_291}                 && \
                                          ${predicate_test_293}                 && \
                                          ${predicate_test_294}                 && \
                                          ${predicate_test_295}                 && \
                                          ${predicate_test_297}                 && \
                                          ${predicate_test_298}                 && \
                                          ${predicate_test_299}                 && \
                                          ${predicate_test_RANDOM_ending_in_01} && \
                                          ${predicate_test_RANDOM_ending_in_02} && \
                                          ${predicate_test_RANDOM_ending_in_03} && \
                                          ${predicate_test_RANDOM_ending_in_05} && \
                                          ${predicate_test_RANDOM_ending_in_06} && \
                                          ${predicate_test_RANDOM_ending_in_07} && \
                                          ${predicate_test_RANDOM_ending_in_09} && \
                                          ${predicate_test_RANDOM_ending_in_10} && \
                                          ${predicate_test_RANDOM_ending_in_11} && \
                                          ${predicate_test_RANDOM_ending_in_13} && \
                                          ${predicate_test_RANDOM_ending_in_14} && \
                                          ${predicate_test_RANDOM_ending_in_15} && \
                                          ${predicate_test_RANDOM_ending_in_17} && \
                                          ${predicate_test_RANDOM_ending_in_18} && \
                                          ${predicate_test_RANDOM_ending_in_19} && \
                                          ${predicate_test_RANDOM_ending_in_21} && \
                                          ${predicate_test_RANDOM_ending_in_22} && \
                                          ${predicate_test_RANDOM_ending_in_23} && \
                                          ${predicate_test_RANDOM_ending_in_25} && \
                                          ${predicate_test_RANDOM_ending_in_26} && \
                                          ${predicate_test_RANDOM_ending_in_27} && \
                                          ${predicate_test_RANDOM_ending_in_29} && \
                                          ${predicate_test_RANDOM_ending_in_30} && \
                                          ${predicate_test_RANDOM_ending_in_31} && \
                                          ${predicate_test_RANDOM_ending_in_33} && \
                                          ${predicate_test_RANDOM_ending_in_34} && \
                                          ${predicate_test_RANDOM_ending_in_35} && \
                                          ${predicate_test_RANDOM_ending_in_37} && \
                                          ${predicate_test_RANDOM_ending_in_38} && \
                                          ${predicate_test_RANDOM_ending_in_39} && \
                                          ${predicate_test_RANDOM_ending_in_41} && \
                                          ${predicate_test_RANDOM_ending_in_42} && \
                                          ${predicate_test_RANDOM_ending_in_43} && \
                                          ${predicate_test_RANDOM_ending_in_45} && \
                                          ${predicate_test_RANDOM_ending_in_46} && \
                                          ${predicate_test_RANDOM_ending_in_47} && \
                                          ${predicate_test_RANDOM_ending_in_49} && \
                                          ${predicate_test_RANDOM_ending_in_50} && \
                                          ${predicate_test_RANDOM_ending_in_51} && \
                                          ${predicate_test_RANDOM_ending_in_53} && \
                                          ${predicate_test_RANDOM_ending_in_54} && \
                                          ${predicate_test_RANDOM_ending_in_55} && \
                                          ${predicate_test_RANDOM_ending_in_57} && \
                                          ${predicate_test_RANDOM_ending_in_58} && \
                                          ${predicate_test_RANDOM_ending_in_59} && \
                                          ${predicate_test_RANDOM_ending_in_61} && \
                                          ${predicate_test_RANDOM_ending_in_62} && \
                                          ${predicate_test_RANDOM_ending_in_63} && \
                                          ${predicate_test_RANDOM_ending_in_65} && \
                                          ${predicate_test_RANDOM_ending_in_66} && \
                                          ${predicate_test_RANDOM_ending_in_67} && \
                                          ${predicate_test_RANDOM_ending_in_69} && \
                                          ${predicate_test_RANDOM_ending_in_70} && \
                                          ${predicate_test_RANDOM_ending_in_71} && \
                                          ${predicate_test_RANDOM_ending_in_73} && \
                                          ${predicate_test_RANDOM_ending_in_74} && \
                                          ${predicate_test_RANDOM_ending_in_75} && \
                                          ${predicate_test_RANDOM_ending_in_77} && \
                                          ${predicate_test_RANDOM_ending_in_78} && \
                                          ${predicate_test_RANDOM_ending_in_79} && \
                                          ${predicate_test_RANDOM_ending_in_81} && \
                                          ${predicate_test_RANDOM_ending_in_82} && \
                                          ${predicate_test_RANDOM_ending_in_83} && \
                                          ${predicate_test_RANDOM_ending_in_85} && \
                                          ${predicate_test_RANDOM_ending_in_86} && \
                                          ${predicate_test_RANDOM_ending_in_87} && \
                                          ${predicate_test_RANDOM_ending_in_89} && \
                                          ${predicate_test_RANDOM_ending_in_90} && \
                                          ${predicate_test_RANDOM_ending_in_91} && \
                                          ${predicate_test_RANDOM_ending_in_93} && \
                                          ${predicate_test_RANDOM_ending_in_94} && \
                                          ${predicate_test_RANDOM_ending_in_95} && \
                                          ${predicate_test_RANDOM_ending_in_97} && \
                                          ${predicate_test_RANDOM_ending_in_98} && \
                                          ${predicate_test_RANDOM_ending_in_99}
# Combined predicate }}}

# Test cases for years not divisible by 4 }}}

# Test cases for years divisible by 100 but not 400 {{{

# Multiples of 100 but not 400 under 10000 {{{
predicate_test_100  = [ "$$(echo "100"  | $$FILE)" = "false" ]
predicate_test_200  = [ "$$(echo "200"  | $$FILE)" = "false" ]
predicate_test_300  = [ "$$(echo "300"  | $$FILE)" = "false" ]
predicate_test_500  = [ "$$(echo "500"  | $$FILE)" = "false" ]
predicate_test_600  = [ "$$(echo "600"  | $$FILE)" = "false" ]
predicate_test_700  = [ "$$(echo "700"  | $$FILE)" = "false" ]
predicate_test_900  = [ "$$(echo "900"  | $$FILE)" = "false" ]
predicate_test_1000 = [ "$$(echo "1000" | $$FILE)" = "false" ]
predicate_test_1100 = [ "$$(echo "1100" | $$FILE)" = "false" ]
predicate_test_1300 = [ "$$(echo "1300" | $$FILE)" = "false" ]
predicate_test_1400 = [ "$$(echo "1400" | $$FILE)" = "false" ]
predicate_test_1500 = [ "$$(echo "1500" | $$FILE)" = "false" ]
predicate_test_1700 = [ "$$(echo "1700" | $$FILE)" = "false" ]
predicate_test_1800 = [ "$$(echo "1800" | $$FILE)" = "false" ]
predicate_test_1900 = [ "$$(echo "1900" | $$FILE)" = "false" ]
predicate_test_2100 = [ "$$(echo "2100" | $$FILE)" = "false" ]
predicate_test_2200 = [ "$$(echo "2200" | $$FILE)" = "false" ]
predicate_test_2300 = [ "$$(echo "2300" | $$FILE)" = "false" ]
predicate_test_2500 = [ "$$(echo "2500" | $$FILE)" = "false" ]
predicate_test_2600 = [ "$$(echo "2600" | $$FILE)" = "false" ]
predicate_test_2700 = [ "$$(echo "2700" | $$FILE)" = "false" ]
predicate_test_2900 = [ "$$(echo "2900" | $$FILE)" = "false" ]
predicate_test_3000 = [ "$$(echo "3000" | $$FILE)" = "false" ]
predicate_test_3100 = [ "$$(echo "3100" | $$FILE)" = "false" ]
predicate_test_3300 = [ "$$(echo "3300" | $$FILE)" = "false" ]
predicate_test_3400 = [ "$$(echo "3400" | $$FILE)" = "false" ]
predicate_test_3500 = [ "$$(echo "3500" | $$FILE)" = "false" ]
predicate_test_3700 = [ "$$(echo "3700" | $$FILE)" = "false" ]
predicate_test_3800 = [ "$$(echo "3800" | $$FILE)" = "false" ]
predicate_test_3900 = [ "$$(echo "3900" | $$FILE)" = "false" ]
predicate_test_4100 = [ "$$(echo "4100" | $$FILE)" = "false" ]
predicate_test_4200 = [ "$$(echo "4200" | $$FILE)" = "false" ]
predicate_test_4300 = [ "$$(echo "4300" | $$FILE)" = "false" ]
predicate_test_4500 = [ "$$(echo "4500" | $$FILE)" = "false" ]
predicate_test_4600 = [ "$$(echo "4600" | $$FILE)" = "false" ]
predicate_test_4700 = [ "$$(echo "4700" | $$FILE)" = "false" ]
predicate_test_4900 = [ "$$(echo "4900" | $$FILE)" = "false" ]
predicate_test_5000 = [ "$$(echo "5000" | $$FILE)" = "false" ]
predicate_test_5100 = [ "$$(echo "5100" | $$FILE)" = "false" ]
predicate_test_5300 = [ "$$(echo "5300" | $$FILE)" = "false" ]
predicate_test_5400 = [ "$$(echo "5400" | $$FILE)" = "false" ]
predicate_test_5500 = [ "$$(echo "5500" | $$FILE)" = "false" ]
predicate_test_5700 = [ "$$(echo "5700" | $$FILE)" = "false" ]
predicate_test_5800 = [ "$$(echo "5800" | $$FILE)" = "false" ]
predicate_test_5900 = [ "$$(echo "5900" | $$FILE)" = "false" ]
predicate_test_6100 = [ "$$(echo "6100" | $$FILE)" = "false" ]
predicate_test_6200 = [ "$$(echo "6200" | $$FILE)" = "false" ]
predicate_test_6300 = [ "$$(echo "6300" | $$FILE)" = "false" ]
predicate_test_6500 = [ "$$(echo "6500" | $$FILE)" = "false" ]
predicate_test_6600 = [ "$$(echo "6600" | $$FILE)" = "false" ]
predicate_test_6700 = [ "$$(echo "6700" | $$FILE)" = "false" ]
predicate_test_6900 = [ "$$(echo "6900" | $$FILE)" = "false" ]
predicate_test_7000 = [ "$$(echo "7000" | $$FILE)" = "false" ]
predicate_test_7100 = [ "$$(echo "7100" | $$FILE)" = "false" ]
predicate_test_7300 = [ "$$(echo "7300" | $$FILE)" = "false" ]
predicate_test_7400 = [ "$$(echo "7400" | $$FILE)" = "false" ]
predicate_test_7500 = [ "$$(echo "7500" | $$FILE)" = "false" ]
predicate_test_7700 = [ "$$(echo "7700" | $$FILE)" = "false" ]
predicate_test_7800 = [ "$$(echo "7800" | $$FILE)" = "false" ]
predicate_test_7900 = [ "$$(echo "7900" | $$FILE)" = "false" ]
predicate_test_8100 = [ "$$(echo "8100" | $$FILE)" = "false" ]
predicate_test_8200 = [ "$$(echo "8200" | $$FILE)" = "false" ]
predicate_test_8300 = [ "$$(echo "8300" | $$FILE)" = "false" ]
predicate_test_8500 = [ "$$(echo "8500" | $$FILE)" = "false" ]
predicate_test_8600 = [ "$$(echo "8600" | $$FILE)" = "false" ]
predicate_test_8700 = [ "$$(echo "8700" | $$FILE)" = "false" ]
predicate_test_8900 = [ "$$(echo "8900" | $$FILE)" = "false" ]
predicate_test_9000 = [ "$$(echo "9000" | $$FILE)" = "false" ]
predicate_test_9100 = [ "$$(echo "9100" | $$FILE)" = "false" ]
predicate_test_9300 = [ "$$(echo "9300" | $$FILE)" = "false" ]
predicate_test_9400 = [ "$$(echo "9400" | $$FILE)" = "false" ]
predicate_test_9500 = [ "$$(echo "9500" | $$FILE)" = "false" ]
predicate_test_9700 = [ "$$(echo "9700" | $$FILE)" = "false" ]
predicate_test_9800 = [ "$$(echo "9800" | $$FILE)" = "false" ]
predicate_test_9900 = [ "$$(echo "9900" | $$FILE)" = "false" ]
# Multiples of 100 but not 400 under 10000 }}}

# Random multiples of 100 by not 400 {{{
predicate_test_RANDOM_ending_in_100  = [ "$$(echo "$${RANDOM}100"  | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_200  = [ "$$(echo "$${RANDOM}200"  | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_300  = [ "$$(echo "$${RANDOM}300"  | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_500  = [ "$$(echo "$${RANDOM}500"  | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_600  = [ "$$(echo "$${RANDOM}600"  | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_700  = [ "$$(echo "$${RANDOM}700"  | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_900  = [ "$$(echo "$${RANDOM}900"  | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_1000 = [ "$$(echo "$${RANDOM}1000" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_1100 = [ "$$(echo "$${RANDOM}1100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_1300 = [ "$$(echo "$${RANDOM}1300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_1400 = [ "$$(echo "$${RANDOM}1400" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_1500 = [ "$$(echo "$${RANDOM}1500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_1700 = [ "$$(echo "$${RANDOM}1700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_1800 = [ "$$(echo "$${RANDOM}1800" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_1900 = [ "$$(echo "$${RANDOM}1900" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_2100 = [ "$$(echo "$${RANDOM}2100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_2200 = [ "$$(echo "$${RANDOM}2200" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_2300 = [ "$$(echo "$${RANDOM}2300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_2500 = [ "$$(echo "$${RANDOM}2500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_2600 = [ "$$(echo "$${RANDOM}2600" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_2700 = [ "$$(echo "$${RANDOM}2700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_2900 = [ "$$(echo "$${RANDOM}2900" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_3000 = [ "$$(echo "$${RANDOM}3000" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_3100 = [ "$$(echo "$${RANDOM}3100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_3300 = [ "$$(echo "$${RANDOM}3300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_3400 = [ "$$(echo "$${RANDOM}3400" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_3500 = [ "$$(echo "$${RANDOM}3500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_3700 = [ "$$(echo "$${RANDOM}3700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_3800 = [ "$$(echo "$${RANDOM}3800" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_3900 = [ "$$(echo "$${RANDOM}3900" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_4100 = [ "$$(echo "$${RANDOM}4100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_4200 = [ "$$(echo "$${RANDOM}4200" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_4300 = [ "$$(echo "$${RANDOM}4300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_4500 = [ "$$(echo "$${RANDOM}4500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_4600 = [ "$$(echo "$${RANDOM}4600" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_4700 = [ "$$(echo "$${RANDOM}4700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_4900 = [ "$$(echo "$${RANDOM}4900" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_5000 = [ "$$(echo "$${RANDOM}5000" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_5100 = [ "$$(echo "$${RANDOM}5100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_5300 = [ "$$(echo "$${RANDOM}5300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_5400 = [ "$$(echo "$${RANDOM}5400" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_5500 = [ "$$(echo "$${RANDOM}5500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_5700 = [ "$$(echo "$${RANDOM}5700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_5800 = [ "$$(echo "$${RANDOM}5800" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_5900 = [ "$$(echo "$${RANDOM}5900" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_6100 = [ "$$(echo "$${RANDOM}6100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_6200 = [ "$$(echo "$${RANDOM}6200" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_6300 = [ "$$(echo "$${RANDOM}6300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_6500 = [ "$$(echo "$${RANDOM}6500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_6600 = [ "$$(echo "$${RANDOM}6600" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_6700 = [ "$$(echo "$${RANDOM}6700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_6900 = [ "$$(echo "$${RANDOM}6900" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_7000 = [ "$$(echo "$${RANDOM}7000" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_7100 = [ "$$(echo "$${RANDOM}7100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_7300 = [ "$$(echo "$${RANDOM}7300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_7400 = [ "$$(echo "$${RANDOM}7400" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_7500 = [ "$$(echo "$${RANDOM}7500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_7700 = [ "$$(echo "$${RANDOM}7700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_7800 = [ "$$(echo "$${RANDOM}7800" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_7900 = [ "$$(echo "$${RANDOM}7900" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_8100 = [ "$$(echo "$${RANDOM}8100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_8200 = [ "$$(echo "$${RANDOM}8200" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_8300 = [ "$$(echo "$${RANDOM}8300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_8500 = [ "$$(echo "$${RANDOM}8500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_8600 = [ "$$(echo "$${RANDOM}8600" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_8700 = [ "$$(echo "$${RANDOM}8700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_8900 = [ "$$(echo "$${RANDOM}8900" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_9000 = [ "$$(echo "$${RANDOM}9000" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_9100 = [ "$$(echo "$${RANDOM}9100" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_9300 = [ "$$(echo "$${RANDOM}9300" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_9400 = [ "$$(echo "$${RANDOM}9400" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_9500 = [ "$$(echo "$${RANDOM}9500" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_9700 = [ "$$(echo "$${RANDOM}9700" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_9800 = [ "$$(echo "$${RANDOM}9800" | $$FILE)" = "false" ]
predicate_test_RANDOM_ending_in_9900 = [ "$$(echo "$${RANDOM}9900" | $$FILE)" = "false" ]
# Random multiples of 100 by not 400 }}}

# Combined predicate {{{
predicate_test_years_divisible_by_100_but_not_400 = ${predicate_test_100}                   && \
                                                    ${predicate_test_200}                   && \
                                                    ${predicate_test_300}                   && \
                                                    ${predicate_test_500}                   && \
                                                    ${predicate_test_600}                   && \
                                                    ${predicate_test_700}                   && \
                                                    ${predicate_test_900}                   && \
                                                    ${predicate_test_1000}                  && \
                                                    ${predicate_test_1100}                  && \
                                                    ${predicate_test_1300}                  && \
                                                    ${predicate_test_1400}                  && \
                                                    ${predicate_test_1500}                  && \
                                                    ${predicate_test_1700}                  && \
                                                    ${predicate_test_1800}                  && \
                                                    ${predicate_test_1900}                  && \
                                                    ${predicate_test_2100}                  && \
                                                    ${predicate_test_2200}                  && \
                                                    ${predicate_test_2300}                  && \
                                                    ${predicate_test_2500}                  && \
                                                    ${predicate_test_2600}                  && \
                                                    ${predicate_test_2700}                  && \
                                                    ${predicate_test_2900}                  && \
                                                    ${predicate_test_3000}                  && \
                                                    ${predicate_test_3100}                  && \
                                                    ${predicate_test_3300}                  && \
                                                    ${predicate_test_3400}                  && \
                                                    ${predicate_test_3500}                  && \
                                                    ${predicate_test_3700}                  && \
                                                    ${predicate_test_3800}                  && \
                                                    ${predicate_test_3900}                  && \
                                                    ${predicate_test_4100}                  && \
                                                    ${predicate_test_4200}                  && \
                                                    ${predicate_test_4300}                  && \
                                                    ${predicate_test_4500}                  && \
                                                    ${predicate_test_4600}                  && \
                                                    ${predicate_test_4700}                  && \
                                                    ${predicate_test_4900}                  && \
                                                    ${predicate_test_5000}                  && \
                                                    ${predicate_test_5100}                  && \
                                                    ${predicate_test_5300}                  && \
                                                    ${predicate_test_5400}                  && \
                                                    ${predicate_test_5500}                  && \
                                                    ${predicate_test_5700}                  && \
                                                    ${predicate_test_5800}                  && \
                                                    ${predicate_test_5900}                  && \
                                                    ${predicate_test_6100}                  && \
                                                    ${predicate_test_6200}                  && \
                                                    ${predicate_test_6300}                  && \
                                                    ${predicate_test_6500}                  && \
                                                    ${predicate_test_6600}                  && \
                                                    ${predicate_test_6700}                  && \
                                                    ${predicate_test_6900}                  && \
                                                    ${predicate_test_7000}                  && \
                                                    ${predicate_test_7100}                  && \
                                                    ${predicate_test_7300}                  && \
                                                    ${predicate_test_7400}                  && \
                                                    ${predicate_test_7500}                  && \
                                                    ${predicate_test_7700}                  && \
                                                    ${predicate_test_7800}                  && \
                                                    ${predicate_test_7900}                  && \
                                                    ${predicate_test_8100}                  && \
                                                    ${predicate_test_8200}                  && \
                                                    ${predicate_test_8300}                  && \
                                                    ${predicate_test_8500}                  && \
                                                    ${predicate_test_8600}                  && \
                                                    ${predicate_test_8700}                  && \
                                                    ${predicate_test_8900}                  && \
                                                    ${predicate_test_9000}                  && \
                                                    ${predicate_test_9100}                  && \
                                                    ${predicate_test_9300}                  && \
                                                    ${predicate_test_9400}                  && \
                                                    ${predicate_test_9500}                  && \
                                                    ${predicate_test_9700}                  && \
                                                    ${predicate_test_9800}                  && \
                                                    ${predicate_test_9900}                  && \
                                                    ${predicate_test_RANDOM_ending_in_100}  && \
                                                    ${predicate_test_RANDOM_ending_in_200}  && \
                                                    ${predicate_test_RANDOM_ending_in_300}  && \
                                                    ${predicate_test_RANDOM_ending_in_500}  && \
                                                    ${predicate_test_RANDOM_ending_in_600}  && \
                                                    ${predicate_test_RANDOM_ending_in_700}  && \
                                                    ${predicate_test_RANDOM_ending_in_900}  && \
                                                    ${predicate_test_RANDOM_ending_in_1000} && \
                                                    ${predicate_test_RANDOM_ending_in_1100} && \
                                                    ${predicate_test_RANDOM_ending_in_1300} && \
                                                    ${predicate_test_RANDOM_ending_in_1400} && \
                                                    ${predicate_test_RANDOM_ending_in_1500} && \
                                                    ${predicate_test_RANDOM_ending_in_1700} && \
                                                    ${predicate_test_RANDOM_ending_in_1800} && \
                                                    ${predicate_test_RANDOM_ending_in_1900} && \
                                                    ${predicate_test_RANDOM_ending_in_2100} && \
                                                    ${predicate_test_RANDOM_ending_in_2200} && \
                                                    ${predicate_test_RANDOM_ending_in_2300} && \
                                                    ${predicate_test_RANDOM_ending_in_2500} && \
                                                    ${predicate_test_RANDOM_ending_in_2600} && \
                                                    ${predicate_test_RANDOM_ending_in_2700} && \
                                                    ${predicate_test_RANDOM_ending_in_2900} && \
                                                    ${predicate_test_RANDOM_ending_in_3000} && \
                                                    ${predicate_test_RANDOM_ending_in_3100} && \
                                                    ${predicate_test_RANDOM_ending_in_3300} && \
                                                    ${predicate_test_RANDOM_ending_in_3400} && \
                                                    ${predicate_test_RANDOM_ending_in_3500} && \
                                                    ${predicate_test_RANDOM_ending_in_3700} && \
                                                    ${predicate_test_RANDOM_ending_in_3800} && \
                                                    ${predicate_test_RANDOM_ending_in_3900} && \
                                                    ${predicate_test_RANDOM_ending_in_4100} && \
                                                    ${predicate_test_RANDOM_ending_in_4200} && \
                                                    ${predicate_test_RANDOM_ending_in_4300} && \
                                                    ${predicate_test_RANDOM_ending_in_4500} && \
                                                    ${predicate_test_RANDOM_ending_in_4600} && \
                                                    ${predicate_test_RANDOM_ending_in_4700} && \
                                                    ${predicate_test_RANDOM_ending_in_4900} && \
                                                    ${predicate_test_RANDOM_ending_in_5000} && \
                                                    ${predicate_test_RANDOM_ending_in_5100} && \
                                                    ${predicate_test_RANDOM_ending_in_5300} && \
                                                    ${predicate_test_RANDOM_ending_in_5400} && \
                                                    ${predicate_test_RANDOM_ending_in_5500} && \
                                                    ${predicate_test_RANDOM_ending_in_5700} && \
                                                    ${predicate_test_RANDOM_ending_in_5800} && \
                                                    ${predicate_test_RANDOM_ending_in_5900} && \
                                                    ${predicate_test_RANDOM_ending_in_6100} && \
                                                    ${predicate_test_RANDOM_ending_in_6200} && \
                                                    ${predicate_test_RANDOM_ending_in_6300} && \
                                                    ${predicate_test_RANDOM_ending_in_6500} && \
                                                    ${predicate_test_RANDOM_ending_in_6600} && \
                                                    ${predicate_test_RANDOM_ending_in_6700} && \
                                                    ${predicate_test_RANDOM_ending_in_6900} && \
                                                    ${predicate_test_RANDOM_ending_in_7000} && \
                                                    ${predicate_test_RANDOM_ending_in_7100} && \
                                                    ${predicate_test_RANDOM_ending_in_7300} && \
                                                    ${predicate_test_RANDOM_ending_in_7400} && \
                                                    ${predicate_test_RANDOM_ending_in_7500} && \
                                                    ${predicate_test_RANDOM_ending_in_7700} && \
                                                    ${predicate_test_RANDOM_ending_in_7800} && \
                                                    ${predicate_test_RANDOM_ending_in_7900} && \
                                                    ${predicate_test_RANDOM_ending_in_8100} && \
                                                    ${predicate_test_RANDOM_ending_in_8200} && \
                                                    ${predicate_test_RANDOM_ending_in_8300} && \
                                                    ${predicate_test_RANDOM_ending_in_8500} && \
                                                    ${predicate_test_RANDOM_ending_in_8600} && \
                                                    ${predicate_test_RANDOM_ending_in_8700} && \
                                                    ${predicate_test_RANDOM_ending_in_8900} && \
                                                    ${predicate_test_RANDOM_ending_in_9000} && \
                                                    ${predicate_test_RANDOM_ending_in_9100} && \
                                                    ${predicate_test_RANDOM_ending_in_9300} && \
                                                    ${predicate_test_RANDOM_ending_in_9400} && \
                                                    ${predicate_test_RANDOM_ending_in_9500} && \
                                                    ${predicate_test_RANDOM_ending_in_9700} && \
                                                    ${predicate_test_RANDOM_ending_in_9800} && \
                                                    ${predicate_test_RANDOM_ending_in_9900}
# Combined predicate }}}

# Test cases for years divisible by 100 but not 400 }}}

# Test cases for years divisible by 400 {{{

# Multiples of 4 under 10000 {{{
predicate_test_400  = [ "$$(echo "400"  | $$FILE)" = "true" ]
predicate_test_800  = [ "$$(echo "800"  | $$FILE)" = "true" ]
predicate_test_1200 = [ "$$(echo "1200" | $$FILE)" = "true" ]
predicate_test_1600 = [ "$$(echo "1600" | $$FILE)" = "true" ]
predicate_test_2000 = [ "$$(echo "2000" | $$FILE)" = "true" ]
predicate_test_2400 = [ "$$(echo "2400" | $$FILE)" = "true" ]
predicate_test_2800 = [ "$$(echo "2800" | $$FILE)" = "true" ]
predicate_test_3200 = [ "$$(echo "3200" | $$FILE)" = "true" ]
predicate_test_3600 = [ "$$(echo "3600" | $$FILE)" = "true" ]
predicate_test_4000 = [ "$$(echo "4000" | $$FILE)" = "true" ]
predicate_test_4400 = [ "$$(echo "4400" | $$FILE)" = "true" ]
predicate_test_4800 = [ "$$(echo "4800" | $$FILE)" = "true" ]
predicate_test_5200 = [ "$$(echo "5200" | $$FILE)" = "true" ]
predicate_test_5600 = [ "$$(echo "5600" | $$FILE)" = "true" ]
predicate_test_6000 = [ "$$(echo "6000" | $$FILE)" = "true" ]
predicate_test_6400 = [ "$$(echo "6400" | $$FILE)" = "true" ]
predicate_test_6800 = [ "$$(echo "6800" | $$FILE)" = "true" ]
predicate_test_7200 = [ "$$(echo "7200" | $$FILE)" = "true" ]
predicate_test_7600 = [ "$$(echo "7600" | $$FILE)" = "true" ]
predicate_test_8000 = [ "$$(echo "8000" | $$FILE)" = "true" ]
predicate_test_8400 = [ "$$(echo "8400" | $$FILE)" = "true" ]
predicate_test_8800 = [ "$$(echo "8800" | $$FILE)" = "true" ]
predicate_test_9200 = [ "$$(echo "9200" | $$FILE)" = "true" ]
predicate_test_9600 = [ "$$(echo "9600" | $$FILE)" = "true" ]
# Multiples of 4 under 10000 }}}

# Random multiples of 4 {{{
predicate_test_RANDOM_ending_in_400  = [ "$$(echo "$${RANDOM}400"  | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_800  = [ "$$(echo "$${RANDOM}800"  | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_1200 = [ "$$(echo "$${RANDOM}1200" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_1600 = [ "$$(echo "$${RANDOM}1600" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_2000 = [ "$$(echo "$${RANDOM}2000" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_2400 = [ "$$(echo "$${RANDOM}2400" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_2800 = [ "$$(echo "$${RANDOM}2800" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_3200 = [ "$$(echo "$${RANDOM}3200" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_3600 = [ "$$(echo "$${RANDOM}3600" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_4000 = [ "$$(echo "$${RANDOM}4000" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_4400 = [ "$$(echo "$${RANDOM}4400" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_4800 = [ "$$(echo "$${RANDOM}4800" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_5200 = [ "$$(echo "$${RANDOM}5200" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_5600 = [ "$$(echo "$${RANDOM}5600" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_6000 = [ "$$(echo "$${RANDOM}6000" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_6400 = [ "$$(echo "$${RANDOM}6400" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_6800 = [ "$$(echo "$${RANDOM}6800" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_7200 = [ "$$(echo "$${RANDOM}7200" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_7600 = [ "$$(echo "$${RANDOM}7600" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_8000 = [ "$$(echo "$${RANDOM}8000" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_8400 = [ "$$(echo "$${RANDOM}8400" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_8800 = [ "$$(echo "$${RANDOM}8800" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_9200 = [ "$$(echo "$${RANDOM}9200" | $$FILE)" = "true" ]
predicate_test_RANDOM_ending_in_9600 = [ "$$(echo "$${RANDOM}9600" | $$FILE)" = "true" ]
# Random multiples of 4 }}}

# Combined predicate {{{
predicate_test_years_divisible_by_400 = ${predicate_test_400}                   && \
                                        ${predicate_test_800}                   && \
                                        ${predicate_test_1200}                  && \
                                        ${predicate_test_1600}                  && \
                                        ${predicate_test_2000}                  && \
                                        ${predicate_test_2400}                  && \
                                        ${predicate_test_2800}                  && \
                                        ${predicate_test_3200}                  && \
                                        ${predicate_test_3600}                  && \
                                        ${predicate_test_4000}                  && \
                                        ${predicate_test_4400}                  && \
                                        ${predicate_test_4800}                  && \
                                        ${predicate_test_5200}                  && \
                                        ${predicate_test_5600}                  && \
                                        ${predicate_test_6000}                  && \
                                        ${predicate_test_6400}                  && \
                                        ${predicate_test_6800}                  && \
                                        ${predicate_test_7200}                  && \
                                        ${predicate_test_7600}                  && \
                                        ${predicate_test_8000}                  && \
                                        ${predicate_test_8400}                  && \
                                        ${predicate_test_8800}                  && \
                                        ${predicate_test_9200}                  && \
                                        ${predicate_test_9600}                  && \
                                        ${predicate_test_RANDOM_ending_in_400}  && \
                                        ${predicate_test_RANDOM_ending_in_800}  && \
                                        ${predicate_test_RANDOM_ending_in_1200} && \
                                        ${predicate_test_RANDOM_ending_in_1600} && \
                                        ${predicate_test_RANDOM_ending_in_2000} && \
                                        ${predicate_test_RANDOM_ending_in_2400} && \
                                        ${predicate_test_RANDOM_ending_in_2800} && \
                                        ${predicate_test_RANDOM_ending_in_3200} && \
                                        ${predicate_test_RANDOM_ending_in_3600} && \
                                        ${predicate_test_RANDOM_ending_in_4000} && \
                                        ${predicate_test_RANDOM_ending_in_4400} && \
                                        ${predicate_test_RANDOM_ending_in_4800} && \
                                        ${predicate_test_RANDOM_ending_in_5200} && \
                                        ${predicate_test_RANDOM_ending_in_5600} && \
                                        ${predicate_test_RANDOM_ending_in_6000} && \
                                        ${predicate_test_RANDOM_ending_in_6400} && \
                                        ${predicate_test_RANDOM_ending_in_6800} && \
                                        ${predicate_test_RANDOM_ending_in_7200} && \
                                        ${predicate_test_RANDOM_ending_in_7600} && \
                                        ${predicate_test_RANDOM_ending_in_8000} && \
                                        ${predicate_test_RANDOM_ending_in_8400} && \
                                        ${predicate_test_RANDOM_ending_in_8800} && \
                                        ${predicate_test_RANDOM_ending_in_9200} && \
                                        ${predicate_test_RANDOM_ending_in_9600}
# Combined predicate }}}

# Test cases for years divisible by 400 }}}

# Test case predicates }}}

