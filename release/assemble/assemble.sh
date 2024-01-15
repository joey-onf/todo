#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

shopt -s extglob                     # turn on extended glob

## -----------------------------------------------------------------------
## Intent: Parse command line paths
## -----------------------------------------------------------------------
function error
{
    echo "ERROR: $@"
    exit 1
}

## -----------------------------------------------------------------------
## Intent: Parse command line paths
## -----------------------------------------------------------------------
function program_paths()
{
    declare -g pgm="$(readlink --canonicalize-existing "$0")"
    declare -g pgmbin="${pgm%/*}"
    declare -g pgmroot="${pgmbin%/*}"
    declare -g pgmname="${pgm%%*/}"

    declare -g pgmsrc
    pgmsrc="$(readlink --canonicalize-existing "${BASH_SOURCE[0]}")"
    readonly pgmsrc

    readonly pgm
    readonly pgmbin
    readonly pgmroot
    readonly pgmname

    declare -g start_pwd="$(realpath --canonicalize-existing '.')"
    readonly start_pwd
    return
}
program_paths
cd "$pgmbin" || { error "cd $pgmbin failed"; }


## -----------------------------------------------------------------------
## Intent: Render a table legend using column names and description
## from the legend.raw config file.
## -----------------------------------------------------------------------
function draw_legend()
{
    local out="$1"; shift

    (
        printf '\n\n%s\n\n' '---'

        echo '| Label | Description |'
        echo '| ----- | ----------- |'

        sed -e 's/[[:blank:]]*^[[:blank:]]*/|/' legend.raw \
            | xargs -I'{}' echo "| {} |" \
            | column --table --separator '|' --output-separator ' | '
    ) > "$out"
    return
}

## -----------------------------------------------------------------------
## Intent: Render a markdown table using column names from legend.raw
## -----------------------------------------------------------------------
function draw_table_header()
{
    local out="$1"; shift

    tmp='tmp/gen-header'
    ( printf '|%s' "${fields[@]}" ; echo '|') > "$tmp"

    /bin/rm -f "$out"
    (
        column --separator '|' --output-separator ' | ' --table "$tmp"
        echo ' | ---------- | ------- | --- | - | - | - | - | - | - | - | - |'
    ) > "$out"
    /bin/rm "$tmp"
    return
}


## -----------------------------------------------------------------------
## Intent: Render a markdown table using column names from legend.raw
## -----------------------------------------------------------------------
function get_repositories_raw
{
    local -n ref=$1; shift

    readarray -t raw < <(awk -F\# '{print $1}' repos/voltha \
                             | grep '[a-z]')

    raw=( "${raw[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    raw=( "${raw[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    
    ref=()
    # repos+=('voltha-protos.raw')
    # repos+=('voltha-lib-go.raw') 
    for val in "${raw[@]}";
    do
        ref+=("${val}.raw")
    done

    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function trim()
{ 
   local ref=$1; shift

    local abc=("${ref[@]}")
    abc=( "${abc[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    abc=( "${abc[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    ref=("${abc[@]}")
    return
}

## -----------------------------------------------------------------------
## Intent: 
## -----------------------------------------------------------------------
function get_legend_fields()
{
    local dir="$1"; shift
    local -n ref=$1; shift

    readarray -t xyzzy < <(awk -F'^' '{print $1}' 'legend.raw')
    xyzzy=( "${xyzzy[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    xyzzy=( "${xyzzy[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    ref=("${xyzzy[@]}")
    
    return
}


##----------------##
##---]  MAIN  [---##
##----------------##
rm -fr tmp
mkdir -p tmp

declare -a fields=()
get_legend_fields 'tmp' fields

draw_table_header 'tmp/header'
draw_legend 'tmp/legend'

declare -a repos_raw=()
get_repositories_raw repos_raw

readarray -t raw < <(awk -F\# '{print $1}' repos/voltha | grep '[a-z]')
raw=( "${raw[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
raw=( "${raw[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element

declare -a repos=()
for val in "${raw[@]}";
do
    repos+=("${val}.raw")
done

                     
# repos+=('voltha-protos.raw')
# repos+=('voltha-lib-go.raw')

## ----------------------------------------------------------------------
## Iterate over table columns, gather per-repo data, write to a temp file
## used by the paste command to assemble a table.
## ----------------------------------------------------------------------
for key in "${fields[@]}";
do
    declare -a gather=()
    for repo in "${repos[@]}";
    do
        if [[ ! -f "$repo" ]]; then
            cp 'template.raw' "$repo"
        fi

        xyz=$(grep "^$key[[:blank:]]*^" "${repo}" | awk -F'^' '{print $2}')
        gather+=("$xyz")
    done

    ## -----------------------------------------------------------------------
    # trim gather
    ## -----------------------------------------------------------------------
    gather=( "${gather[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    gather=( "${gather[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element

    printf "%s\n" "${gather[@]}" > "tmp/${key}"
done

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
pushd tmp >/dev/null

printf "\n" "${gather[@]}" > 'null' # Create pre/post delimiters

## Table generation
(
    cat header

    paste --delimiter '|' 'null' "${fields[@]}" 'null' \
        | column --separator '|' --output-separator ' | '  --table

    echo
    echo
    cat legend
)

popd > /dev/null

# [EOF]
