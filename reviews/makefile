# -*- makefile -*-
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

HIDE ?= @

MAKEDIR ?= makefiles/
include $(MAKEDIR)/makefiles/include.mk


all: README.md

# view-doc ?= $(error $(MAKE) $@ view-doc={README.md} is required)
view-doc := README.md

#view :: README.md
#	pandoc $(view-doc) | lynx --stdin

md-src-raw     = $(sort $(wildcard *.md))

md-src-top     += md-header.md

md-src-tail    += $(wildcard jenkins.md md-index.md)

md-src-excl    += README.md
md-src-excl    += $(md-src-top)
md-src-excl    += $(md-src-tail)
md-src-excl    += md-%.md

md-src += $(md-src-top)
md-src += $(sort $(filter-out $(md-src-excl),$(md-src-raw)))
md-src += $(md-src-tail)

$(if $(DEBUG),$(foreach md,$(md-src),$(info ** $(md-src))))

README.md : $(md-src)
	$(RM) $@
	$(HIDE)cat $(md-src) > $@

clean ::
	$(RM) README.md

sterile :: clean

# [EOF]
