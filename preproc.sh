#!/bin/bash

FILE="$1"
VER="$2"
SMALL="$3"

gawk -f cut.awk -v version="$VER" -v small="$SMALL" "$FILE"
