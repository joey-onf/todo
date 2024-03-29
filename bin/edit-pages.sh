#!/bin/bash

while [[ $# -gt 0 ]]; do
    arg="$1"; shift
    case "$arg" in
        --edit) declare -i argv_edit=1 ;;
        --force) declare -i argv_force=1 ;;
    esac
done

declare -a onos_packages=()
onos_packages+=('aaa')
onos_packages+=('bng')
onos_packages+=('dhcpl2relay')
onos_packages+=('kafka' 'kafka-onos')
# onos_packages+=('kafka')
onos_packages+=('mcast')
onos_packages+=('maclearner' 'mac-learning')
onos_packages+=('olttopology')
onos_packages+=('olt')
onos_packages+=('sadis')
readonly onos_packages

for onos_package in "${onos_packages[@]}";
do
    declare -a edit=()
    readme_md="release/${onos_package}/README.md"
    edit+=("$readme_md")

    case "$onos_package" in
        kafka) continue ;;
        maclearner) continue ;;
    esac

    for prefix in 'maven-artifacts';
    do
        echo "** repo=[$onos_package], template=[$prefix]"
        path="release/${onos_package}"
        md="${path}/${prefix}.md"
        [[ -v argv_force ]] && { /bin/rm -f "$md"; }
        if [[ ! -f "$md" ]]; then
	        declare -p onos_package
            sed -e "s/{pkg}/${onos_package}/g" \
                "release/template/${prefix}.tmpl" \
                > "$md"

	    edit+=("$md")

        if ! grep -q 'ARTIFACTS: Publishing' "$readme_md"; then
            cat <<EOM >> "$readme_md"

ARTIFACTS: Publishing
=====================

| Status   | Artifact         | Notes |
| ------   | ---------------- | ----- |
| :hammer: | [maven-artifacts](maven-artifacts.md) | |

ARTIFACTS: Published
====================

EOM
            fi # if grep Publishing
        fi # if ! template

        [[ -v argv_edit ]] && { /usr/bin/emacs "${edit[@]}"; }

    done

done


