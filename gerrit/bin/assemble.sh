#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

# set -euo pipefail

declare pgm
pgm="$(readlink "${BASH_SOURCE[0]}" --no-newline --canonicalize-existing)"
readonly pgm
declare sandbox_root="${pgm[0]%/*}"
sandbox_root="${sandbox_root%/*}"
readonly sandbox_root

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function join_by()
{
    local d=${1-} f=${2-}; if shift 2; then printf %s "$f" "${@/#/$d}"; fi;
}

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
function gen_header()
{
    local -n ref=$1; shift

    declare -a common=()
    get_common common

    declare -a fields=()
    fields+=('Gerrit')
    fields+=('Jira')
    fields+=("${common[@]}")
    fields+=('Notes')

    ref=()
    local hdr="$(join_by ' | ' "${fields[@]}")"
    ref+=("| ${hdr} |")
 
    declare -a divider=()
    local field
    for field in "${fields[@]}";
    do
        divider+=(' --- ')
    done
 
    local div="$(join_by '|' "${divider[@]}")"
    ref+=("|${div}|")

# | Gerrit | Jira | VOL-5291 | VOL-5331 | Notes |
# | ------ | ---- | -------- | -------- | ----- |
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function get_common()
{
    local -n ref=$1; shift

    readarray -t tmp < <(find data -name 'common' -type f -print \
                             | awk -F'/' '{print $2}' \
                             | sort )
    ref=("${tmp[@]}")
    # >&2 declare -p common
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function get_jira_url()
{
    local -n ref=$1; shift
    local val="$1"; shift

    ref=''
    local data="$sandbox_root/data/${val}/jira"
    if [[ -f "$data" ]]; then
        local url
        url="$(grep '://' "$data")"
        ref="$url"
    fi
    
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function gen_jira_url()
{
    local ref=$1; shift
    local id="$1"; shift

    ref="https://jira.opencord.org/browse/${id}"
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function gen_patch_grid()
{
    readarray -t patches < <(find data -maxdepth 1 -regex '.*/[0-9]+' -type d -print \
                                 | sort -n)
#    >&2 declare -p patches

    declare -a common=()
    get_common common

    cat <<EOGRID

Patch Grid
----------

EOGRID

    ## -----------
    ## Draw header
    ## ----------- 
    declare -a header=()
    gen_header header
    local hdr
    for hdr in "${header[@]}";
    do
        printf "$hdr\n"
    done

    local gerrit
    local jira

    local label
    local patch
    for patch in "${patches[@]}";
    do
        pushd "$patch" >/dev/null

        gerrit="$(grep '://' 'gerrit' 2>/dev/null)"
        label="${gerrit##*}"
        label="${label:-X}"
        printf '| [%s](%s) ' "${patch##*/}" "${gerrit}"

        if [[ -f 'jira' ]]; then 
           readarray -t jiras < <(grep '^VOL' 'jira' 2>/dev/null | sort)
            printf '|'
            local jira
            for jira in "${jiras[@]}";
            do
                local jira_url=''
                gen_jira_url jira_url"$jira"
                printf ' [x](%s)' "$jira_url"
#                printf ' [x](%s)' "https://jira.opencord.org/browse/${jira}"
            done
            printf '|'
        else
            printf '| '
        fi

        local com
        for com in "${common[@]}";
        do
            if [[ -e "$com" ]]; then
                local link=''
                get_jira_url link "$com"
                printf "| [x](%s) " "$link"
            else
                printf '| '
            fi
        done

        if [[ -f 'notes' ]]; then
            readarray -t < 'notes'
            printf "| ${notes}"
        else
            printf '| '
        fi

        printf ' |\n'

        popd >/dev/null

#        case "$patch" in
#            data/35216) exit 1;;
#        esac
    done

    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function generate()
{
    cat template/header.md

    gen_patch_grid
    
    echo
    cat template/trailer.md
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function init_gerrit()
{

    pushd data >/dev/null
    readarray -t urls < <(grep '://' 'gerrit.urls')

    local url
    for url in "${urls[@]}";
    do
        url="${url//[[:blank:]]}"
        # declare -a fields=([0]="https:" [1]=""
        #    [2]="gerrit.opencord.org"
        #    [3]="c"
        #    [4]="voltha-openonu-adapter-go"
        #    [5]="+"
        #    [6]="35227"
        #)
        readarray -d'/' -t fields < <(printf '%s' "$url")

        local repo="${fields[4]}"
        local patch="${fields[6]}"

        [[ ! -d "$patch" ]]          && { >&2 mkdir -vp "$patch"; }
        [[ ! -f "${patch}/gerrit" ]] && { echo "$url" > "${patch}/gerrit"; }
        [[ ! -f "${patch}/repo" ]]   && { echo "$repo" > "${patch}/repo"; }
    done

    popd >/dev/null

    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function init_jira()
{
    pushd data >/dev/null
    readarray -t urls < <(grep '://' 'jira.urls')

    local url
    for url in "${urls[@]}";
    do
        url="${url//[[:blank:]]}"
        readarray -d'/' -t fields < <(printf '%s' "$url")

        # declare -a fields=([0]="https:" [1]="" [2]="jira.opencord.org"
        #    [3]="browse"
        #    [4]="VOL-5291")
        
        local ticket="${fields[4]}"

        [[ ! -d "$ticket" ]]        && { >&2 mkdir -vp "$ticket"; }
        [[ ! -f "${ticket}/jira" ]] && { echo "$url" > "${ticket}/jira"; }
    done

    popd >/dev/null

    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function init()
{
    init_gerrit
    init_jira
    return
}

##---------------##
##---] MAIN  [---##
##---------------##

init
generate

# [EOF]
