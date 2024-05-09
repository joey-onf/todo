#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

function init()
{ # loader
    declare -g pgm=''
    pgm="$(realpath --canonicalize-existing "$0")"
    readonly pgm

    declare -g sandbox_root="${pgm[0]%/*}"
    sandbox_root="${sandbox_root%/*}"
    readonly sandbox_root

    declare -g sandbox_data="${sandbox_root}/data"
    readonly sandbox_data
#     source '/sandbox/onf-common/common.sh' '--common-args-begin--'
}
init

# set -euo pipefail


##------------------##
##---]  GLOBAL  [---##
##------------------##
declare -g -a gerrit=()
declare -g -a jenkins=()

##--------------------##
##---]  INCLUDES  [---##
##--------------------##

## -----------------------------------------------------------------------
## Intent: Display an error message then exit with non-zero status
## -----------------------------------------------------------------------
function error()
{
    cat <<EOERR

** -----------------------------------------------------------------------
** IAM: ${FUNCNAME[1]} (LINENO: ${BASH_LINENO[1]})
** ERR: $*
** -----------------------------------------------------------------------
EOERR

    exit 1
}

## -----------------------------------------------------------------------
## Intent: Parse URLs and derive paths
## -----------------------------------------------------------------------
function get_paths()
{
    local -n ref=$1; shift

    local gerr_url="$1"; shift
    local jenk_url="$1"; shift

    local -A temp
    get_gerrit  "$jenk_gerrit" temp
    get_jenkins "$jenk_url" temp

    local repo="${temp['repo']}"
    local patch="${temp['patch']}"
    local job="${temp['job']}"
    local patch_dir="data/${patch}"
    local ger_path="${patch_dir}/jenkins"
    local job_root="${patch_dir}/jobs"

    temp['patch_dir']="$patch_dir"
    temp['gerrit_dir']="$patch_dir"
    temp['jenkins_urls']="${patch_dir}/jenkins"

    temp['job_root']="$job_root"
    temp['job_dir']="${job_root}/${job}"

    ref=()
    local key
    for key in "${!temp[@]}"; do
        ref["$key"]="${temp[$key]}"
    done

    return
}

## -----------------------------------------------------------------------
## Intent: Gather known failure strings from job logs
## Post:
##   o When errors are detected
##   o state captured in data/{gerrit-patch}/jobs/{job-id}/{FAIL, ...}
## -----------------------------------------------------------------------
function detect_fail()
{
    local -n ref=$1 ; shift
    local log="$1"  ; shift

    ## Color red if file 'FAIL' exists in jobs
    declare -a wanted=()
    wanted+=('-e' '| FAIL |')
    readarray -t strings < <(grep --fixed-strings "${wanted[@]}" "$log")
    ref=("${strings[@]}")

    [[ ${#strings[@]} -gt 0 ]] && { true; } || { false; }
    return
}

## -----------------------------------------------------------------------
## Intent: Parse a jenkins URL into fields.  Argument can be a file or URL
## Return:
##   hash
## -----------------------------------------------------------------------
function get_jenkins()
{
    local url="$1"; shift
    local -n ref=$1; shift

    if [[ -f "$url" ]]; then
        readarray -t tmp <"$url"
        [[ ${#tmp[@]} -ne 1 ]] && { error "File does not contain a URL: $url"; }
        url="${tmp[0]}"
    fi

    case "$url" in
        *'://jenkins.opencord.org'*) ;;
        *) error "Detected invalid gerrit url: [$url]" ;;
    esac
    
    # args+=('https://jenkins.opencord.org/job/verify_bbsim_sanity-test/1295/consoleText')    
    readarray -d'/' -t fields < <(printf '%s' "$url")

    local -i job="${fields[-2]}" # sanity test value
    ref['job']="$job"
    ref['job_name']="${fields[-3]}"

    return
}

## -----------------------------------------------------------------------
## Intent: Parse a gerrit URL into fields.  Argument can be a file or ULR
## Return:
##   hash
##     repo   Name of gerrit repository
##     patch  ID of the gerrit patch
## -----------------------------------------------------------------------
function get_gerrit()
{
    local url="$1"; shift
    local -n ref=$1; shift

    if [[ -f "$url" ]]; then
        readarray -t tmp <"$url"
        [[ ${#tmp[@]} -ne 1 ]] && { error "File does not contain a url: $url"; }
        url="${tmp[0]}"
    fi

    case "$url" in
        *'://gerrit.opencord.org'*) ;;
        *) error "Detected invalid gerrit url: [$url]" ;;
    esac
    
    readarray -d'/' -t fields < <(printf '%s' "$url")

    ref['patch']="${fields[-1]}"
    ref['repo']="${fields[-3]}"

    return
}

## -----------------------------------------------------------------------
## Intent: Parse a gerrit patch and create metadata
## -----------------------------------------------------------------------
function parse_gerrit()
{
    local url="$1"; shift

    if [[ -f "$url" ]]; then
        readarray -t tmp <"$url"
        [[ ${#tmp[@]} -ne 1 ]] && { error "Invalid gerrit file: $url"; }
        url="${tmp[0]}"
    fi

    case "$url" in
        *'://gerrit.opencord.org'*) ;;
        *) error "Detected invalid gerrit url: [$url]" ;;
    esac
    
    # https://gerrit.opencord.org/c/bbsim/+/35225
    readarray -d'/' -t fields < <(printf '%s' "$url")

    local -i patch="${fields[-1]}"
    local repo="${fields[-3]}"

    local ger_urls='data/gerrit.urls'
    if ! grep -q "$url" "$ger_urls"; then
        echo "$url" >> "$ger_urls"
        make
    fi

    return
}

## -----------------------------------------------------------------------
## Intent: Retrieve and parse a jenkins log
## -----------------------------------------------------------------------
function capture()
{
    local jenk_url="$1"; shift

    ## ----------------------------------
    ## function: jenkins_mkdir ( cached )
    ## ----------------------------------
    local uui="$(echo "$jenk_url" | md5sum --text | cut -d' ' -f1)"
    local jenk_dir="data/jenkins/${uui}"
    mkdir -p "$jenk_dir"

    ## ------------
    ## Retrieve log
    ## ------------
    local jenk_log="$jenk_dir/consoleText"
    if [[ ! -f "$jenk_log" ]]; then
        curl -o "$jenk_log" "$jenk_url";
        echo "$jenk_url" >> "$jenk_dir/jenkins"
    fi

    ## -------------
    ## Central Index
    ## -------------
    local jenk_urls="${sandbox_data}/jenkins.urls"
    if ! grep --fixed-strings -q "$jenk_url" "$jenk_urls"; then
        echo "$jenk_url" >> "$jenk_urls"
    fi

    ## --------------------------------
    ## Map jenkins job to gerrit patch
    ## --------------------------------
    local jenk_gerrit="${jenk_dir}/gerrit"
    if [[ ! -f "$jenk_gerrit" ]]; then
        readarray -t fields < <(\
            awk '/Triggered by Gerrit/{ print $0 }' "$jenk_log" \
                | tr '[[:blank:]]' '\n' | grep '://')

        if [[ ${#fields[@]} -eq 0 ]]; then
            emacs "$jenk_log"
            error "Gerrit detect failed (LINENO:$LINENO) for $jenk_url"
        fi

        for gerrit_url in "${fields[@]}";
        do
            parse_gerrit "$gerrit_url" # sanity check incoming args
            echo "$gerrit_url" >> "$jenk_gerrit"
        done
    fi

    ## ----------------------------
    ## Update job list within patch
    ## ----------------------------
    parse_gerrit "$jenk_gerrit"

    local -A vals=()
    get_paths vals "$jenk_gerrit" "$jenk_url"
    # declare -p vals | tr ' ' '\n'

    local repo="${vals[repo]}"
    local job_root="${vals[job_root]}"
    local gerrit_dir="${vals[gerrit_dir]}"
    local job="${vals[job]}"
    local job_name="${vals[job_name]}"
    local job_dir="${vals[job_dir]}"
    local patch_dir="${vals[patch_dir]}"
    local jenkins_urls="${vals[jenkins_urls]}"
    local patch="${vals[patch]}"

    mkdir -p "$patch_dir"
#    touch "$ger_path"
    touch "$jenkins_urls"
    if ! grep -q "$jenk_url" "$jenkins_urls"; then
        echo "$jenk_url" >> "$jenkins_urls"
    fi

    local -a errs=()
    if detect_fail errs "$jenk_log"; then
        mkdir -p "$job_dir"
        pushd "$job_dir" >/dev/null || { error "pushd failed; $job_dir"; }
        printf '%s\n' "${errs[@]}" > 'FAIL'
        echo "$jenk_log" >> logs
        popd >/dev/null || { error "popd failed; $job_dir"; }
    fi

    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function is_valid_repo()
{
    local repo="$1"; shift
    case "$repo" in
        votlha-docs) ;;
        voltha-go-controller) ;;
        voltha-lib-go) ;;
        voltha-protos) ;;
        *) error "Detect invalid repo: $repo" ;;
    esac

    return
}

##---------------##
##---] MAIN  [---##
##---------------##

touch foo

while [[ $# -gt 0 ]]; do
    arg="$1"; shift

    declare -a gerrs=()
    declare -a jenks=()

    case "$arg" in

        '--repo')
            arg="$1"; shift
            is_valid_repo "$arg"
            declare repo="$arg"
            ;;

        '--gerrit')
            [[ ! -v repo ]] && { error '--repo is required'; }
            declare -i id="$1"; shift
            # ssh
            gerrs+=("https://gerrit.opencord.org/c/${repo}/+/${id}")
            unset repo
            ;;

        '--jenkins')
            [[ ! -v subdir ]] && { error '--subdir is required'; }
            declare -i id="$1"; shift
            jenks+=("https://jenkins.opencord.org/job/${subdir}/${id}/consoleText")
            unset subdir
            ;;

        '--subdir')
            arg="$1"; shift
            [[ "$arg" != *"$repo"* ]] && { error "--repo is required"; }
            declare subdir="$arg"
            unset repo
            ;;

        'https://gerrit.opencord.org/c/'*) gerr+=("$arg") ;;

        ## URL copied from jenkins history
        # --------------------------------------------------------------------------
        # https://jenkins.opencord.org/job/verify_voltha-go-controller_unit-test/264/
        # https://jenkins.opencord.org/job/verify_bbsim_sanity-test/1295/consoleText
        # --------------------------------------------------------------------------
        'https://jenkins.opencord.org/'*)
            url="$arg"
            shopt -s extglob # ON
            url="${url%%+(/)}"
            shopt -u extglob # OFF
            url+='/consoleText'
            jenks+=("$url")
            ;;

        *)
            if [[ -f "$arg" ]]; then
                readarray -t -t fields < <(grep '://' "$arg")
                set -- "${fields[@]}" "$@"
            else
                error "Detect invalid argument: $arg"
            fi               
    esac

    
    for gerr in "${gerrs[@]}";
    do
        if ! curl --head --silent "$gerr" > /dev/null 2>&1; then
            error "URL is invalid: $gerr"
        fi
        parse_gerrit "$gerr"
    done

    for jenk in "${jenks[@]}";
    do
        if ! curl --head --silent "$jenk" > /dev/null 2>&1; then
            error "URL is invalid: $jenk"
        fi
        capture "$jenk"
    done

done

cat <<EOF

** -----------------------------------------------------------------------
** Files modified by the current run
** -----------------------------------------------------------------------

EOF
find . -newer foo -ls


find . -newer foo -name 'jenkins' -print0 \
     | xargs -0 -I'{}' --no-run-if-empty sort -nr --output={} {}

# [EOF]
