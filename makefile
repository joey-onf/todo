# -*- makefile -*-
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

null	:=#
space	:= $(space) $(space)

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

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
regen:
	@$(MAKE) --no-print-directory -C voltha all
	@$(MAKE) --no-print-directory -C voltha/bbsim all
	@$(MAKE) --no-print-directory -C voltha/voltctl all

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

bbsim :
	bin/jira-search.sh $(bbsim-args)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@printf '  %-33.33s %s\n' 'bbsim' 'Search for bbsim jira tickets'
	@printf '  %-33.33s %s\n' \
	  'create' 'Create a new topic subdir for tracking jira tickets'
	@printf '  %-33.33s %s\n' 'regen' 'Regenerate README.md files'

# [EOF]
