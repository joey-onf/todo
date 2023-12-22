#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Load copy & paste buffer with README.md markdown that can
##    render a colored block
## -----------------------------------------------------------------------

printf '![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png)' > color.tmp

xclip -sel c ./color.tmp
/bin/rm -f color.tmp


