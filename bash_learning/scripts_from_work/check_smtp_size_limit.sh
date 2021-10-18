#!/bin/bash


MX=$(nslookup -type=mx $1 | grep -m 1 "mail exchanger" | awk '{print $6}')
var=$(swaks --to user@mail.ru --server $MX | grep 250-SIZE | sed 's/^.*SIZE//')
echo "Source size = $var"
if [[ $var ]]
then echo "Calculated size = $(( $(swaks --to user@mail.ru --server $MX | grep 250-SIZE | sed 's/^<.*E[[:space:]]//')/(1024*1024) )) MB"
else echo "size from smpt not found"
fi
