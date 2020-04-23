#!/usr/bin/awk -f
# note, this shebang is reasonably portable, however,
# for best portability or to pass additional arguments
# to the interpreter a shell wrapper should be used.

# A POSIX AWK alphabet_cipher

function encode(key, msg) {
	print "key: " key
	print "msg: " msg
}

function decode(key, msg) {
	print "key: " key
	print "msg: " msg
}

function decipher(plain, cipher) {
	print "plain: "  plain
	print "cipher: " cipher
}

/^encode key=.* message=.*/ {
	encode(substr($2, 5), substr($3, 9))
}

/^encode message=.* key=.*/ {
	encode(substr($3, 5), substr($2, 9))
}

/^decode key=.* message=.*/ {
	decode(substr($2, 5), substr($3, 9))
}

/^decode message=.* key=.*/ {
	decode(substr($3, 5), substr($2, 9))
}

/^decipher plaintext=.* ciphertext=.*/ {
	decipher(substr($2, 11), substr($3, 12))
}

/^decipher ciphertext=.* plaintext=.*/ {
	decipher(substr($3, 11), substr($2, 12))
}

