#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Generate jenkins job urls sutiable for pasting into a markdown
##         README.md document.  The script will create a temp workspace,
##         generate text into a temp file then use xclip to copy text
##         into a paste buffer.
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Display an error message then exit hard
## -----------------------------------------------------------------------
function error()
{
    cat <<EOE
** -----------------------------------------------------------------------
** ERROR: $@
** -----------------------------------------------------------------------

EOE
    exit 1
}

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
## NOTE:
##   o Caller should export TMPDIR="${path}"
##   o TMPDIR= only visible when sourced form top level parent scope
## -----------------------------------------------------------------------
function common_tempdir_mkdir()
{
    declare -n ref=$1; shift
    #    local var="$1"; shift

    local pkgbase="${0##*/}" # basename
    local pkgname="${pkgbase%.*}"

    cat <<EOF
** -----------------------------------------------------------------------
** pkgbase = ${pkgbase}
** pkgname = ${pkgname}
** -----------------------------------------------------------------------
EOF
    local __junk__
    local __junk__="$(mktemp -d -t "${pkgname}.XXXXXXXXXX")"
    
    __COMMON_TEMP_DIRS__+=("$__junk__")

    export TMPDIR="$__junk__"
    # eval "${var}=${__junk__}"
    ref="${__junk__}"

    # declare -p __COMMON_TEMP_DIRS__
    return
}

## -----------------------------------------------------------------------
## Intent: Tempdir cleanup on exit
## -----------------------------------------------------------------------
function sigtrap()
{
    local dir
    for dir in "${__COMMON_TEMP_DIRS__[@]}";
    do
        if [ -e "$dir/.preserve" ]; then
            echo "Preserving test output: $TMPDIR"
            find "$TMPDIR" -ls
        else
            /bin/rm -fr "$TMPDIR"
        fi
    done
}
trap sigtrap EXIT

##----------------##
##---]  MAIN  [---##
##----------------##

if [[ $# -eq 0 ]]; then
    error "A filename is required"
elif [[ ! -f "$1" ]]; then
    error "A filename is required"
fi

src="$1"; shift
# readarray -t urls < "$1"
readarray -t urls < <(grep '://' "$src" | cut -d'#' -f1 | grep '://')

while [[ $# -gt 0 ]]; do
    arg="$1"; shift
    case "$arg" in
        --out*) declare output="$1"; shift ;;
    esac
done


declare work=''
common_tempdir_mkdir work

pushd "$work" || { error "pushd $work failed"; }

#declare -a urls=()
#urls+=('https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_unit-test-tests/1465/')
#urls+=('https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_unit-test-lint/1466/')
# urls+=('https://jenkins.opencord.org/job/verify_voltha-openonu-adapter-go_sanity-test/1711/')

declare -a buffer=()
for url in "${urls[@]}";
do
    # echo "${str: -1}"
    # echo "${std:~0}"
    declare lastch="${url:~0}"
    [[ "${lastch}" == '/' ]] && { job="${url%/*}"; }

    job="${url%/*}"
    job="${job##*/}"
    buffer+=( $(printf '[%s](%s)' "$job" "$url") )
done

#@ declare -p buffer
line=$(join_by ', ' "${buffer[@]}")

if [[ -v output ]]; then
    printf "$line" > "$output"    
else 
    xclip -sel c ./url.txt # copy buffer for paste into document
    echo "All set, now paste the url buffer into README.md"
fi

popd      || { error "popd $work failed"; }

# [EOF] - 20231222: Ignore, this triage patch will be abandoned
