#!/usr/bin/env bash

INPUT="$1"
OUTPUT="${2:-${INPUT%.md}.pdf}"
ENGINE=(pdflatex xelatex)

echo "Converting $INPUT to $OUTPUT..."
pandoc "$INPUT" -o "$OUTPUT" \
    --pdf-engine="${ENGINE[1]}" -s \
    && echo "Done" || echo "Failed"
