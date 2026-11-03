#/bin/bash

aws ec2 run-instances \
    --image-id ami-0055977a6e828a4f4 \
    --instance-type t3.micro \
    --security-group-ids sg-020c9a04adb81cfcd \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=my-roboshop-mongodb}]'