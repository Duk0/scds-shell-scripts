#!/bin/bash

resArray=(`find ./svencoop/{*.wad,*.WAD,gfx/detail,gfx/env,maps,models,sound,sprites} -type f`)
sortedArray=($(echo "${resArray[@]}" | sed 's/ /\n/g' | sort))
resultfile="content_checker.txt"

if [ ${#sortedArray[@]} -gt 0 ]; then
	if [ ! -f ./$resultfile ]; then
		writefile=true
	fi

	for i in "${sortedArray[@]}"
	do
		file=${i: 11}
	#	echo $file

		if [ -f ./svencoop_addon/$file ]; then
			echo "Duplicate file $file found!"
			if [ "$writefile" == true ]; then
				echo "Duplicate file $file found!" >> $resultfile
			fi
		fi

	done
fi
