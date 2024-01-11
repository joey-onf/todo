# -*- makefile -*-
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

gen-dep  = $(addprefix $(1)^,$(2))
gen-deps = $(addprefix $(1)^,$($(2)))

get-dep  = $(lastword $(subst ^,$(space),$(1)))
get-deps = $(foreach dep,$($(1)),$(call get-dep,$(dep)))

markdown-src := README.md $(wildcard *.md)
markdown-view-deps := $(call gen-deps,view-markdown,markdown-src)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

view                  :: $(markdown-view-deps)

$(markdown-view-deps) :
	-@pandoc $(call get-dep,$@) | lynx --stdin

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@printf 'Usage: $(MAKE) [options] [target] ...\n'
	@printf '  %-33.33s %s\n' 'view' \
	  'Regenerate and load README.md for interactive viewing'

# [EOF]
