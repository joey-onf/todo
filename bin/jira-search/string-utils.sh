#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Common string utilities
## -----------------------------------------------------------------------

## Intent: Helper method
## -----------------------------------------------------------------------
## Usage : local path="$(join_by '/' 'lib' "${fields[@]}")"
## -----------------------------------------------------------------------
function join_by()
{
    local d=${1-} f=${2-}; if shift 2; then printf %s "$f" "${@/#/$d}"; fi;
}

# [EOF] - 20231222: Ignore, this triage patch will be abandoned
