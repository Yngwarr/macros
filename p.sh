#!/bin/bash

SRC="$1"
DST="$2"
VER="$3"
CONF="versions.conf"

for f in $(pushd "$SRC" > /dev/null ; find * ; popd > /dev/null) ; do
    if [[ -d "$SRC/$f" ]] ; then
        mkdir -p "$DST/$f"
        continue
    fi

    if [[ "$f" == "$CONF" ]] ; then continue ; fi

    if [[ -f "$SRC/$f" ]] ; then
        gawk -f ~/opt/cut.awk -v version="$VER" $(sed -n "${VER}p" "$SRC/$CONF") "$SRC/$f" > "$DST/$f"
    fi

    echo "$f"
done
