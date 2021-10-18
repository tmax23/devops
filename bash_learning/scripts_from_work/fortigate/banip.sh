#!/bin/bash

rm ./scr-to-fgt.txt

echo "config firewall address" >> ./scr-to-fgt.txt
while read IP_ADDR; do
	echo "edit \"BotIP-$IP_ADDR\"" >> ./scr-to-fgt.txt
	echo "set type iprange" >> ./scr-to-fgt.txt
	echo "set start-ip $IP_ADDR" >> ./scr-to-fgt.txt
	echo "set end-ip $IP_ADDR" >> ./scr-to-fgt.txt
	echo "next" >> ./scr-to-fgt.txt
done < banip.txt
echo "end" >> ./scr-to-fgt.txt


#config firewall address
#edit "botip-IP"
#set type iprange
#set start-ip 176.212.115.238
#set end-ip 176.212.115.238
#next
#end
