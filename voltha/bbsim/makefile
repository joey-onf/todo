# -*- makefile -*-

all:

view-doc ?= $(error $(MAKE) $@ view-doc={README.md} is required)

view ::
	pandoc $(view-doc) | lynx --stdin
