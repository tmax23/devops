import boto3

client = boto3.client('ec2')
all_vpcs = client.describe_vpcs()
vpcs = all_vpcs["Vpcs"]

for vpc in vpcs:
    print(vpc["VpcId"])
    cidr_block_association_set= vpc["CidrBlockAssociationSet"]
    for association_set in cidr_block_association_set:
        print(association_set["CidrBlockState"])
