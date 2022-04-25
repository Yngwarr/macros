#!/bin/bash

VER="$1"
SIZE="$2"

gawk -f cut.awk -v version="$VER" -v size="$SIZE" example.js 
