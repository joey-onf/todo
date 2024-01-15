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
## -----------------------------------------------------------------------
function usage()
{
    cat <<EOH

Usage: $0
  --repo [r]           Gather patch URLs for named repository
  --view [r]           View gathered patches for named repository

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

declare -a repos=()
while [[ $# -gt 0 ]]; do
    arg="$1"; shift
    case "$arg" in
        --help) usage; exit 0 ;;
        --repo) repos+=("$1"); shift ;;
        --view)
            [[ ! -v views ]] && { declare -g views=(); }
            declare repo="$1"; shift
            repos+=("$repo")
            views+=("$repo")
            ;;
        *) error "Detected invalid arg [$arg]" ;;
    esac
done

if [[ ${#repos[@]} -eq 0 ]]; then
    repos+=('voltha-protos')
#     repos+=('voltha-lib-go')
fi

## -----------------------------------------------------------------------
## Query gerrit, output json data files
## -----------------------------------------------------------------------
for repo in "${repos[@]}";
do
    repo_prefix="repositories/${repo}"

    data_prefix="tmp/${repo}"
    data="${data_prefix}.json"
    [[ -f "$data" ]] && continue

    ssh gerrit.opencord.org  gerrit query --format=JSON --patch-sets "projects:${repo} AND status:open" > "$data"
    jq '.url' < "$data" > "${data_prefix}.url.json"
    jq '.commitMessage' < "$data" > "${data_prefix}.cm.json"


    what='urls' # create repositories/{repo}.url.json
    case "$what" in
	    urls)
            jq '.url' "$data" \
                | awk -F\" '{print $2}' > "${repo_prefix}.url.json"
            ;;
        *)
            paste --delimiter='|||' "${data_prefix}.url.json" "${data_prefix}.cm.json" > "${repo}.md"
            
#    | jq -r '["URL" "Description"], ["--","-----------"], (.[] | [.url, .commitMesage]) | @tsv' \
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
