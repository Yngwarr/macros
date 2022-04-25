#!/bin/bash

FILE="$1"

cat "$FILE"
echo
echo Version 1, 5mb:
./preproc.sh "$FILE" 1 5
echo
echo Version 1, 2mb:
./preproc.sh "$FILE" 1 2
echo
echo Version 2, 5mb:
./preproc.sh "$FILE" 2 5
echo
echo Version 2, 2mb:
./preproc.sh "$FILE" 2 2
