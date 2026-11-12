#!/bin/bash

disk_usage=$(df -hT | grep -v filesystem)
usage_threshold=20
server_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read line
do
   usage=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   partition=$(echo $line | awk '{print $7}')
   if [ "$usage" -ge "$usage_threshold" ]; then # (-ge) greaterthan or equaltoo
       massage+="High disk usage in $partition: $usage \n" # + add with previous massage not over write; (\n) for new line
   fi
done <<< "$disk_usage"

echo -e "$massage"


sh mail.sh "DevOps Team" "$server_ip" "High Disk Usage" "$message" "saipavanbalina99@gmail.com" "WARNING: High Disk Usage Alert"