#!/bin/bash

declare -A meta=()
meta['aaa']='2.11.0'
meta['bng']='2.5.1'
meta['dhcpl2relay']='2.11.0'
meta['igmpproxy']='2.9.0'
meta['kafka']='2.13.0'
meta['maclearner']='1.2.3'
meta['mcast']='x.y.z'
meta['olt']='5.2.5'
meta['olttopology']='1.3.1'
meta['pppoeagent']='1.3.0'
meta['sadis']='5.12.2'

keys=("${!meta[@]}")

readarray -t readmes < <(find . -name 'README.md' -print)
for readme in "${readmes[@]}";
do
    readarray -d'/' -t fields < <(printf '%s' "$readme")
    key="${fields[-2]}"
    
    if [[ " ${keys[*]} " =~ " $key " ]]; then
        echo "FOUND KEY: $key"
        ver="${meta[$key]}"
        sed -e "s/{pkg}/$key/g" \
            -e "s/{ver}/$ver/g" \
            'update/released.tmpl' \
            > 'readme.tmp'
    else
        cp 'update/released.tmpl' 'readme.tmp'
    fi

    cat 'readme.tmp' >> "$readme"

#    echo "RM: $readme"
 #   cat update/released.tmpl >> "$readme"
  #       # sed -e 's/{ver}/$ver/' \
   #          -e 's/{pkg}/$pkg/'
done

rm -f 'readme.tmp'

# [EOF]
