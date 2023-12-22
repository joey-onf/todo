## -----------------------------------------------------------------------
## Intent: Infer script paths, define globals for access
## -----------------------------------------------------------------------
function __autoload()
{
    declare -g pgm
    declare -g pgmlib

    pgm="$(readlink --canonicalize-existing "$0")"
    pgmlib="$(readlink --canonicalize-existing "${BASH_SOURCE[0]}")"
    pgmlib="${pgmlib%/*}"

    readonly pgm
    readonly pgmlib

    return
}

__autoload
unset __autoload

# [EOF] - 20231222: Ignore, this triage patch will be abandoned
