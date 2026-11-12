#/bin/bash

aws ec2 run-instances \
    --image-id ami-0055977a6e828a4f4 \
    --instance-type t3.micro \
    --security-group-ids sg-04ec64c03973dff6f \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=shell}]'