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

q

