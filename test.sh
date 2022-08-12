$#!/bin/bash
countLines=$(wc --lines < array.sh)
min=1

for (( i=1; i<countLines +1; i++)); do
path=$(sed -n "${i}"p array.sh)
project=$(sed -n "${i}"p te.sh)
declare -a tableau1=("${tableau1[@]}" "${project}")
declare -a tableau=("${tableau[@]}" "${path}")
done
echo "${tableau[@]}"
echo "${tableau1[@]}"
