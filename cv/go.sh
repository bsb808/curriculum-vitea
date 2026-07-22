#!/usr/bin/env bash
# Build the CV. Run from the cv/ directory: ./go.sh   (or ./go.sh clean)
set -e
cd "$(dirname "$0")"

if [ "$1" = "clean" ]; then
  latexmk -C
else
  latexmk -pdf main.tex   # runs pdflatex + biber as needed -> main.pdf
fi
