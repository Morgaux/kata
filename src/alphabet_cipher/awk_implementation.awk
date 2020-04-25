#!/usr/bin/awk -f
# note, this shebang is reasonably portable, however,
# for best portability or to pass additional arguments
# to the interpreter a shell wrapper should be used.

# A POSIX AWK alphabet_cipher

alphabet = "abcdefghijklmnopqrstuvwxyz"

function encode(key, msg) { # {{{
	printf "%s\n", alphabet
} # }}}

function decode(key, msg) { # {{{
	printf "%s\n", alphabet
} # }}}

function decipher(plain, cipher) { # {{{
	printf "%s\n", alphabet
} # }}}

/^encode key=[a-z]+ message=[a-z]+$/ { # {{{
	key = substr($2, 5)
	msg = substr($3, 9)
	printf "key: %s\nmsg: %s\n", key, msg
} # }}}

/^encode message=[a-z]+ key=[a-z]+$/ { # {{{
	key = substr($3, 5)
	msg = substr($2, 9)
	printf "key: %s\nmsg: %s\n", key, msg
} # }}}

/^decode key=[a-z]+ message=[a-z]+$/ { # {{{
	key = substr($2, 5)
	msg = substr($3, 9)
	printf "key: %s\nmsg: %s\n", key, msg
} # }}}

/^decode message=[a-z]+ key=[a-z]+$/ { # {{{
	key = substr($3, 5)
	msg = substr($2, 9)
	printf "key: %s\nmsg: %s\n", key, msg
} # }}}

/^decipher plaintext=[a-z]+ ciphertext=[a-z]+$/ { # {{{
	plaintext  = substr($2, 11)
	ciphertext = substr($3, 12)
	printf "plaintext:  %s\nciphertext: %s\n", plaintext, ciphertext
} # }}}

/^decipher ciphertext=[a-z]+ plaintext=[a-z]+$/ { # {{{
	plaintext  = substr($3, 11)
	ciphertext = substr($2, 12)
	printf "plaintext:  %s\nciphertext: %s\n", plaintext, ciphertext
} # }}}

