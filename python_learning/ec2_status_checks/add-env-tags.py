import boto3

ec2_client_ohio = boto3.client('ec2', region_name="us-east-2")
ec2_resource_ohio = boto3.resource('ec2')

reservations_ohio = ec2_client_ohio.describe_instances()['Reservations']
instance_ids_ohio = []

for res in reservations_ohio:
    instances = res['Instances'][0]['InstanceId']
    instance_ids_ohio.append(instances)

response = ec2_resource_ohio.create_tags(
    Resources=instance_ids_ohio,
    Tags=[
        {
            'Key': 'Python-env',
            'Value': 'dev'
        },
    ]
)

