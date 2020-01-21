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

s/^1$/I/g;
s/^2$/II/g;
s/^3$/III/g;
s/^4$/IV/g;
s/^5$/V/g;
s/^6$/VI/g;
s/^7$/VI/g;
s/^8$/IIX/g;
s/^9$/IX/g;
s/^10$/X/g;

