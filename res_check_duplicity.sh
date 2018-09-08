#!/bin/bash

resArray=(`find ./svencoop_addon/maps -name "*.res" -type f`)
sortedArray=($(echo "${resArray[@]}" | sed 's/ /\n/g' | sort))
resultfile="res_check_duplicity.txt"

if [ ${#sortedArray[@]} -gt 0 ]; then
	if [ ! -f ./$resultfile ]; then
		writefile=true
	fi

	for i in "${sortedArray[@]}"
	do
		echo $i

		once=true
		count=0

		while IFS='' read -r line || [[ -n "$line" ]]; do
			count=$(( count+1 ))
   			#echo "Text read from file: $line"
			test=$(echo $line | sed 's/\r$//')
			if [[ "$test" == *\//* ]]; then
				continue
			fi

			if [[ -z "$test" ]]; then
				continue
			fi

			if [ -f ./svencoop_addon/$test ] && [ -f ./svencoop/$test ]; then
				echo "Duplicate file $test found!"
				if [ "$writefile" == true ]; then
					if [ "$once" == true ]; then
						echo $i >> $resultfile
						once=false
					fi
					echo "line $count: $test" >> $resultfile
				fi
			#	echo $test
			fi
		done < "$i"
	done
fi
