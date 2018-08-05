#!/bin/sh

for f in /input/*.[Tt][Tt][Ff] /input/*.[Oo][Tt][Ff] ; do
    [[ -f "$f" ]] || continue

    filename=${f##*/}
    extension="${filename##*.}"
    fontAndStyle="${filename%.*}"
    fontname="${fontAndStyle%-*}"
    style="${fontAndStyle##*-}"

    if [[ $style == $fontname ]]; then
        style=""
    else
        style="-$style"
    fi

    fontforge -lang=py ligaturize.py --prefix=$PREFIX "$f" "/output/$PREFIX-$fontAndStyle.$extension" 2>&1 \
        | fgrep -v 'This contextual rule applies no lookups.'
done