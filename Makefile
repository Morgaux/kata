#
# main makefile for kata
#

all: config clean test_all

include config.mk
include builds.mk
include tests.mk

.PHONY: all

