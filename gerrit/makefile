# -*- makefile -*-

all:

generate:
	./bin/assemble.sh > README.md

view :: generate
	pandoc README.md | lynx -stdin

sterile ::
	$(RM) -r data/3*

clean ::
