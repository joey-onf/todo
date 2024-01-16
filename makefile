# -*- makefile -*-
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

.DEFAULT_GOAL := all

null	:=#
space	:= $(space) $(space)

include makefiles/include.mk

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
all:

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
create-topic ?= $(error $(MAKE) $@ create-topic= is required)
create :
	mkdir -p "$(create-topic)"
	@rsync -v --checksum 'voltha/voltha-docs/makefile'      "$(create-topic)/."
	@rsync -v --checksum 'voltha/voltha-docs/epic.md'       "$(create-topic)/."
	@rsync -v --checksum 'voltha/voltha-docs/md-header.md'  "$(create-topic)/."
	@rsync -v --checksum 'voltha/voltha-docs/md-trailer.md' "$(create-topic)/."
	@rsync -v --checksum 'voltha/voltha-docs/tickets.md'    "$(create-topic)/."
	@echo '| [$(notdir $(create-topic))](voltha/$(create-topic)/README.md)         | Jira tickets for ???????? |' >> README.md

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
xargs-args := $(null)
$(if $(DEBUG),$(eval regen-args += --verbose))
regen:
	find . -mindepth 2 -name 'makefile' -print0 \
	  | xargs -0 -n1 dirname \
	  | xargs -I'{}' $(xargs-args) $(MAKE) --no-print-directory -C {} all
	$(HIDE)$(MAKE) -C triage  --no-print-directory assemble
	$(HIDE)$(MAKE) -C release --no-print-directory assemble

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
.PHONY: regen $(regen)
regen : $(regen)
$(regen) :
	$(MAKE) -C $(lastword $(subst ^,$(space),$@))

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
bbsim-args += --opencord
bbsim-args += --me
bbsim-args += --text bbsim

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
bbsim :
	bin/jira-search.sh $(bbsim-args)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
# [SUPPORTED TARGETS]
# view ::

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@printf 'Usage: $(MAKE) [options] [target] ...\n'
	@printf '  %-33.33s %s\n' 'bbsim' \
	  'Search for bbsim jira tickets'
	@printf '  %-33.33s %s\n' 'create' \
	  'Create a new repo:todo topic subdir for tracking jira tickets'
	@printf '  %-33.33s %s\n' 'regen' \
	  'Regenerate README.md files for viewing on github'
#	@printf '  %-33.33s %s\n' 'view' \
#	  'Regenerate and load README.md for interactive viewing'

edit ::
	echo emacs $$(find release/assemble -mindepth 1 -maxdepth 1 -type f -print) &

# [EOF]
