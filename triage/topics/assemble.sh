#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Generate markdown text that can be pasted into a README.md
##         document to render a table.
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Helper method
## -----------------------------------------------------------------------
## Usage : local path="$(join_by '/' 'lib' "${fields[@]}")"
## -----------------------------------------------------------------------
function join_by()
{
    local d=${1-} f=${2-}; if shift 2; then printf %s "$f" "${@/#/$d}"; fi;
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function gerrit_urls()
{
    local src="$1"; shift
    local -n ref=$1; shift

    declare -a buffer=()
    readarray -t gerrits < <(cut -d'#' -f1 "$src" | grep '://gerrit')
    for gerrit in "${gerrits[@]}"; do
        readarray -d'/' -t fields < <(printf '%s' "$gerrit")
        for idx in $(seq $((${#fields[@]}-1)) -1 0);
        do
            field="${fields[$idx]}"
            if [[ $field =~ ^-?[0-9]+$ ]]; then
                id="$field"
                buffer+=("[$id]($gerrit)")
                break
            fi
        done
    done

    ref="$(join_by ', ' "${buffer[@]}")"
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function color_urls()
{
    local src="$1"; shift
    local -n ref=$1; shift

    declare -a buffer=()
    readarray -t colors < <(cut -d'#' -f1 "$src" | grep '://placehold.co')
    ref="$(join_by ', ' "${buffer[@]}")"
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function jenkins_urls()
{
    local src="$1"; shift
    local -n ref=$1; shift

    declare -a buffer=()
    readarray -t jenkinss < <(cut -d'#' -f1 "$src" | grep '://jenkins')
    for jenkins in "${jenkinss[@]}"; do
        readarray -d'/' -t fields < <(printf '%s' "$jenkins")
        for idx in $(seq $((${#fields[@]}-1)) -1 0);
        do
            field="${fields[$idx]}"
            if [[ $field =~ ^-?[0-9]+$ ]]; then
                id="$field"
                buffer+=("[$id]($jenkins)")
                break
            fi
        done
    done

    ref="$(join_by ', ' "${buffer[@]}")"
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function jira_urls()
{
    local src="$1"; shift
    local -n ref=$1; shift

    declare -a buffer=()
    readarray -t jiras < <(cut -d'#' -f1 "$src" | grep '://jira')
    for jira in "${jiras[@]}"; do
        readarray -d'/' -t fields < <(printf '%s' "$jira")
        for idx in $(seq $((${#fields[@]}-1)) -1 0);
        do
            field="${fields[$idx]}"
            if [[ $field =~ ^-?[0-9]+$ ]]; then
                id="$field"
                buffer+=("[$id]($jira)")
                break
            fi
        done
    done

    ref="$(join_by ', ' "${buffer[@]}")"
    return
}

# | repo  | jira | gerrit             | jenkins | Triage | Notes               |
# | ----- | ---- | ------------------ | ------- | ------ | --------------------|

readarray -t repos < <(find . -name 'urls' -print)
# readarray -t repos < <(find . -name 'urls' -print | awk -F'/' '{print $(NF-1)}')

for urls in "${repos[@]}";
do
    repo="$urls"
    repo="${repo%\/*}"  # shortest from end
    repo="${repo##*\/}" # longest from front

    # urls='voltha-lib-go/urls'

    declare -a gather=()
    gather+=("$repo")
    
    declare jira_str
    jira_urls "$urls" jira_str
    gather+=("$jira_str")

    declare gerrit_str=''
    gerrit_urls "$urls" gerrit_str
    gather+=("$gerrit_str")

    declare jenkins_str
    jenkins_urls "$urls" jenkins_str
    gather+=("$jenkins_str")

    declare color_str
    color_urls "$urls" color_str
    gather+=("$color_str") # triage

    gather+=('') # notes
    line="$(join_by ' | ' "${gather[@]}")"
    echo "| $line |"
    # declare -p line
done
# 
