#!/bin/bash

cleanup
make
git add --all
git ci --message 'Add more meta'
git push
