#!/usr/bin/awk -f
# note, this shebang is reasonably portable, however,
# for best portability or to pass additional arguments
# to the interpreter a shell wrapper should be used.

# A POSIX AWK alphabet_cipher

function char_at(str, i) { # {{{
	return substr(str, (i % length(str)) + 1, 1)
} # }}}

function encode(key, msg,   out, i, j, key_index, msg_index) { # {{{
	out = ""

	for (i = 0; i < length(msg); i++) {
		for (j = 0; j < length(alphabet); j++) {
			if (char_at(alphabet, j) == char_at(key, i % length(msg)))
				key_index = j

			if (char_at(alphabet, j) == char_at(msg, i))
				msg_index = j
		}

		out = out char_at(alphabet, key_index + msg_index)
	}

	return out
} # }}}

function decode(key, msg,   out, i, j, key_index, msg_index) { # {{{
	out = ""

	for (i = 0; i < length(msg); i++) {
		for (j = 0; j < length(alphabet); j++) {
			if (char_at(alphabet, j) == char_at(key, i % length(msg))) {
				key_index = j
				break;
			}
		}

		for (j = 0; j < length(alphabet); j++) {
			if (char_at(alphabet, j + key_index) == char_at(msg, i))
				msg_index = j
		}

		out = out char_at(alphabet, msg_index)
	}

	return out
} # }}}

function decipher(plain, cipher,   out, i, j) { # {{{
	out = "";

	for (i = 0; i < length(plain); i++) {
		for (j = 0; j < length(alphabet); j++) {
			out = substr(out, 1, i) char_at(alphabet, j);

			if (char_at(encode(out, plain), i) == char_at(cipher, i)) {
				break;
			}
		}

		tmp = encode(out, plain);

		if (tmp == cipher) {
			break;
		}
	}

	return out;
} # }}}

BEGIN { # {{{
	alphabet = "abcdefghijklmnopqrstuvwxyz"
} #}}}

/^encode/ { # {{{
	split($0, args)

	for (i in args) {
		if (match(args[i], /key=[a-z]+/))
			key = args[i]
		else if (match(args[i], /message=[a-z]+/))
			msg = args[i]
	}

	print encode(substr(key, 5), substr(msg, 9))
} # }}}

/^decode/ { # {{{
	split($0, args)

	for (i in args) {
		if (match(args[i], /key=[a-z]+/))
			key = args[i]
		else if (match(args[i], /message=[a-z]+/))
			msg = args[i]
	}

	print decode(substr(key, 5), substr(msg, 9))
} # }}}

/^decipher/ { # {{{
	split($0, args)

	for (i in args) {
		if (match(args[i], /plaintext=[a-z]+/))
			plaintext = args[i]
		else if (match(args[i], /ciphertext=[a-z]+/))
			ciphertext = args[i]
	}

	print decipher(substr(plaintext, 11), substr(ciphertext, 12))
} # }}}

