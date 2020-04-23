#
# Tests for a alphabet_cipher implementation
#

#
# the interface is as follows:
# - STDIN is read
# - each line must contain on of the following patterns:
#   - encode key=[a-zA-Z] message=[a-zA-Z]
#   - decode key=[a-zA-Z] message=[a-zA-Z]
#   - decipher plaintext=[a-zA-Z] ciphertext=[a-zA-Z]
# - the encode keyword will return the ciphertext of the message given
# - the decode keyword will return the plaintext of the message given
# - the decipher keyword will return the key used to encrypt the message
#

# Setup {{{
include config.mk

KATA     = "ALPHABET CIPHER"
KATA_DIR = alphabet_cipher

TEST_CASES = test_file_is_executable                                                                     \
             test_alphabet_cipher_can_encode_message_with_secret_keyword                                 \
             test_alphabet_cipher_can_decode_message_with_secret_keyword                                 \
             test_alphabet_cipher_can_extract_secret_keyword_from_encrypted_message_and_original_message

TEST_LANGS = ${LANGS}

all: message_before ${TEST_CASES}

include test/tests.mk
include builds.mk
# Setup }}}

# Test case predicates {{{
predicate_test_alphabet_cipher_can_encode_message_with_secret_keyword = [ "$$(echo 'encode key=vigilance message=meetmeontuesdayeveningatseven'     | $$FILE)" = "hmkbxebpxpmyllyrxiiqtoltfgzzv"     ] && \
                                                                        [ "$$(echo 'encode key=vigilance message=thequickbrownfoxjumpsoveralazydog' | $$FILE)" = "opkyfipmfmwcvqoklyhxywgeecpvhelzg" ] && \
                                                                        [ "$$(echo 'encode key=scones    message=meetmebythetree'                   | $$FILE)" = "egsgqwtahuiljgs"                   ] && \
                                                                        [ "$$(echo 'encode key=scones    message=packmyboxwithfivedozenliquorjugs'  | $$FILE)" = "hcqxqqtqljmlzhwiivgbsapaiwcenmyu"  ] && \
                                                                        [ "$$(echo 'encode key=abcabcx   message=hellofromrussia'                   | $$FILE)" = "hfnlphoontutufa"                   ]

predicate_test_alphabet_cipher_can_decode_message_with_secret_keyword = [ "$$(echo 'decode key=vigilance message=hmkbxebpxpmyllyrxiiqtoltfgzzv'     | $$FILE)" = "meetmeontuesdayeveningatseven"     ] && \
                                                                        [ "$$(echo 'decode key=vigilance message=opkyfipmfmwcvqoklyhxywgeecpvhelzg' | $$FILE)" = "thequickbrownfoxjumpsoveralazydog" ] && \
                                                                        [ "$$(echo 'decode key=scones    message=egsgqwtahuiljgs'                   | $$FILE)" = "meetmebythetree"                   ] && \
                                                                        [ "$$(echo 'decode key=scones    message=hcqxqqtqljmlzhwiivgbsapaiwcenmyu'  | $$FILE)" = "packmyboxwithfivedozenliquorjugs"  ] && \
                                                                        [ "$$(echo 'decode key=abcabcx   message=hfnlphoontutufa'                   | $$FILE)" = "hellofromrussia"                   ]

predicate_test_alphabet_cipher_can_extract_secret_keyword_from_encrypted_message_and_original_message = [ "$$(echo 'decipher plaintext=meetmeontuesdayeveningatseven     ciphertext=hmkbxebpxpmyllyrxiiqtoltfgzzv'     | $$FILE)" = "vigilance" ] && \
                                                                                                        [ "$$(echo 'decipher plaintext=thequickbrownfoxjumpsoveralazydog ciphertext=opkyfipmfmwcvqoklyhxywgeecpvhelzg' | $$FILE)" = "vigilance" ] && \
                                                                                                        [ "$$(echo 'decipher plaintext=meetmebythetree                   ciphertext=egsgqwtahuiljgs'                   | $$FILE)" = "scones"    ] && \
                                                                                                        [ "$$(echo 'decipher plaintext=packmyboxwithfivedozenliquorjugs  ciphertext=hcqxqqtqljmlzhwiivgbsapaiwcenmyu'  | $$FILE)" = "scones"    ] && \
                                                                                                        [ "$$(echo 'decipher plaintext=hellofromrussia                   ciphertext=hfnlphoontutufa'                   | $$FILE)" = "abcabcx"   ]
# Test case predicates }}}

