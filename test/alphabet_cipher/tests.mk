#
# _ALPHABET_CIPHER_TESTS for a alphabet_cipher implementation
#

_ALPHABET_CIPHER_TESTS = test_alphabet_cipher_file_is_executable

_ALPHABET_CIPHER_FILES = 

predicate_test_alphabet_cipher_file_is_executable = [ -x  $$FILE ]

test_alphabet_cipher: ${_ALPHABET_CIPHER_TESTS}
	@echo All alphabet_cipher tests completed...
	@echo  

.PHONY: test_alphabet_cipher 

