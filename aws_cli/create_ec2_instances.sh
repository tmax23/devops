#!/usr/bin/env bash

aws ec2 create-key-pair \
 --key-name test-key \
 --query 'KeyMaterial' \
 --output text > test-key.pem

aws ec2 run-instances \
 --image-id ami-0f19d220602031aed \
 --count 1 \
 --instance-type t2.micro \
 --key-name test-key \
 --security-group-ids sg-064ec7616251dacff \
 --subnet-id subnet-ac63f4c7
