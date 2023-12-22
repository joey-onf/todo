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
	@echo '| [$(notdir $(create-topic))](voltha/$(create-topic)/README.md)         | Jira tickets for ???????? |' >> README.md

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
regen:
	find . -mindepth 2 -name 'makefile' -print0 \
	  | xargs -0 -n1 dirname \
	  | xargs -I'{}' $(MAKE) --no-print-directory -C {} all
	$(MAKE) -C triage --no-print-directory assemble

#	@$(MAKE) --no-print-directory -C voltha all
#	@$(MAKE) --no-print-directory -C voltha/bbsim all
#	@$(MAKE) --no-print-directory -C voltha/voltctl all

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
view ::
	pandoc README.md | lynx --stdin

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@printf '  %-33.33s %s\n' 'bbsim' 'Search for bbsim jira tickets'
	@printf '  %-33.33s %s\n' 'create'
	  'Create a new topic subdir for tracking jira tickets'
	@printf '  %-33.33s %s\n' 'regen' 'Regenerate README.md files for viewing on github'
	@printf '  %-33.33s %s\n' 'view'
	  'Regenerate and load README.md for viewing'

# [EOF]
