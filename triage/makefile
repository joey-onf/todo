# -*- makefile -*-

all:

assemble: README.md

README.md: makefile $(wildcard topics/*/urls)
	@(\
		cat header.md; \
		cat table-header.md; \
		(cd topics && ./assemble.sh); \
		cat legend.md; \
	) > $@


clean:
	find . -name '*.tmp' | xargs --no-run-if-empty $(RM)
