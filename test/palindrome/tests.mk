#
# Tests for a palindrome checker implementation
#

#
# The interface is as follows:
# - for every line that is input either "true" or "false" is output
# - "true" is output if the line, when striped of whitespace, is the same when
#   reversed
# - "false" is output if the line doesn't match the criteria for "true"
# - empty lines are not considered palindromes
#

KATA = "PALINDROME"

# test cases {{{
TEST_CASES = test_file_is_executable                                \
             test_input_line_count_matches_output_line_count        \
             test_empty_line_fails                                  \
             test_single_words                                      \
             test_multiple_words                                    \
             test_non_palindromes_return_false                      \
             test_palindromes_return_true
# test cases }}}

TEST_FILES = bin/palindrome/python_implementation

all: message_before ${TEST_CASES}

include test/tests.mk
include builds.mk

# individual predicate tests {{{

# misc tests {{{
predicate_test_empty_line_fails = [ "$$(echo "" | $$FILE)" = "false" ]
# misc tests }}}

# single words, should return true {{{
predicate_test_single_word_anna    = [ "$$(echo "anna"    | $$FILE)" = "true" ]
predicate_test_single_word_civic   = [ "$$(echo "civic"   | $$FILE)" = "true" ]
predicate_test_single_word_kayak   = [ "$$(echo "kayak"   | $$FILE)" = "true" ]
predicate_test_single_word_level   = [ "$$(echo "level"   | $$FILE)" = "true" ]
predicate_test_single_word_madam   = [ "$$(echo "madam"   | $$FILE)" = "true" ]
predicate_test_single_word_mom     = [ "$$(echo "mom"     | $$FILE)" = "true" ]
predicate_test_single_word_noon    = [ "$$(echo "noon"    | $$FILE)" = "true" ]
predicate_test_single_word_rotator = [ "$$(echo "rotator" | $$FILE)" = "true" ]
predicate_test_single_word_repaper = [ "$$(echo "repaper" | $$FILE)" = "true" ]
predicate_test_single_word_racecar = [ "$$(echo "racecar" | $$FILE)" = "true" ]
# single words, should return true }}}

# single words, should return false {{{
predicate_test_single_word_palindrome  = [ "$$(echo "palindrome"  | $$FILE)" = "false" ]
predicate_test_single_word_longest     = [ "$$(echo "longest"     | $$FILE)" = "false" ]
predicate_test_single_word_dictionary  = [ "$$(echo "dictionary"  | $$FILE)" = "false" ]
predicate_test_single_word_makefile    = [ "$$(echo "makefile"    | $$FILE)" = "false" ]
predicate_test_single_word_number      = [ "$$(echo "number"      | $$FILE)" = "false" ]
predicate_test_single_word_history     = [ "$$(echo "history"     | $$FILE)" = "false" ]
predicate_test_single_word_common      = [ "$$(echo "common"      | $$FILE)" = "false" ]
predicate_test_single_word_character   = [ "$$(echo "character"   | $$FILE)" = "false" ]
predicate_test_single_word_test        = [ "$$(echo "test"        | $$FILE)" = "false" ]
predicate_test_single_word_information = [ "$$(echo "information" | $$FILE)" = "false" ]
# single words, should return false }}}

# multiple words, should return true {{{
predicate_test_multiple_words_don_t_nod                     = [ "$$(echo "Don\'t nod"                    | $$FILE)" = "true" ]
predicate_test_multiple_words_i_did_did_i                   = [ "$$(echo "I did, did I?"                 | $$FILE)" = "true" ]
predicate_test_multiple_words_my_gym                        = [ "$$(echo "My gym"                        | $$FILE)" = "true" ]
predicate_test_multiple_words_red_rum_sir_is_murder         = [ "$$(echo "Red rum, sir, is murder"       | $$FILE)" = "true" ]
predicate_test_multiple_words_step_on_no_pets               = [ "$$(echo "Step on no pets"               | $$FILE)" = "true" ]
predicate_test_multiple_words_top_spot                      = [ "$$(echo "Top spot"                      | $$FILE)" = "true" ]
predicate_test_multiple_words_was_it_a_cat_i_saw            = [ "$$(echo "Was it a cat I saw?"           | $$FILE)" = "true" ]
predicate_test_multiple_words_eva_can_i_see_bees_in_a_cave  = [ "$$(echo "Eva, can I see bees in a cave" | $$FILE)" = "true" ]
predicate_test_multiple_words_no_lemon_no_melon             = [ "$$(echo "No lemon, no melon"            | $$FILE)" = "true" ]
predicate_test_multiple_words_able_was_i_ere_i_saw_elba     = [ "$$(echo "Able was I, ere I saw Elba"    | $$FILE)" = "true" ]
# multiple words, should return true }}}

# multiple words, should return false {{{
predicate_test_multiple_words_hip_hip_hooray                     = [ "$$(echo "Hip! Hip! Hooray!"                  | $$FILE)" = "false" ]
predicate_test_multiple_words_this_is_not_a_palindrome           = [ "$$(echo "This is not a palindrome"           | $$FILE)" = "false" ]
predicate_test_multiple_words_long_live_the_king                 = [ "$$(echo "Long live the king"                 | $$FILE)" = "false" ]
predicate_test_multiple_words_i_wonder_why                       = [ "$$(echo "I wonder why?"                      | $$FILE)" = "false" ]
predicate_test_multiple_words_better_than_sliced_bread           = [ "$$(echo "Better than sliced bread!"          | $$FILE)" = "false" ]
predicate_test_multiple_words_fish_market                        = [ "$$(echo "Fish market"                        | $$FILE)" = "false" ]
predicate_test_multiple_words_pick_a_key                         = [ "$$(echo "Pick a key!"                        | $$FILE)" = "false" ]
predicate_test_multiple_words_round_and_round_the_merry_go_round = [ "$$(echo "Round and Round the merry-go-round" | $$FILE)" = "false" ]
predicate_test_multiple_words_that_s_the_way_the_money_goes      = [ "$$(echo "That\'s the way the money goes"      | $$FILE)" = "false" ]
predicate_test_multiple_words_minor_be_splat                     = [ "$$(echo "Minor be splat"                     | $$FILE)" = "false" ]
# multiple words, should return false }}}

# individual predicate tests }}}

# combined predicates {{{

# single words, tests for both true and false {{{
predicate_test_single_words = ${predicate_test_single_word_anna}        && \
                              ${predicate_test_single_word_civic}       && \
                              ${predicate_test_single_word_kayak}       && \
                              ${predicate_test_single_word_level}       && \
                              ${predicate_test_single_word_madam}       && \
                              ${predicate_test_single_word_mom}         && \
                              ${predicate_test_single_word_noon}        && \
                              ${predicate_test_single_word_rotator}     && \
                              ${predicate_test_single_word_repaper}     && \
                              ${predicate_test_single_word_racecar}     && \
                              ${predicate_test_single_word_palindrome}  && \
                              ${predicate_test_single_word_longest}     && \
                              ${predicate_test_single_word_dictionary}  && \
                              ${predicate_test_single_word_makefile}    && \
                              ${predicate_test_single_word_number}      && \
                              ${predicate_test_single_word_history}     && \
                              ${predicate_test_single_word_common}      && \
                              ${predicate_test_single_word_character}   && \
                              ${predicate_test_single_word_test}        && \
                              ${predicate_test_single_word_information}
# single words, tests for both true and false }}}

# multiple words, tests for both true and false {{{
predicate_test_multiple_words = ${predicate_test_multiple_words_don_t_nod}                              && \
                                ${predicate_test_multiple_words_i_did_did_i}                            && \
                                ${predicate_test_multiple_words_my_gym}                                 && \
                                ${predicate_test_multiple_words_red_rum_sir_is_murder}                  && \
                                ${predicate_test_multiple_words_step_on_no_pets}                        && \
                                ${predicate_test_multiple_words_top_spot}                               && \
                                ${predicate_test_multiple_words_was_it_a_cat_i_saw}                     && \
                                ${predicate_test_multiple_words_eva_can_i_see_bees_in_a_cave}           && \
                                ${predicate_test_multiple_words_no_lemon_no_melon}                      && \
                                ${predicate_test_multiple_words_able_was_i_ere_i_saw_elba}              && \
                                ${predicate_test_multiple_words_hip_hip_hooray}                         && \
                                ${predicate_test_multiple_words_this_is_not_a_palindrome}               && \
                                ${predicate_test_multiple_words_long_live_the_king}                     && \
                                ${predicate_test_multiple_words_i_wonder_why}                           && \
                                ${predicate_test_multiple_words_better_than_sliced_bread}               && \
                                ${predicate_test_multiple_words_fish_market}                            && \
                                ${predicate_test_multiple_words_pick_a_key}                             && \
                                ${predicate_test_multiple_words_round_and_round_the_merry_go_round}     && \
                                ${predicate_test_multiple_words_that_s_the_way_the_money_goes}          && \
                                ${predicate_test_multiple_words_minor_be_splat}
# multiple words, tests for both true and false }}}

# correct palindromes {{{
predicate_test_palindromes_return_true = ${predicate_test_single_word_anna}                             && \
                                         ${predicate_test_single_word_civic}                            && \
                                         ${predicate_test_single_word_kayak}                            && \
                                         ${predicate_test_single_word_level}                            && \
                                         ${predicate_test_single_word_madam}                            && \
                                         ${predicate_test_single_word_mom}                              && \
                                         ${predicate_test_single_word_noon}                             && \
                                         ${predicate_test_single_word_rotator}                          && \
                                         ${predicate_test_single_word_repaper}                          && \
                                         ${predicate_test_single_word_racecar}                          && \
                                         ${predicate_test_multiple_words_don_t_nod}                     && \
                                         ${predicate_test_multiple_words_i_did_did_i}                   && \
                                         ${predicate_test_multiple_words_my_gym}                        && \
                                         ${predicate_test_multiple_words_red_rum_sir_is_murder}         && \
                                         ${predicate_test_multiple_words_step_on_no_pets}               && \
                                         ${predicate_test_multiple_words_top_spot}                      && \
                                         ${predicate_test_multiple_words_was_it_a_cat_i_saw}            && \
                                         ${predicate_test_multiple_words_eva_can_i_see_bees_in_a_cave}  && \
                                         ${predicate_test_multiple_words_no_lemon_no_melon}             && \
                                         ${predicate_test_multiple_words_able_was_i_ere_i_saw_elba}
# correct palindromes }}}

# incorrect palindromes {{{
predicate_test_non_palindromes_return_false = ${predicate_test_single_word_palindrome}                            && \
                                              ${predicate_test_single_word_longest}                               && \
                                              ${predicate_test_single_word_dictionary}                            && \
                                              ${predicate_test_single_word_makefile}                              && \
                                              ${predicate_test_single_word_number}                                && \
                                              ${predicate_test_single_word_history}                               && \
                                              ${predicate_test_single_word_common}                                && \
                                              ${predicate_test_single_word_character}                             && \
                                              ${predicate_test_single_word_test}                                  && \
                                              ${predicate_test_single_word_information}                           && \
                                              ${predicate_test_multiple_words_hip_hip_hooray}                     && \
                                              ${predicate_test_multiple_words_this_is_not_a_palindrome}           && \
                                              ${predicate_test_multiple_words_long_live_the_king}                 && \
                                              ${predicate_test_multiple_words_i_wonder_why}                       && \
                                              ${predicate_test_multiple_words_better_than_sliced_bread}           && \
                                              ${predicate_test_multiple_words_fish_market}                        && \
                                              ${predicate_test_multiple_words_pick_a_key}                         && \
                                              ${predicate_test_multiple_words_round_and_round_the_merry_go_round} && \
                                              ${predicate_test_multiple_words_that_s_the_way_the_money_goes}      && \
                                              ${predicate_test_multiple_words_minor_be_splat}
# incorrect palindromes }}}

# combined predicates }}}

