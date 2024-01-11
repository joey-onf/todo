#!/bin/bash

declare -a args=()
args+=('--project' 'SEBA')
args+=('--project' 'VOL')
args+=('--opencord')

args+=('--resolved-is-empty')
# args+=('--resolved-not-empty')

args+=('--fixversion-not-empty')
# args+=('--component' 'bbsim')
args+=('--label' 'bbsim')
args+=('--label' 'Testing')
# args+=('--text' 'bbsim')

jira-search.sh "${args[@]}" &


# ( project IN (SEBA,VOL) ) AND (Resolved >= 2022-12-31) AND (Resolved <= 2024-01-01) AND (resolution NOT IN ("Duplicate","Won't Do","Won't Fix")) AND (resolved IS NOT EMPTY) AND (fixversion IS EMPTY)
