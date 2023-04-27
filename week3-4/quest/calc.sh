#!/bin/bash

echo "Enter two numbers:"
read num1
read num2
echo "Choose an arithmetic operation (+, -, *, /):"
read operation
case $operation in
	+)
		result=$(( $num1 + $num2 ));;
	-)
		result=$(( $num1 - $num2 ));;
	\*)
		result=$(( $num1 * $num2 ));;
	/)
		if [ $num2 -eq 0 ]
		then
			echo "It can't be divided by zero."
			exit 0
		else
			result=$(( $num1 / $num2 ))
		fi
		;;
	*)
		echo "Invalid operator."
		exit 0
esac
echo "The result:$result"
