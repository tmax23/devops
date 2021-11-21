import boto3
import schedule

ec2_client = boto3.client('ec2')
ec2_resource = boto3.resource('ec2')

response = ec2_client.describe_instances()

status_check = ec2_client.describe_instance_status(
        IncludeAllInstances=True
)


def check_instance_status():
    for status in status_check['InstanceStatuses']:
        ins_status = status['InstanceStatus']['Status']
        sys_status = status['SystemStatus']['Status']
        inst_status = status['InstanceState']['Name']
        if inst_status != "terminated":
            print(f"Instance {status['InstanceId']} is {inst_status}, status is {ins_status}, system status is {sys_status}")
    print("##############################################\n")


schedule.every(5).seconds.do(check_instance_status)

while True:
    schedule.run_pending()
