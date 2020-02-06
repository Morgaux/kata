#
# _ALPHABET_CIPHER_TESTS for a alphabet_cipher implementation
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

_ALPHABET_CIPHER_TESTS = test_alphabet_cipher_file_is_executable                                                     \
                         test_alphabet_cipher_can_encode_message_with_secret_keyword                                 \
                         test_alphabet_cipher_can_decode_message_with_secret_keyword                                 \
                         test_alphabet_cipher_can_extract_secret_keyword_from_encrypted_message_and_original_message

_ALPHABET_CIPHER_FILES = bin/alphabet_cipher/haskell_implementation

predicate_test_alphabet_cipher_file_is_executable = [ -x  $$FILE ]
predicate_test_alphabet_cipher_can_encode_message_with_secret_keyword = false
predicate_test_alphabet_cipher_can_decode_message_with_secret_keyword = false
predicate_test_alphabet_cipher_can_extract_secret_keyword_from_encrypted_message_and_original_message = false

test_alphabet_cipher: ${_ALPHABET_CIPHER_TESTS}
	@echo All alphabet_cipher tests completed...
	@echo  

.PHONY: test_alphabet_cipher 

