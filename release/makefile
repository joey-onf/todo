# -*- makefile -*-
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

.DEFAULT_GOAL: view

BROWSER ?= opera

include ../makefiles/include.mk

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
all:

.PHONY: assemble
assemble:
	(\
	    assemble/assemble.sh; \
	    printf '\n---\n'; \
		cat topics/onos-components; \
	    printf '\n---\n'; \
		cat topics/see-also; \
	) > release-meta.md

# [EOF]
