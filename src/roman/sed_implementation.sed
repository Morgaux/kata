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

# roman numerals up to 9,999,999

:millions
s/1\(\d\d\d\d\d\d\)$/_\1/g
s/2\(\d\d\d\d\d\d\)$/__\1/g
s/3\(\d\d\d\d\d\d\)$/___\1/g
s/4\(\d\d\d\d\d\d\)$/____\1/g
s/5\(\d\d\d\d\d\d\)$/_____\1/g
s/6\(\d\d\d\d\d\d\)$/______\1/g
s/7\(\d\d\d\d\d\d\)$/_______\1/g
s/8\(\d\d\d\d\d\d\)$/________\1/g
s/9\(\d\d\d\d\d\d\)$/_________\1/g

s/_/__________/g

:hundred_thousands
s/1\(\d\d\d\d\d\)$/_\1/g
s/2\(\d\d\d\d\d\)$/__\1/g
s/3\(\d\d\d\d\d\)$/___\1/g
s/4\(\d\d\d\d\d\)$/____\1/g
s/5\(\d\d\d\d\d\)$/_____\1/g
s/6\(\d\d\d\d\d\)$/______\1/g
s/7\(\d\d\d\d\d\)$/_______\1/g
s/8\(\d\d\d\d\d\)$/________\1/g
s/9\(\d\d\d\d\d\)$/_________\1/g

s/_/__________/g

:ten_thousands
s/1\(\d\d\d\d\)$/_\1/g
s/2\(\d\d\d\d\)$/__\1/g
s/3\(\d\d\d\d\)$/___\1/g
s/4\(\d\d\d\d\)$/____\1/g
s/5\(\d\d\d\d\)$/_____\1/g
s/6\(\d\d\d\d\)$/______\1/g
s/7\(\d\d\d\d\)$/_______\1/g
s/8\(\d\d\d\d\)$/________\1/g
s/9\(\d\d\d\d\)$/_________\1/g

s/_/MMMMMMMMMM/g

:thousands
s/1\(\d\d\d\)$/M\1/g
s/2\(\d\d\d\)$/MM\1/g
s/3\(\d\d\d\)$/MMM\1/g
s/4\(\d\d\d\)$/MMMM\1/g
s/5\(\d\d\d\)$/MMMMM\1/g
s/6\(\d\d\d\)$/MMMMMM\1/g
s/7\(\d\d\d\)$/MMMMMMM\1/g
s/8\(\d\d\d\)$/MMMMMMMM\1/g
s/9\(\d\d\d\)$/MMMMMMMMM\1/g

:hundreds
s/1\(\d\d\)$/C\1/g
s/2\(\d\d\)$/CC\1/g
s/3\(\d\d\)$/CCC\1/g
s/4\(\d\d\)$/CD\1/g
s/5\(\d\d\)$/D\1/g
s/6\(\d\d\)$/DC\1/g
s/7\(\d\d\)$/DCC\1/g
s/8\(\d\d\)$/CCM\1/g
s/9\(\d\d\)$/CM\1/g

:tens
s/1\(\d\)$/X\1/g
s/2\(\d\)$/XX\1/g
s/3\(\d\)$/XXX\1/g
s/4\(\d\)$/XL\1/g
s/5\(\d\)$/L\1/g
s/6\(\d\)$/LX\1/g
s/7\(\d\)$/LXX\1/g
s/8\(\d\)$/XXC\1/g
s/9\(\d\)$/XC\1/g

:ones
s/1$/I/g
s/2$/II/g
s/3$/III/g
s/4$/IV/g
s/5$/V/g
s/6$/VI/g
s/7$/VII/g
s/8$/IIX/g
s/9$/IX/g

s/0//g

