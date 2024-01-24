#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

make regen
cleanup

git add --all
git commit --message 'Add more patch and jira urls'
git push
