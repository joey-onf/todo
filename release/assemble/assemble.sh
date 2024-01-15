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
## -----------------------------------------------------------------------
function trim()
{
    local ref=$1; shift

    local abc=("${ref[@]}")
#     ref=( "${ref[@]/#+([[:blank:]])/}" ) # remove leading space/tab from each element
    # var="${var#"${var%%[![:space:]]*}"}"    # leading
    # $ var="${var%"${var##*[![:space:]]}"}"  # trailiing

    # ref=("${ref%"${ref##*[![:blank:]]}"}") # trailiing
    # declare -p ref
    
    abc=( "${abc[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    abc=( "${abc[@]/%+([[:blank:]])/}" ) # remove trailing space/tab from each element
    ref=("${abc[@]}")
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function do_legend()
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
do_legend 'tmp' fields

( printf '|%s' "${fields[@]}" ; echo '|') > tmp/xyz
column --separator '|' --output-separator ' | ' --table tmp/xyz > tmp/header
echo ' | ---------- | ------- | --- | - | - | - | - | - | - | - | - |' >> tmp/header

declare -a repos=()
repos+=('voltha-protos.raw')
repos+=('voltha-lib-go.raw')

for key in "${fields[@]}";
do
#    echo
#    echo "LEGEND: [$key]"

    declare -a gather=()
    for repo in "${repos[@]}";
    do
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

(
    cat header
    paste --delimiter '|' 'null' "${fields[@]}" 'null' \
        | column --separator '|' --output-separator ' | '  --table
)
# paste --delimiter '|' tmp/null tmp/legend tmp/null \
#      | column --separator '|' --output-separator ' | '  --table

popd > /dev/null

# [EOF]
