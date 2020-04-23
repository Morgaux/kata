#!/usr/bin/awk -f
# note, this shebang is reasonably portable, however,
# for best portability or to pass additional arguments
# to the interpreter a shell wrapper should be used.

# A POSIX AWK alphabet_cipher

/^encode/ {
	$1=""
	print "encode" $0
}

/^decode/ {
	$1=""
	print "encode" $0
}

/^decipher/ {
	$1=""
	print "encode" $0
}

