# -*- makefile -*-

all:

assemble:
	@cat header.md \
	&& cat table-header.md \
	&& (cd topics && ./assemble.sh) \
	&& cat legend.md
