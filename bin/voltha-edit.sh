#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Load onos component documentation files by name
## -----------------------------------------------------------------------

[[ $# -eq 0 ]] && { set -- 'bng'; }

declare -a fyls=()
for pkg in "$@";
do
    fyls+=("release/assemble/${pkg}.raw")
    fyls+=( $(find "release/${pkg}" -type f -print) )
done

"${EDITOR:-emacs}" "${fyls[@]}"
