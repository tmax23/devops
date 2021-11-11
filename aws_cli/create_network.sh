#!/usr/bin/env bash

aws ec2 create-security-group \
 --group-name my-sg \
 --description "My SG" \
 --vpc-id vpc-6a88e701

aws ec2 authorize-security-group-ingress \
 --group-id sg-064ec7616251dacff \
 --protocol tcp \
 --port 22 \
 --cidr 0.0.0.0/0
