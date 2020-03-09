#!/bin/sh

awk 'BEGIN {for (j = 1; j <= 100; j++) print j}' | \
	sed 's/^[0-9]*5$/Buzz/g'

