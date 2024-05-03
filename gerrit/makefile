# -*- makefile -*-

.DEFAULT_GOAL := generate

all:

generate:
#	./bin/assemble.sh 
	./bin/assemble.sh > README.md

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
