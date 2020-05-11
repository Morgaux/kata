#!/bin/sh

# A POSIX  alphabet_cipher implementation

encode() { # {{{ TODO
	echo "ERROR: Not yet implemented." 1>&2
	exit 1
} # }}}

decode() { # {{{ TODO
	echo "ERROR: Not yet implemented." 1>&2
	exit 1
} # }}}

decipher() { # {{{ TODO
	echo "ERROR: Not yet implemented." 1>&2
	exit 1
} # }}}

parse() { # {{{ $1:arg_name
	echo "$LINE" | \
		tr '[:space:]' '\n' | \
		grep "$1" | \
		sed "s/$1=//g"
} # }}}

main() { # {{{ $@:unused
	while read LINE
	do
		ACTION="$(echo "$LINE" | awk '{print $1}')"
		KEY="$(parse "key")"
		MSG="$(parse "message")"
		PLAINTEXT="$(parse "plaintext")"
		CIPHERTEXT="$(parse "ciphertext")"

		case "$ACTION" in
			"encode")
				encode "$KEY" "$MSG"
			;;
			"decode")
				decode "$KEY" "$MSG"
			;;
			"decipher")
				decipher "$PLAINTEXT" "$CIPHERTEXT"
			;;
			*)
				echo "$LINE"
			;;
		esac
	done
} # }}}

main $@

