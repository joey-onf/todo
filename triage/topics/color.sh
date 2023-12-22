#!/bin/bash

path="$1"; shift
color="$1"; shift

tmp="${path}.tmp"
(
    grep -v 'placehold.co' "$path"
    case "$color" in
        red|[Ff][Aa][Ii][Ll]) echo '![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png)' ;;
        grey) echo '![#808080](https://placehold.co/15x15/808080/808080.png)' ;;
        green|[pP][aA][sS][sS]) echo '![#c5f015](https://placehold.co/15x15/c5f015/c5f015.png)' ;;
        lime|unset) echo '![#32CD32](https://placehold.co/15x15/32CD32/32CD32.png)' ;;
        orange) echo '![#D35400](https://placehold.co/15x15/D35400/D35400.png)' ;;

    esac
) > "$tmp"

# diff "$tmp" "$path"
mv "$tmp" "$path"
    
