#!/usr/bin/env python3

import sys

lines = []
for line in sys.stdin:
	lines.append(line.strip())

lines.sort()

print("\n".join(lines))

