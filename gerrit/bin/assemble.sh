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

##--------------------##
##---]  INCLUDES  [---##
##--------------------##
declare libroot="${pgm%.sh}"
readonly libroot

source "$libroot/grid.sh"


## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function join_by()
{
    local d=${1-} f=${2-}; if shift 2; then printf %s "$f" "${@/#/$d}"; fi;
}

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
function get_patches()
{
    local -n ref=$1; shift

    readarray -t data < <(\
        find data -maxdepth 1 -regex '.*/[0-9]+' -type d -print \
        | sort -n)
    ref=("${data[@]}")
    return
}

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
function get_columns()
{
    local -n ref=$1; shift
    readarray -t columns < "template/grid.columns"
    ref=("${columns[@]}")
    return
}

# -----------------------------------------------------------------------
## Intent: Render grid header lines
##
## | Gerrit | Jira | VOL-5291 | VOL-5331 | Notes |
## | ------ | ---- | -------- | -------- | ----- |
##
## -----------------------------------------------------------------------
function gen_header()
{
    local -n ref=$1; shift
    ref=()

    local -a columns
    get_columns columns

    declare -a buffer=()
    local column
    for column in "${columns[@]}";
    do
        case "$column" in
            'VOL-'*) 
                local link=''
                get_jira_url link "$column"
                buffer+=("[$column]($link)")
                ;;
            *) buffer+=("${column^}") ;;
        esac
    done

    ## ---------------------------
    ## Display table column header
    ## ---------------------------
    local hdr
    gen_grid_line hdr buffer
    ref+=("$hdr")

    ## --------------------------
    ## Display table divider line
    ## --------------------------
    local -a divider=()

    for column in "${columns[@]}";
    do
        case "$column" in
            'Notes') divider+=(' --- ') ;;
            *) divider+=(' :---: ') ;;
        esac
    done

    local div
    gen_grid_line div divider
    ref+=("$div")
    
    return    
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
    local -n ref=$1; shift
    local id="$1"; shift

    ref="https://jira.opencord.org/browse/${id}"
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function gen_patch_grid()
{
    local -a columns
    get_columns columns

    local -a patches
    get_patches patches

    declare -a common=()
    get_common common

    cat <<EOGRID

Patch Grid
==========

EOGRID

    ## -----------
    ## Draw header
    ## ----------- 
    declare -a header=()
    gen_header header
    printf '%s\n' "${header[@]}"

    ## -----------------
    ## Render patch grid
    ## -----------------
    local patch
    for patch in "${patches[@]}";
    do
        pushd "$patch" >/dev/null
    
        local -a buffer=()
        local column
        for column in "${columns[@]}";
        do
            case "$column" in
                'Gerrit')
                    gerrit="$(grep '://' 'gerrit' 2>/dev/null)"
                    local label="${gerrit##*}"
                    label="${label:-X}"
                    buffer+=( $(printf '[%s](%s) ' "${patch##*/}" "${gerrit}") )
                    ;;

                'Jira')
                    buffer+=(' ')
                    if [[ -f 'jira' ]]; then 
                        readarray -t jiras < <(grep '^VOL' 'jira' 2>/dev/null | sort)

                        local -a accum=()
                        local jira
                        for jira in "${jiras[@]}";
                        do
                            local jira_url=''
                            gen_jira_url jira_url "$jira"
                            accum+=( $(printf '[x](%s)' "$jira_url") )
                        done # for jira
                        buffer[-1]="$(join_by ', ' "${accum[@]}")"
                    fi # if -f jira
                    ;;

                'Jenkins')
                    buffer+=(' ')

                    local -a jenkins=()
                    if [[ -f 'jenkins' ]]; then
                        readarray -t jenkins < <(cut -d'#' -f1 'jenkins' | grep '://')
                    fi

                    local -a accum=()
                    local url=''
                    for url in "${jenkins[@]}";
                    do
                        local -a accum=()
                        accum+=( $(printf '[x](%s)' "$url") )
                    done # for jira
                    buffer[-1]="$(join_by ', ' "${accum[@]}")"
                    ;;

                [cC]onflict)
                    if [[ -e "$column" ]]; then
                        buffer+=('![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png)')
#                        buffer+=('X')
                    else
                        buffer+=(' ')
                    fi
                    ;;

                [rR]echeck)
                    if [[ -e "$column" ]]; then
                        buffer+=('![#32CD32](https://placehold.co/15x15/633974/633974.png)')
                        # buffer+=('X')
                    else
                        buffer+=(' ')
                    fi
                    ;;

                Reviewed)
                    if [[ -e 'reviewed' ]]; then
                        buffer+=('![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png)')
                    else
                        buffer+=(' ')
                    fi
                    ;;
                
                [nN]otes)
                    buffer+=(' ')
                    if [[ -f 'notes' ]]; then
                        readarray -t notes <'notes'
                        buffer[-1]="$(join_by '<br>' "${notes[@]}")"
                    fi
                    ;;

                *) buffer+=(' ') ;;
            esac
        done # for column

        local grid
        gen_grid_line grid buffer
        echo "$grid"

        popd >/dev/null

    done # for patch
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function generate()
{
    cat template/header.md

    local -a grid=()
    gen_patch_grid grid
    echo "${grid[@]}"
    
    echo
    cat template/legend.md
    echo
    cat template/grid.md
    echo
    cat template/trailer.md
    return
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
