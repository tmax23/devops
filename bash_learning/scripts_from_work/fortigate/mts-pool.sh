#!/bin/bash

echo "config firewall address" >> ./mts-pool-cfg.txt
while read IP_ADDR; do
	echo "edit \"GPRS-IP-mts-RUS-$IP_ADDR\"" >> ./mts-pool-cfg.txt
	echo "set subnet $IP_ADDR" >> ./mts-pool-cfg.txt
	echo "next" >> ./mts-pool-cfg.txt
done < ./mts-ip.txt
echo "end" >> ./mts-pool-cfg.txt
