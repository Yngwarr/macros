#!/bin/bash

VER="$1"

gawk -f cut.awk -v version="$VER" example.js 
