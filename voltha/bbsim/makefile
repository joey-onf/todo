# -*- makefile -*-

all: README.md

# view-doc ?= $(error $(MAKE) $@ view-doc={README.md} is required)
view-doc := README.md

view :: README.md

	pandoc $(view-doc) | lynx --stdin


md-src-raw     = $(sort $(wildcard *.md))

md-src-excl    += README.md
md-src-excl    += head.md
md-src-excl    += tail.md

md-src-ordered += epic.md

md-src         = $(filter-out $(md-src-excl) $(md-src-ordered),$(md-src-raw))

README.md : $(md-src)
	$(RM) $@
	@cat header.md         >> $@
	@cat $(md-src-ordered) >> $@
	@cat $(md-src)         >> $@
	@echo                  >> $@

clean ::
	$(RM) README.md

sterile :: clean

# [EOF]
