#!/usr/bin/awk -f
# note, this shebang is reasonably portable, however,
# for best portability or to pass additional arguments
# to the interpreter a shell wrapper should be used.

# A POSIX AWK alphabet_cipher

alphabet = "abcdefghijklmnopqrstuvwxyz"

function encode(key, msg) { # {{{
	return alphabet
} # }}}

function decode(key, msg) { # {{{
	return alphabet
} # }}}

function decipher(plain, cipher) { # {{{
	return alphabet
} # }}}

/^encode key=[a-z]+ message=[a-z]+$/ { # {{{
	print encode(substr($2, 5), substr($3, 9))
} # }}}

/^encode message=[a-z]+ key=[a-z]+$/ { # {{{
	print encode(substr($3, 5), substr($2, 9))
} # }}}

/^decode key=[a-z]+ message=[a-z]+$/ { # {{{
	print decode(substr($2, 5), substr($3, 9))
} # }}}

/^decode message=[a-z]+ key=[a-z]+$/ { # {{{
	print decode(substr($3, 5), substr($2, 9))
} # }}}

/^decipher plaintext=[a-z]+ ciphertext=[a-z]+$/ { # {{{
	print decipher(substr($2, 11), substr($3, 12))
} # }}}

/^decipher ciphertext=[a-z]+ plaintext=[a-z]+$/ { # {{{
	print decipher(substr($3, 11), substr($2, 12))
} # }}}

