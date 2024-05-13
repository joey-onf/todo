#!/bin/bash

readarray -t patches < <(find 'data' -name 'repo' -print)
#declare -p patches

readarray -t jenkins < <(find 'data/jenkins' -name 'jenkins' -type f -print \
                             | xargs grep --no-filename '://' \
                             | grep '/consoleText')

patches=()
for url_fyl in "${patches[@]}";
do
    url="$(cat "$url_fyl")"
    bin/gather.sh --gerrit "$url"
done

# declare -p jenkins | tr ' ' '\n'
for url in "${jenkins[@]}";
do
    bin/gather.sh --jenkins "$url"
done

# [EOF]
