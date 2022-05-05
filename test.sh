#!/bin/bash

FILE="$1"

cat "$FILE"
echo
echo Version 1, 5mb:
./preproc.sh "$FILE" 1 0
echo
echo Version 1, 2mb:
./preproc.sh "$FILE" 1 1
echo
echo Version 2, 5mb:
./preproc.sh "$FILE" 2 0
echo
echo Version 2, 2mb:
./preproc.sh "$FILE" 2 1
