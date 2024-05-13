#!/bin/bash

mkdir -p ~/.debug
log="${HOME}/.debug/xy.log"
date > "$log"

pkill --echo --full 'XYZ='

declare -a gtargs=()
gtargs+=("--profile='5ff25a01-9b56-401a-a268-43e87db5e674'")
gtargs+=('--geometry' '75x40+1200+0')
nohup gnome-terminal "${gtargs[@]}" -- sh -c "XYZ= && tail -f $log" >/dev/null 2>/dev/null &
sleep 1

declare -a args=()
# args+=('https://gerrit.opencord.org/c/bbsim/+/35225')
args+=('https://jenkins.opencord.org/job/verify_bbsim_sanity-test/1295/consoleText')
 
bin/gather.sh "${args[@]}"  2>&1 > "$log"


# ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller > log

# ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller 

# ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller "Ie48a6e5a1df6e08c6f83d03fa7ff920689a3608d" | jq .[]


# 35217
# 03:40:51 Triggered by Gerrit: https://gerrit.opencord.org/c/voltha-go-controller/+/35217
