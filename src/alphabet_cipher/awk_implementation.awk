#!/usr/bin/awk -f
# note, this shebang is reasonably portable, however,
# for best portability or to pass additional arguments
# to the interpreter a shell wrapper should be used.

# A POSIX AWK alphabet_cipher

alphabet = "abcdefghijklmnopqrstuvwxyz"

function encode(key, msg) { # {{{
	for (i = 1; i < length(msg) + 1; i++) {
		key_index = index(alphabet, substr(key, (i % 26), 1)) - 1
		msg_index = index(alphabet, substr(msg, i,        1)) - 1
		out_index = key_index + msg_index
		printf "%s", substr(alphabet, (out_index % 26) + 1, 1)
	}
	printf "\n"
} # }}}

function decode(key, msg) { # {{{
	printf "%s\n", alphabet
} # }}}

function decipher(plain, cipher) { # {{{
	printf "%s\n", alphabet
} # }}}

/z^encode key=[a-z]+ message=[a-z]+$/ { # {{{
	key = substr($2, 5)
	msg = substr($3, 9)
	encode(key, msg)
} # }}}

/^encode message=[a-z]+ key=[a-z]+$/ { # {{{
	key = substr($3, 5)
	msg = substr($2, 9)
	encode(key, msg)
} # }}}

/^decode key=[a-z]+ message=[a-z]+$/ { # {{{
	decode(substr($2, 5), substr($3, 9))
} # }}}

/^decode message=[a-z]+ key=[a-z]+$/ { # {{{
	decode(substr($3, 5), substr($2, 9))
} # }}}

/^decipher plaintext=[a-z]+ ciphertext=[a-z]+$/ { # {{{
	decipher(substr($2, 11), substr($3, 12))
} # }}}

/^decipher ciphertext=[a-z]+ plaintext=[a-z]+$/ { # {{{
	decipher(substr($3, 11), substr($2, 12))
} # }}}

