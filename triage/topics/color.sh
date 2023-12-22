#!/bin/bash

path="$1"; shift
color="$1"; shift

tmp="${path}.tmp"
(
    grep -v 'placehold.co' "$path"
    case "$color" in
        red) echo '![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png)' ;;
        grey) echo '![#808080](https://placehold.co/15x15/808080/808080.png)' ;;
        green) echo '![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png)' ;;
    esac
) > "$tmp"

# diff "$tmp" "$path"
mv "$tmp" "$path"
    
