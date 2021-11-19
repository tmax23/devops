import boto3
from termcolor import colored

ec2_client = boto3.client('ec2')
ec2_resource = boto3.resource('ec2')

response = ec2_client.describe_instances()

status_check = ec2_client.describe_instance_status()

for reservation in response['Reservations']:
    for instance in reservation['Instances']:
        if instance['State']['Name'] != "terminated":
            print(f"Instance {instance['InstanceId']} is {instance['State']['Name']}")

for status in status_check['InstanceStatuses']:
    ins_status = status['InstanceStatus']['Status']
    sys_status = status['SystemStatus']['Status']
    print(f"Instance {status['InstanceId']} status is {ins_status} and sustem status is {sys_status}")
