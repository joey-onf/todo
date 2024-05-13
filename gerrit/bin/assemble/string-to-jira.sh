#!/bin/bash

## -----------------------------------------------------------------------
## Intent: Return a list of common functions and matching strings
## -----------------------------------------------------------------------
function get_error_map()
{
    local -n ref=$1;

    ref=()
    ref['VOL-5291']="Build timed out"
    ref['VOL-5291']='Timeout exceeded:'
    
    ref['VOL-5311']="Test Perform BBSim Sanity :: Validates the BBSim Functionality for... | FAIL |"
    
    ref['VOL-5331']="Sanity E2E Test for OLT/ONU on POD for DT :: Validates E2E Ping Co... | FAIL |"
    ref['VOL-5331']="Voltha DT PODTests :: Test various end-to-end scenarios               | FAIL |"
    
    ref['VOL-5335']="Sanity E2E Test for TT (HSIA, VoD, VoIP) :: Validates E2E Ping Con... | FAIL |"
    ref['VOL-5335']="Voltha TT PODTests :: Test various functional end-to-end scenarios... | FAIL |"
    return
}

# [EOF]
