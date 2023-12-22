# -*- makefile -*-

all:

assemble: README.md

README.md: makefile $(wildcard topics/*/urls) \
  topics/assemble.sh \
  $(filter-out README.md,$(wildcard *.md))
	@(\
		cat header.md; \
		cat table-header.md; \
		(cd topics && ./assemble.sh); \
		cat legend.md; \
	) > $@


clean:
	find . -name '*.tmp' | xargs --no-run-if-empty $(RM)
