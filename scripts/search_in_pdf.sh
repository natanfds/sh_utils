#!/bin/bash

term=$1

which pdftotext > /dev/null
if [ $? -ne 0 ]; then
    echo "pdftotext not found"
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "Usage: ./search_in_pdf.sh <term>"
    exit 1
fi

if [ ! -f '*.pdf' ]; then
    echo "There is no pdf in this folder"
    exit 1
fi

for file in *.pdf; do
  temp_file=$(mktemp)
  pdftotext "$file" $temp_file 2>/dev/null
  echo $file
  cat $temp_file
  grep $term
done 