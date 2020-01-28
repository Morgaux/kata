#!/usr/bin/env python3

import sys

lines = []
for line in sys.stdin:
	lines.append(line.strip())

print("\n".join(lines))

