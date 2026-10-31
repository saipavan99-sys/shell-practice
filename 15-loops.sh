#!/bin/bash

log_folder="/var/log/shell-practice"
log_file="${log_folder}/${0}.log"

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
  echo "please run this script with sudo access"
  exit 1
fi

mkdir -p $log_folder                                                  #creating log_folder if not

echo "script started execution at: $(date +"%F %T")" &>> $log_file    #redirection to logs into file

#function

validate(){
     if [ $1 -ne 0 ]; then
        echo "$2 is FAILED...." | tee -a $log_file                    #to print status on screen use tee cmd
        exit 1                                                        #exit status
    else 
        echo "$2 is SUCCESS...." | tee -a $log_file
    fi
}

#loop

for package in $@
do
   echo "Going to install: ${package}"                             # (package) is a variable here
   dnf install ${package} -y &>> $log_file                         # installing packages and redirect logs to logfile
   validate $? "installing ${package}"
done 

echo "script sexecution complete at: $(date +"%F %T")" &>> $log_file