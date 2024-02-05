#!/bin/bash
# -----------------------------------------------------------------------
# Intent: View rendered todo/README.md pages on github
#   - When --pkg and --ver are specified load component pom.xml for viewing
# -----------------------------------------------------------------------

declare -a urls=()

if true; then
    urls+=('https://github.com/joey-onf/todo/blob/origin/master/v12/voltha-components/README.md')
else
    urls+=('https://github.com/joey-onf/todo/blob/origin/master/release/release-meta.md')
    urls+=('https://github.com/joey-onf/todo/blob/origin/master/release/ONOS-component-deps.md')
fi


while [[ $# -gt 0 ]]; do
    arg="$1"; shift
    case "$arg" in
        --pkg)
            arg="$1"; shift
            declare pkg="$arg"
            ;;
        --ver)
            arg="$1"; shift
            declare ver="$arg"
            ;;
        *) echo "[SKIP] unknown argument [$arg]" ;;
    esac
done
# pkg='dhcpl2relay'
# ver='2.11.'

[[ -v pkg ]]  && { stem="https://gerrit.opencord.org/plugins/gitiles/${pkg}"; }


if [[ -v stem ]]; then
    urls+=("$stem")
    urls+=("${stem}/+/refs/heads/master/pom.xml")
    [[ -v ver ]] && { urls+=("${stem}/+/refs/tags/${ver}"); }
fi

# urls+=("https://gerrit.opencord.org/plugins/gitiles/${pkg}/+/refs/heads/master/pom.xml")
# urls+=("https://gerrit.opencord.org/plugins/gitiles/${pkg}")#
#
#if [[ -v version ]]; then
#    urls+=("https://gerrit.opencord.org/plugins/gitiles/${pkg}/+/refs/tags/${ver}")
#fi


"${BROWSER:-opera}" "${urls[@]}" >/dev/null 2>/dev/null &

# [EOF]
