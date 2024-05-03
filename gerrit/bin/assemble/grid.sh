#!/bin/bash

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function gen_grid_line()
{
    local -n GGL_ref=$1; shift
    local -n data=$1; shift

    local line="$(join_by ' | ' "${data[@]}")"
    GGL_ref="| ${line} |"

    return
}
