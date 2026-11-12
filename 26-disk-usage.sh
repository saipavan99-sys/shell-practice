#!/bin/bash

disk_usage=$(df -hT | grep -v filesystem)
usage_threshold=20

while IFS= read line
do
   usage=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   partition=$(echo $line | awk '{print $7}')
   if [ "$usage" -ge "$usage_threshold" ]; then # (-ge) greaterthan or equaltoo
       massage+="High disk usage in $partition: $usage \n" # + add with previous massage not over write; (\n) for new line
   fi
done <<< "$disk_usage"

echo -e "$massage"