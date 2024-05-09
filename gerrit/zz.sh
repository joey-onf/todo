#!/bin/bash

if [[ ! -f 'full' ]]; then
    ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller > full
fi

# ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller 

# ssh gerrit.opencord.org gerrit query --format=JSON status:open project:voltha-go-controller "Ie48a6e5a1df6e08c6f83d03fa7ff920689a3608d" | jq .[]


jq '.[] | select(.name=="35225")' full
