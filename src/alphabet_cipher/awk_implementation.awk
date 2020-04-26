#!/usr/bin/awk -f
# note, this shebang is reasonably portable, however,
# for best portability or to pass additional arguments
# to the interpreter a shell wrapper should be used.

# A POSIX AWK alphabet_cipher

function char_at(str, i) { # {{{
	return substr(str, (i + 1) % length(str), 1)
} # }}}

function encode(key, msg) { # {{{
	for (i = 0; i < length(msg); i++) {
		for (j = 0; j < length(alphabet); j++) {
			if (char_at(alphabet, j) == char_at(key, i))
				key_index = j
			if (char_at(alphabet, j) == char_at(msg, i))
				msg_index = j
		}
		printf "%s", char_at(alphabet, key_index + msg_index)
	}
	printf "\n"
} # }}}

function decode(key, msg) { # {{{
	printf "key: %s\nmsg: %s\n", key, msg
} # }}}

function decipher(plaintext, cipher) { # {{{
	printf "plaintext:  %s\nciphertext: %s\n", plaintext, ciphertext
} # }}}

BEGIN { # {{{
	alphabet = "abcdefghijklmnopqrstuvwxyz"
} #}}}

/^encode key=[a-z]+ message=[a-z]+/ { # {{{
	encode(substr($2, 5), substr($3, 9))
} # }}}

/^encode message=[a-z]+ key=[a-z]+/ { # {{{
	encode(substr($3, 5), substr($2, 9))
} # }}}

/^decode key=[a-z]+ message=[a-z]+/ { # {{{
	decode(substr($2, 5), substr($3, 9))
} # }}}

/^decode message=[a-z]+ key=[a-z]+/ { # {{{
	decode(substr($3, 5), substr($2, 9))
} # }}}

/^decipher plaintext=[a-z]+ ciphertext=[a-z]+/ { # {{{
	decipher(substr($2, 11), substr($3, 12))
} # }}}

/^decipher ciphertext=[a-z]+ plaintext=[a-z]+/ { # {{{
	decipher(substr($3, 11), substr($2, 12))
} # }}}

