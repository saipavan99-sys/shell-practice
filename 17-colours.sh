#!/bin/bash

log_folder="/var/log/shell-practice"
log_file="${log_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"   

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
        echo -e "$2 is ${R}FAILED....${N}" | tee -a $log_file            #to print status on screen use tee cmd
        exit 1                                                        #exit status
    else 
        echo -e "$2 is ${G}SUCCESS....${N}" | tee -a $log_file
    fi
}

#loop

for package in $@
do
   dnf list installed $package &>> $log_file                         # To List installed packages
   if [ $? -ne 0 ]; then
     echo "Going to install: ${package}"                             # (package) is a variable here
     dnf install $package -y &>> $log_file                           # installing packages and redirect logs to logfile
     validate $? "installing ${package}"
  else
     echo -e "${package} is already installed...${Y}SKIPING${N}"
   fi
done 

echo "script sexecution complete at: $(date +"%F %T")" &>> $log_file