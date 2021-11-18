import boto3

ec2_client = boto3.client('ec2')
ec2_resource = boto3.resource('ec2')

vpc = ec2_resource.create_vpc()

all_vpcs = client.describe_vpcs()
vpcs = all_vpcs["Vpcs"]

for vpc in vpcs:
    print(vpc["VpcId"])
    cidr_block_association_set= vpc["CidrBlockAssociationSet"]
    for association_set in cidr_block_association_set:
        print(association_set["CidrBlockState"])

print(type(vpcs))
print(type(vpc))