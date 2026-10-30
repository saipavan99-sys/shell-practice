#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
  echo "please run this script with sudo access"
  exit 1
fi

echo "processing...."

# nginx installation

dnf install nginx -y

if [ $? -ne 0 ]; then
  echo "Nginx installation is Faild"
  exit 1
else 
  echo "Nginx installation is sucess"
fi

# my-sql installation

dnf install mysql -y

if [ $? -ne 0 ]; then
  echo "my-sql installation is faild"
  exit 1
else 
  echo "my-sql installation is sucess"
fi

echo "still proceeded...."
