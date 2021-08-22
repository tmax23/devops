#!/bin/bash

for (( i = 0; i < 15; i++ ));
do
  if [[ $i -gt 5 ]] && [[ $i -lt 10 ]];
  then
    continue
  fi
  echo "i=$i+1"
done
