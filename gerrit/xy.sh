#!/bin/bash

declare -a args=()
# args+=('https://gerrit.opencord.org/c/bbsim/+/35225')
args+=('https://jenkins.opencord.org/job/verify_bbsim_sanity-test/1295/consoleText')
 
bin/gather.sh "${args[@]}"

ls data/35225


# ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller > log

# ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller 

# ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller "Ie48a6e5a1df6e08c6f83d03fa7ff920689a3608d" | jq .[]
