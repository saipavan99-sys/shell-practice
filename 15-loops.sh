#!/bin/bash

log_folder="/var/log/shell-practice"
log_file="${log_folder}/${0}.sh"

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
  echo "please run this script with sudo access"
  exit 1
fi

mkdir -p $log_folder

echo "script started execution at: $(date +"%F %T")" &>> $log_file

#function

validate(){
     if [ $1 -ne 0 ]; then
        echo "$2 is FAILED...." | tee -a $log_file
        exit 1
    else 
        echo "$2 is SUCCESS...." | tee -a $log_file
    fi
}

#loop

for package in $@
do
   echo "Going to install: ${package}"
done