#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
declare -a gerrits=()
declare -a jira=()

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
function do_attribute()
{
    local ref=$1; shift
    local arg="$1"; shift
    
    [[ ${#ref[@]} -eq 0 ]] && { error '--gerrit [id] is required'; }

    readarray -d'-' -t fields < <(printf '%s' "$arg")
    local attr="${fields[-1]}"

    for id in "${gerrits[@]}";
    do
        local path="data/${id}/${attr}"
        case "$arg" in
            *'-no-'*) /bin/rm -f "$path" ;;
                   *) date > "$path"     ;;
        esac
    done

    return
}

## -----------------------------------------------------------------------
## Intent: main()
## -----------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
    arg="$1"; shift
    case "$arg" in

        --help)
            cat <<EOH
Usage: $0
  --edit                Modify metadata files for a patch
  --ls                  Display attributes for a gerrit patch.
  --(no-)conflict [id]  Touch or remove attribute:(merge-)conflict
  --(no-)recheck  [id]  Touch or remove attribute:recheck  

% attr.sh --gerrit 35043 --conflict
% attr.sh --gerrit 35043 --conflict --recheck
EOH
            ;;

        --gerrit)
            [[ $# -eq 0 ]] && { error '--gerrit requires an argument'; }
            gerrit="$1"; shift
            path="data/${gerrit}"
            [[ ! -d "$path" ]] && { error "patch not yet tracked [$path]"; }

            declare -i id="$gerrit" # Invalid format if this fails
            gerrits+=("$id")
            ;;

#        --jira) ;;

        --*conflict) do_attribute gerrit "$arg" ;;
         --*recheck) do_attribute gerrit "$arg" ;;
         --*reviewed) do_attribute gerrit "$arg" ;;

         --edit)
             for id in "${gerrits[@]}";
             do
                 base="data/$id"
                 declare -a files=()
                 files+=("$base/jira")
                 files+=("$base/jenkins")
                 files+=("$base/notes")
                 emacs "${files[@]}"
             done
             ;;

         --ls)
             for id in "${gerrits[@]}";
             do
                 echo
                 find "data/${gerrit}" -ls
             done
             ;;
    esac
done
