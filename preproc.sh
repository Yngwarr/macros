#!/bin/bash

FILE="$1"
VER="$2"
SIZE="$3"

gawk -f cut.awk -v version="$VER" -v size="$SIZE" "$FILE"
