#!/bin/bash

clenaup
git add --all
git commit --message 'Add more patch and jira urls'
rebase.sh
reviewers.sh --none
