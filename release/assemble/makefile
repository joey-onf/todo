#!/bin/bash

all:

assemble:
	./assemble.sh | tee assemble.md

assemble-order += null
assemble-order += repository
assemble-order += released
assemble-order += A
assemble-order += F
assemble-order += null

assemble-paste:
	@paste --delimiter '|||||||' $(assemble-order) \
	    | sed -e 's/|/ | /g'

clean:
	$(RM) assemble.md

# [EOF]
