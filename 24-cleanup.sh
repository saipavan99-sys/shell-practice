#!/bin/bash

R="\e[31m"  #adding colours to specific words
G="\e[32m"
Y="\e[33m"
N="\e[0m" 

sourece_dir=$1
days=${2:-14} #if user not passing days,we will take it 14 days as default

usage(){
    echo -e "{R}USAGE:: $0 [SOURCE_DIR] [days(optional,default to 14 days)${N}]"
    exit 1
}

if [ -z "$source_dir" ]; then
   echo "ERROR:: Missing parameters"
   usage
fi

if [ ! -d "$source_dir" ]; then
   echo -e "${R}ERROR:: $source_dir does not exixts${N}"
fi

echo "Scanning file olderthan $days in $source_dir"
files_to_delete=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_delete" ];then
   echo "No log files found olderthan $days"
   exitt 0
fi

while IFS= read -r line 
do 
   echo "file is going to bo deleted: $line"
   rm -f $line                                # -f for force to delete
   echo "File deleted: $line"
done <<< "$files_to_delete"

# (<) for file input
# ( <<< ) for variable as input