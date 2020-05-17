#!/bin/sh

# A POSIX  alphabet_cipher implementation

LETTERS="abcdefghijklmnopqrstuvwxyz"
LETTER_COUNT="26"

gen_seq() { # {{{ $1:n
	awk 'BEGIN {for (i = 0; i < '"$1"'; i++) print i}'
} # }}}

length() { # {{{ $@:str
	echo "$@" | wc -c
} # }}}

char_at() { # {{{ $1:str $2:index
	echo "$1" | head -c "$(expr "$2" + 1)" | tail -c 1
} # }}}

index_of() { # {{{ $1:str $2:char
	index="0"

	for char in $(echo "$1" | sed 's/\(.\)/\1\n/g')
	do
		if [ "$(char_at "$char" 0)" = "$(char_at "$2" 0)" ]
		then
			echo "$index"
		fi

		index="$(expr "$index" + 1)"
	done

	echo "-1"
} # }}}

encode() { # {{{ $1:key $2:message
	out=""

	for i in $(gen_seq "$(length "$2")")
	do
		for j in $(gen_seq "$(length "$LETTERS")")
		do
			if [ "$(char_at "$alphabet" "$j")" = "$(char_at "$1" "$(expr "$i" % "$(length "$2")")")" ]
			then
				key_index="$j"
			fi

			if [ "$(char_at "$LETTERS" "$j")" = "$(char_at "$1" "$i")" ]
			then
				msg_index="$j"
			fi
		done

		out="${out}$(char_at "$LETTERS" "$(expr "$key_index" + "$msg_index")")"
	done

	echo "$out"
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

