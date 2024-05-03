# -*- makefile -*-

.DEFAULT_GOAL := generate

all:

generate:
	./bin/assemble.sh > README.md

view :: generate
	pandoc README.md | lynx -stdin

sterile ::
	$(RM) -r data/3*

clean ::

github :
	firefox 'https://github.com/joey-onf/todo/tree/origin/master/gerrit'

# [EOF]
