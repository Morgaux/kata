#!/bin/sh
# vi: syntax=awk

true + /; exec awk -f "$0" -- "$@"; exit; / {}

BEGIN {
	"tty" | getline r
	if (r != "not a tty") exit 1
}

!/[0-9]+/ {
	exit 1
}

/[0-9]+/ {
	print $0
}

