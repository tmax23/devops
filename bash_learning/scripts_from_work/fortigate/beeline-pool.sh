#!/bin/bash

echo "config firewall address" >> ./beeline-pool-cfg.txt
while read IP_ADDR; do
	echo "edit \"GPRS-IP-beeline-RUS-$IP_ADDR\"" >> ./beeline-pool-cfg.txt
	echo "set subnet $IP_ADDR" >> ./beeline-pool-cfg.txt
	echo "next" >> ./beeline-pool-cfg.txt
done < ./beeline-ip.txt
echo "end" >> ./beeline-pool-cfg.txt
