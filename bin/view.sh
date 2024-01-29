#!/bin/bash
# -----------------------------------------------------------------------
# Intent: View rendered todo/README.md pages on github
# -----------------------------------------------------------------------

declare -a urls=()
urls+=('https://github.com/joey-onf/todo/blob/origin/master/release/release-meta.md')

"${BROWSER:-opera}" "${urls[@]}" >/dev/null 2>/dev/null &

# [EOF]
