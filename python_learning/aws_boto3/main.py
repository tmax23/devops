import boto3

ec2_client = boto3.client('ec2')
ec2_resource = boto3.resource('ec2')

new_vpc = ec2_resource.create_vpc(
    CidrBlock="10.0.0.0/16"
)

new_vpc.create_subnet(
    CidrBlock="10.0.1.0/24",
    TagSpecifications=[
        {
            'ResourceType': 'subnet',
            'Tags': [
                {
                    'Key': 'Name',
                    'Value': 'sn-from-py-1'
                },
            ]
        },
    ],
)

new_vpc.create_subnet(
    CidrBlock="10.0.2.0/24",
    TagSpecifications=[
        {
            'ResourceType': 'subnet',
            'Tags': [
                {
                    'Key': 'Name',
                    'Value': 'sn-from-py-2'
                },
            ]
        },
    ],
)


all_vpcs = ec2_client.describe_vpcs()
vpcs = all_vpcs["Vpcs"]

for vpc in vpcs:
    print(vpc["VpcId"])
    cidr_block_association_set = vpc["CidrBlockAssociationSet"]
    for association_set in cidr_block_association_set:
        print(association_set["CidrBlockState"])
