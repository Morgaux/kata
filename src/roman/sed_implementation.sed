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

s/^\(\d*\)1\([IVXLCDM0]\)/MAGIC\1X\2/g
s/^\(\d*\)2\([IVXLCDM0]\)/MAGIC\1XX\2/g
s/^\(\d*\)3\([IVXLCDM0]\)/MAGIC\1XXX\2/g
s/^\(\d*\)4\([IVXLCDM0]\)/MAGIC\1XL\2/g
s/^\(\d*\)5\([IVXLCDM0]\)/MAGIC\1L\2/g
s/^\(\d*\)6\([IVXLCDM0]\)/MAGIC\1LX\2/g
s/^\(\d*\)7\([IVXLCDM0]\)/MAGIC\1LXX\2/g
s/^\(\d*\)8\([IVXLCDM0]\)/MAGIC\1XXC\2/g
s/^\(\d*\)9\([IVXLCDM0]\)/MAGIC\1XC\2/g

s/MAGIC//g

s/^\(\d*\)1\([IVXLCDM0]\)/MAGIC\1C\2/g
s/^\(\d*\)2\([IVXLCDM0]\)/MAGIC\1CC\2/g
s/^\(\d*\)3\([IVXLCDM0]\)/MAGIC\1CCC\2/g
s/^\(\d*\)4\([IVXLCDM0]\)/MAGIC\1CD\2/g
s/^\(\d*\)5\([IVXLCDM0]\)/MAGIC\1D\2/g
s/^\(\d*\)6\([IVXLCDM0]\)/MAGIC\1DC\2/g
s/^\(\d*\)7\([IVXLCDM0]\)/MAGIC\1DCC\2/g
s/^\(\d*\)8\([IVXLCDM0]\)/MAGIC\1CCM\2/g
s/^\(\d*\)9\([IVXLCDM0]\)/MAGIC\1CM\2/g

s/MAGIC//g

s/1\(\d{3}\)/_\1/g
s/2\(\d{3}\)/__\1/g
s/3\(\d{3}\)/___\1/g
s/4\(\d{3}\)/____\1/g
s/5\(\d{3}\)/_____\1/g
s/6\(\d{3}\)/______\1/g
s/7\(\d{3}\)/_______\1/g
s/8\(\d{3}\)/________\1/g
s/9\(\d{3}\)/_________\1/g

s/_/__________/g

s/1\(\d{2}\)/_\1/g
s/2\(\d{2}\)/__\1/g
s/3\(\d{2}\)/___\1/g
s/4\(\d{2}\)/____\1/g
s/5\(\d{2}\)/_____\1/g
s/6\(\d{2}\)/______\1/g
s/7\(\d{2}\)/_______\1/g
s/8\(\d{2}\)/________\1/g
s/9\(\d{2}\)/_________\1/g

s/_/__________/g

s/1\(\d\)/_\1/g
s/2\(\d\)/__\1/g
s/3\(\d\)/___\1/g
s/4\(\d\)/____\1/g
s/5\(\d\)/_____\1/g
s/6\(\d\)/______\1/g
s/7\(\d\)/_______\1/g
s/8\(\d\)/________\1/g
s/9\(\d\)/_________\1/g

s/_/__________/g

s/1/_/g
s/2/__/g
s/3/___/g
s/4/____/g
s/5/_____/g
s/6/______/g
s/7/_______/g
s/8/________/g
s/9/_________/g

s/_/M/g

s/0//g

