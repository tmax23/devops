import boto3

ec2_client = boto3.client('ec2')
volumes = ec2_client.describe_volumes(
    Filters=[
        {
            'Name': 'tag:Name',
            'Values': [
                'dev',
            ]
        },
    ]
)

for volume in volumes['Volumes']:
    volume_id = volume['VolumeId']
    snapshot = ec2_client.create_snapshot(VolumeId=volume_id)
    print(snapshot)

