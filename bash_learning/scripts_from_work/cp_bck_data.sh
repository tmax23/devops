#!/bin/bash

cp -rL /home/linuser/forti_config /mnt/backup_from_linserver/scripts
cp -rL /home/linuser/mil_db_backup /mnt/backup_from_linserver/scripts
cp /home/linuser/cp_bck_data/cp_bck_data.sh /mnt/backup_from_linserver/scripts


rm /mnt/backup_from_linserver/configs/nginx/conf.d/.htpasswd
rm -r /mnt/backup_from_linserver/configs/letsencrypt/accounts/


cp -rL /etc/nginx/ /mnt/backup_from_linserver/configs/
cp -rL /etc/samba/ /mnt/backup_from_linserver/configs/
cp -rL /etc/postgresql/ /mnt/backup_from_linserver/configs/
cp -rL /etc/letsencrypt/ /mnt/backup_from_linserver/configs/
cp -rL /etc/php/ /mnt/backup_from_linserver/configs/
cp -rL /var/spool/cron/ /mnt/backup_from_linserver/configs/

/sbin/mdadm -D /dev/md0 > /mnt/backup_from_linserver/RAID_INFO/mdadm.log

#find /home/linserver_backup/forti_config/cfgs/fgtcfg_* -mtime +7 -exec rm -f {} \;
