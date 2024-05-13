#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

function is_valid_repo()
{
    local IVR_repo="$1"; shift

    case "$IVR_repo" in
        bbsim) ;;
        voltctl) ;;
        bbsim) ;;
        olt) ;;
        openolt) ;;
        voltctl) ;;
        voltha-docs) ;;
        voltha-go) ;;
        voltha-go-controller ) ;;
        voltha-helm-charts ) ;;
        voltha-openolt-adapter ) ;;
        voltha-openonu-adapter-go) ;;
        voltha-protos) ;;
        voltha-system-tests) ;;
        *) local -i invalid=1 ;;
    esac

    [[ -v invalid ]] && { false; } || { true; }
    return
}

: # assign ($?==0) for source $script

# [EOF]
