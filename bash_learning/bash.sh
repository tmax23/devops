#!/bin/bash

path=$(echo $PATH | sed 's/:/ /g')
i=0

for dir in $path; do
  list=$(ls $dir)
  for count in $list; do
    i=$(($i+1))
  done
  echo "$dir --- $i files"
  i=0
done
