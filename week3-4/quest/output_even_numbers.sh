#!/bin/bash

for i in `seq 1 100`
do
	if [ `expr $i % 2` -eq 0  ]
	then
		echo $i
	fi
done
