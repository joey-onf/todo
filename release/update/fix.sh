#!/bin/bash

declare -A meta=()
meta['aaa']='2.11.0'
meta['bng']='2.5.1'
meta['dhcpl2relay']='2.11.0'
meta['igmpproxy']='2.9.0'

meta['kafka']='2.13.0'
meta['kafka-onos']='2.13.0'

meta['mac-learning']='1.2.3'
meta['maclearner']='1.2.3'

meta['mcast']='x.y.z'
meta['olt']='5.2.5'
meta['olttopology']='1.3.1'
meta['pppoeagent']='1.3.0'
meta['sadis']='5.12.2'

keys=("${!meta[@]}")

readarray -t readmes < <(find . -mindepth 2 -name 'README.md' -print)
for readme in "${readmes[@]}";
do
    readarray -d'/' -t fields < <(printf '%s' "$readme")
    key="${fields[-2]}"

    case "$key" in
        # olt) ;;
        # *) continue ;;
        *) ;;
    esac
    
    if [[ " ${keys[*]} " =~ " $key " ]]; then
        echo "FOUND[$key]: $readme"
        ver="${meta[$key]}"
        sed -e "s/{pkg}/$key/g" \
            -e "s/{ver}/$ver/g" \
            'update/released.tmpl' \
            > 'readme.tmp'
    else
        cp 'update/released.tmpl' 'readme.tmp'
    fi

    cat 'readme.tmp' >> "$readme"

    emacs "$readme"
done

rm -f 'readme.tmp'

# [EOF]
