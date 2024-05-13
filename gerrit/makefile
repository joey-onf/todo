# -*- makefile -*-

null :=#
space := $(null) $(null)

.DEFAULT_GOAL := generate

all:

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
generate:
#	./xy.sh
#	./bin/assemble.sh 
	./bin/assemble.sh > README.md

patch-ids = $(shell find data/[0-9]* -name 'repo' -print)
$(foreach id,$(patch-ids),$(info ** id=$(id)))

# patch-ids = $(shell find data -mindepth 1 -maxdepth 1 -name '[0-9]*' -print \
#    | xargs -n1 basename \
#    | sort -n)#

# cgather-args += $(addprefix --gerrit$(space),$(patch-ids))
gather :
	./bin/gather.sh $(gather-args)

view :: generate
	pandoc README.md | lynx -stdin

clean ::

github :
	firefox 'https://github.com/joey-onf/todo/tree/origin/master/gerrit'

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
gurls := data/gerrit.urls
url   = $(error url= is required)
log   := tmp/consoleText.log
triage :
	@echo "$(url)" >> "$gurls"
	@sort -o "${gurls}" "${gurls}" # inplace sort w/o repeating filename
	curl -o "$(log)" "$(url)"

t0:
	grep --fixed-strings --file=triage/wanted "$(log)"

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@printf '  %-33.33s %s\n' 'triage' \
	  'Retrieve a jenkins log then parse for grid report metadata'


# [SEE ALSO]
#   sort -o file{,}
# https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html
# [EOF]
