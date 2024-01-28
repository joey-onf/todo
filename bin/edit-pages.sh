#!/bin/bash

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
    case "$onos_package" in
        kafka) continue ;;
        maclearner) continue ;;
    esac

    for prefix in 'maven-artifacts';
    do
        echo "** repo=[$onos_pacakge], template=[$prefix]"
        path="release/${onos_package}"
        md="${path}/${prefix}.md"
        [[ -f "$md" ]] && { continue; }
        
        sed -e 's/{pkg}/$onos_package/g' \
            "release/template/${prefix}.tmpl" \
            > "$md"
    done
    
    /bin/ls "release/${onos_package}/README.md"
#    /usr/bin/emacs "release/${onos_package}/README.md"
done


