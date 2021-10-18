#!/bin/bash

now=`date +%Y-%m-%d_%H-%M-%S`
sshpass -p 'admin2301541' scp admin@10.10.1.1:fgt-config /mnt/backup_from_linserver/forti_config/fgtcfg_$now
find /mnt/backup_from_linserver/forti_config/fgtcfg_* -mtime +7 -exec rm -f {} \;
#chmod 666 /mnt/backup_from_linserver/forti_config/fgtcfg_*
