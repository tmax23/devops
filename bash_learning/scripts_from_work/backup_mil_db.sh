#!/bin/bash

now=`date +%Y-%m-%d_%H-%M-%S`
pg_dump -h localhost -U mil -d mil | gzip > /mnt/backup_from_linserver/mil_db/mil_$now.gz
cd /mnt/backup_from_linserver/mil_db
rm `ls -t | awk 'NR>7'`