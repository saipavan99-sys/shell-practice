#!/bin/bash

R="\e[31m"  #adding colours to specific words
G="\e[32m"
Y="\e[33m"
N="\e[0m" 

source_dir=$1
dest_dir=$2
days=${3:-14} #if user not passing days,we will take it 14 days as default

usage(){
    echo -e "${R}USAGE:: $0 [SOURCE_DIR] [DEST_DIR] [days(optional,default to 14 days)${N}]"
    exit 1
}

if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then # (-z) check empty ; (||) is or  
   echo "Either source or destination directory is missing" 
   usage
fi

if [ ! -d $source_dir ]; then  # (-d) is check dir exists or not ;(!) is into 
    echo "Source directory: $source_dir is does not exist " #false X false = true
    exit 1
fi


if [ ! -d $dest_dir ]; then  # (-d) is check dir exists or not ;(!) is into 
    echo "Destination directory: $dest_dir is does not exist " #false X false = true
    exit 1
fi


echo "Scanning file olderthan $days in $source_dir"
files_to_archieve=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_archieve" ];then
   echo "No log files found olderthan $days"
   exitt 0
fi

timestamp=$(date +%Y-%m-%d-%H-%M-%S)

file_name="$dest_dir/logs-$timestamp.tar.gz"

tar -czf $file_name $files_to_archive

if [ $? -ne 0 ]: then
  echo "log archive is faild"
  exit 1
else
  echo "Log files are achived: $file_name"
  while IFS= read -r line 
  do 
      echo "file is going to bo deleted: $line"
      rm -f $line                                # -f for force to delete
      echo "File deleted: $line"
  done <<< "$files_to_archieve"
fi

