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

s/0//g

