#!/bin/sh

if [ ! $OUTPUT_NAME ]; then
    OUTPUT_NAME="$(fc-query /input -f %{family} | fgrep -v "id 0") Ligaturized"
fi

fontforge -lang=py ligaturize.py /input --prefix="$PREFIX" --output-dir=/output/ --output-name="$OUTPUT_NAME" 2>&1 \
| fgrep -v 'This contextual rule applies no lookups.' \
| fgrep -v 'Bad device table'