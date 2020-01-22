#!/bin/sh
# vi:syntax=sed

# gloriously ugly exec hack (portable sh/sed)

b ()
{
x
}

i\
f true ; then exec sed -f "$0" "$@" ; fi

:()

# pure sed from here

s/\(\d*\)1$/\1I/g
s/\(\d*\)2$/\1II/g
s/\(\d*\)3$/\1III/g
s/\(\d*\)4$/\1IV/g
s/\(\d*\)5$/\1V/g
s/\(\d*\)6$/\1VI/g
s/\(\d*\)7$/\1VII/g
s/\(\d*\)8$/\1IIX/g
s/\(\d*\)9$/\1IX/g

s/0//g

