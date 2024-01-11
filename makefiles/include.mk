# -*- makefile -*-

onf-mk-abs    ?= $(abspath $(lastword $(MAKEFILE_LIST)))
onf-mk-top    := $(subst /include.mk,$(null),$(onf-mk-abs))
onf-mk-tmp    := $(onf-mk-top)/tmp
onf-mkdir     := $(onf-mk-top)

null :=#
space := $(null) $(null)

include $(onf-mkdir)/markdown.mk
# include $(MAKEDIR)/restructured-text.mk

# [EOF]
