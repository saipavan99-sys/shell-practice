#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
  echo "please run this script with sudo access"
  exit 1
fi

echo "processing...."

#function

validate(){
     if [ $1 -ne 0 ]; then
        echo "$2 is FAILD...."
        exit 1
    else 
        echo "$2 is SUCESS...."
    fi
}

# nginx installation

dnf install nginx -y
validate $? "Nginx installation"

# my-sql installation

dnf install mysql -y
validate $? "my-sql installation"

echo "still proceeded...."/
