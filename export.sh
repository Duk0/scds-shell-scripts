#!/bin/bash

mapfile="$1"

if [[ ! -z "${mapfile// }" ]] && [ -f ../$mapfile.bsp ] && [ ! -f ./$mapfile.ent ]; then
	../../../svencoop/maps/ripent -export ../$mapfile

	if [ -f ../$mapfile.ent ]; then
		mv ../$mapfile.ent ./
	fi
fi
