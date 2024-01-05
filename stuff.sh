#!/bin/bash

## -----------------------------------------------------------------------
## Intent: Helper method
## -----------------------------------------------------------------------
## Usage : local path="$(join_by '/' 'lib' "${fields[@]}")"
## -----------------------------------------------------------------------
function join_by()
{
    local d=${1-} f=${2-}; if shift 2; then printf %s "$f" "${@/#/$d}"; fi;
}

# https://jira.opencord.org/issues/?jql=%20project%20in%20(SEBA%2C%20VOL)%20labels%20in%20(voltha-onos)


declare -a tmp=()
tmp+=('https://jira.opencord.org/issues/?jql=')
tmp+=('project%20in%20(SEBA%2C%20VOL)')
# tmp+=('labels' 'in' '(Testing)')
#tmp+=('labels' 'in' '(voltha-onos)')

tmp+=('AND')
tmp+=('(' 'resolution' 'IS' 'EMPTY' ')')

url="$(join_by '%20' "${tmp[@]}")"

firefox "$url"

# https://jira.opencord.org/issues/?jql=project%20in%20(SEBA%2C%20VOL)%20AND%20status%20in%20(%22In%20Progress%22%2C%20%22To%20Do%22)%20AND%20fixVersion%20%3D%20%22VOLTHA%20v2.12%22

# [EOF]
