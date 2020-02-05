#
# _ALPHABET_CIPHER_TESTS for a alphabet_cipher implementation
#

_ALPHABET_CIPHER_TESTS = test_alphabet_cipher_file_is_executable                                                     \
                         test_alphabet_cipher_can_encode_message_with_secret_keyword                                 \
                         test_alphabet_cipher_can_decode_message_with_secret_keyword                                 \
                         test_alphabet_cipher_can_extract_secret_keyword_from_encrypted_message_and_original_message

_ALPHABET_CIPHER_FILES = 

predicate_test_alphabet_cipher_file_is_executable = [ -x  $$FILE ]
predicate_test_alphabet_cipher_can_encode_message_with_secret_keyword = false
predicate_test_alphabet_cipher_can_decode_message_with_secret_keyword = false
predicate_test_alphabet_cipher_can_extract_secret_keyword_from_encrypted_message_and_original_message = false

test_alphabet_cipher: ${_ALPHABET_CIPHER_TESTS}
	@echo All alphabet_cipher tests completed...
	@echo  

.PHONY: test_alphabet_cipher 

