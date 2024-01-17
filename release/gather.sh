#!/bin/bash

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function error()
{
    cat <<EOF

** -----------------------------------------------------------------------
** ERROR: $@
** -----------------------------------------------------------------------

EOF
    exit 1
}

## -----------------------------------------------------------------------
## Intent: Query for gerrit --patch-sets
## -----------------------------------------------------------------------
function query_patch_sets()
{
    local -n gargs=$1; shift
    local repo="$1"; shift
 
#    ssh gerrit.opencord.org gerrit query "${gargs[@]}" --format=JSON --patch-sets "projects:${repo} AND status:open" > "$data"
#    jq '.url' < "$data" > "${data_prefix}.url.json"
#        jq '.commitMessage' < "$data" > "${data_prefix}.cm.json"
#    fi


#    what='urls' # create repositories/{repo}.url.json
#    case "$what" in
#	    urls)
#            jq '.url' "$data" \
#                | awk -F\" '{print $2}' > "${repo_prefix}.url.json"
#            ;;
#        *)
#            paste --delimiter='|||' "${data_prefix}.url.json" "${data_prefix}.cm.json" > "${repo}.md"
            
#    | jq -r '["URL" "Description"], ["--","-----------"], (.[] | [.url, .commitMessage]) | @tsv' \
#    | column -ts $'\t'
#     | jq '.url,.commitMessage' 
    #	;;
    error "EARLY EXIT"
    return
}

## -----------------------------------------------------------------------
## Intent: Determine if a given --repo stirng is a valid repository name
## -----------------------------------------------------------------------
function verify_repo_name()
{
    local name="$1"; shift

    local conf='assemble/repos/voltha'
    readarray -t repositories < <(
        awk -F'#' '{print $1}' "$conf"  \
            | grep '^[a-z]'
    )

    [[ ! " ${repositories[*]} " =~ " ${name} " ]] \
        && { declare -i ans=1; } \
        || { declare -i ans=0; }

    # [[ $ans -eq 1 ]] && { true; } || { false; }
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function usage()
{
    cat <<EOH

Usage: $0
  --repo [r]           Gather patch URLs for named repository
  --view [r]           View gathered patches for named repository

[MODIFIERS ]
  --status  s={o,c}    Query by ticket status
     s=[open|closed]

[FORMAT]
  --json               Output data formatted as JSON records

  --help               Dispaly this message
EOH

    return
}
    
##----------------##
##---]  MAIN  [---##
##----------------##
rm -fr tmp
mkdir -p tmp
mkdir -p repositories

declare -a gerrit_args=()

declare -a repos=()
while [[ $# -gt 0 ]]; do
    echo "** \$@=[$@]"
    arg="$1"; shift
    case "$arg" in
        --help) usage; exit 0 ;;

        --json) gerrit_args+=('--format=JSON') ;;

        --patch-sets)
            declare -g -i argv_patch_sets=1
            set -- '--json' "$@"
            ;;

        --status)
            local arg="$1"; shift
            case "$arg" in
                c*) arg='closed' ;;
                o*) arg='open'   ;;
                *) error "Detected unknown --status [$arg]" ;;
            esac

            [[ ! -v argv_status ]] && { declare -g -a argv_status=(); }
            # status:open
            argv_status+=("status:${arg}")
            ;;
        
#@ topic:MY-TOPIC status:open project:xxx
        
        --repo)
            arg="$1"; shift
            verify_repo_name "$arg" \
                || { error "Detected invalid arg: --repo [$arg]"; }
            repos+=("$arg"); shift
            ;;

        --view)
            [[ ! -v views ]] && { declare -g views=(); }
            declare repo="$1"; shift
            repos+=("$repo")
            views+=("$repo")
            ;;
        *) error "Detected invalid arg [$arg]" ;;
    esac
done

## -----------------
## Add argv defaults
## -----------------
[[ ! -v repos ]] && { error "--repo is required"; }

#[[ -v argv_status ]] \
#    && { gerrit_args+=("${argv_status[@]}"); } \
#    || { gerrit_args+=('status:open'); }

## -----------------------------------------------------------------------
## Query gerrit, output json data files
## -----------------------------------------------------------------------
for repo in "${repos[@]}";
do
    repo_prefix="repositories/${repo}"

    data_prefix="tmp/${repo}"
    data="${data_prefix}.json"
    [[ -f "$data" ]] && continue

    if [[ -v argv_patch_sets ]]; then
        declare -a foo=()
        foo+=("${gerrit_args[@]}")
        foo+=('--format=JSON')
        foo+=('--patch-sets')
        query_patch_sets "$repo"
#    ssh gerrit.opencord.org gerrit query "${gargs[@]}" --format=JSON --patch-sets "projects:${repo} AND status:open" > "$data"
         "projects:${repo} AND status:open" > "$data"
        jq '.url' < "$data" > "${data_prefix}.url.json"
        jq '.commitMessage' < "$data" > "${data_prefix}.cm.json"
    fi


    what='urls' # create repositories/{repo}.url.json
    case "$what" in
	    urls)
            jq '.url' "$data" \
                | awk -F\" '{print $2}' > "${repo_prefix}.url.json"
            ;;
        *)
            paste --delimiter='|||' "${data_prefix}.url.json" "${data_prefix}.cm.json" > "${repo}.md"
            
#    | jq -r '["URL" "Description"], ["--","-----------"], (.[] | [.url, .commitMessage]) | @tsv' \
#    | column -ts $'\t'
#     | jq '.url,.commitMessage' 
	;;
esac
done

if [[ -v views ]]; then
    declare -a urls=()
    for view in "${views[@]}";
    do
        repo_prefix="repositories/${view}"
        path="${repo_prefix}.url.json"
        readarray -t buffer < "$path"
        urls+=("${buffer[@]}")
    done

    [[ ${#urls[@]} -gt 0 ]] && { firefox "${urls[@]}"; }
fi
