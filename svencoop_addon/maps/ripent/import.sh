#!/bin/bash

mapfile="$1"

if [[ ! -z "${mapfile// }" ]] && [ -f ../$mapfile.bsp ] && [ -f ./$mapfile.ent ]; then
	cp ./$mapfile.ent ../
	../../../svencoop/maps/ripent -import ../../../svencoop_addon/maps/$mapfile
	rm -f ../$mapfile.ent
fi
