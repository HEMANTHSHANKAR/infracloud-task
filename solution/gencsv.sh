#!/bin/bash

randomnumbers=${1:-10} 
for i in $(seq 0 $randomnumbers);
do echo "$i, $((1 + $RANDOM % 100000))";
done > inputFile
