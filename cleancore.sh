#!/bin/bash

#find /home/duko/scds -maxdepth 1 -name "core.*[0-9]" -type f -mmin +30 -delete

incArray=(`find /home/duko/scds -maxdepth 1 -name "core.*[0-9]" -type f -mmin +30`)
if [ ${#incArray[@]} -gt 3 ]; then
	for i in "${incArray[@]}"
	do
		rm $i
	done
else
	incArray=(`find /home/duko/scds -maxdepth 1 -name "core.*[0-9]" -type f -mtime +2`)
	
	if [ ${#incArray[@]} -gt 0 ]; then
		for i in "${incArray[@]}"
		do
			rm $i
		done	
	fi
fi
