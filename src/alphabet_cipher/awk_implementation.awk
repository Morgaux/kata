#!/usr/bin/awk -f
# note, this shebang is reasonably portable, however,
# for best portability or to pass additional arguments
# to the interpreter a shell wrapper should be used.

# A POSIX AWK alphabet_cipher

# Helper functions {{{
function encode(key, msg) { # {{{
	return ""
} # }}}

function decode(key, msg) { # {{{
	return ""
} # }}}

function decipher(plain, cipher) { # {{{
	return ""
} # }}}
# Helper functions }}}

# Regex parsing {{{
/^encode key=.* message=.*/ { # {{{
	print encode(substr($2, 5), substr($3, 9))
} # }}}

/^encode message=.* key=.*/ { # {{{
	print encode(substr($3, 5), substr($2, 9))
} # }}}

/^decode key=.* message=.*/ { # {{{
	print decode(substr($2, 5), substr($3, 9))
} # }}}

/^decode message=.* key=.*/ { # {{{
	print decode(substr($3, 5), substr($2, 9))
} # }}}

/^decipher plaintext=.* ciphertext=.*/ { # {{{
	print decipher(substr($2, 11), substr($3, 12))
} # }}}

/^decipher ciphertext=.* plaintext=.*/ { # {{{
	print decipher(substr($3, 11), substr($2, 12))
} # }}}
# Regex parsing }}}

