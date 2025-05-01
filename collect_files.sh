#!/bin/bash
in_dir=$1
out_dir=$2

find "$in_dir" -type f | while read -r src; do
    name=$(basename "$src")
    dst="$out_dir/$name"
    n=1
    while [ -e "$dst" ]; do
        base=${name%.*}
        ext=${name##*.}
        if [ "$base" = "$ext" ]; then
            dst="$out_dir/${base}_$n"
        else
            dst="$out_dir/${base}_$n.$ext"
        fi
        n=$((n+1))
    done
    cp "$src" "$dst"
done