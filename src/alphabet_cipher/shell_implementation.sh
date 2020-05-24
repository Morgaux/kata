#!/bin/sh

# A POSIX  alphabet_cipher implementation

LETTERS="abcdefghijklmnopqrstuvwxyz"
LETTER_COUNT="26"
SELF="$(basename "$0")"
ERR_FILE="./.${SELF}.err"

err() { # {{{ $@:msg
	echo "${SELF}: $@" | tee "$ERR_FILE" 1>&2
	return 1
} # }}}

die() { # {{{ $@:msg
	err "$@"
	exit 1
} #}}}

handle_err() { # {{{ $1:func_name
	if [ -s "$ERR_FILE" ]
	then
		die "An error occurred in ${1:-"$SELF"}: $(cat "$ERR_FILE")"
		rm -f "$ERR_FILE"
	fi
} # }}}

gen_seq() { # {{{ $1:n
	awk 'BEGIN {for (i = 0; i < '"$1"'; i++) print i}' 2>"$ERR_FILE"
	handle_err "gen_seq()"
} # }}}

length() { # {{{ $@:str
	expr "$(echo "$@" | wc -c)" - 1 2>"$ERR_FILE"
	handle_err "length()"
} # }}}

char_at() { # {{{ $1:str $2:index
	echo "$(echo "$1" | \
		head -c "$(expr "$(expr "$2" + 1)" % "$(length "$1")")" | \
		tail -c 1)" 2>"$ERR_FILE"
	handle_err "char_at()"
} # }}}

index_of() { # {{{ $1:str $2:char
	for index in $(gen_seq "$(length "$1")")
	do
		if [ "$(char_at "$1" $index)" = "$(char_at "$2" 0)" ]
		then
			echo "$index"
			return 0
		fi 2>"$ERR_FILE"
		handle_err "index_of()"
	done 2>"$ERR_FILE"
	handle_err "index_of()"

	echo "-1"
} # }}}

encode() { # {{{ $1:key $2:message
	out=""
	key_index=""
	msg_index=""

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
	err "ERROR: Not yet implemented."
	handle_err "decode()"
} # }}}

decipher() { # {{{ TODO
	err "ERROR: Not yet implemented."
	handle_err "decipher()"
} # }}}

parse() { # {{{ $1:arg_name
	echo "$LINE" | \
		tr '[:space:]' '\n' | \
		grep "$1" | \
		sed "s/$1=//g" 2>"$ERR_FILE"
	handle_err "parse()"
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

