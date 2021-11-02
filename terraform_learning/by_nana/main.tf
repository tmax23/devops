provider "aws" {
  access_key = "AKIASLUMNSXWPRCEGDUB"
  secret_key = "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"
  region     = "us-east-2"
}

resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name    = "dev-vpc"
    vpc_env = "dev"
  }
}

resource "aws_subnet" "dev-test-subnet-2" {
  vpc_id            = aws_vpc.dev-vpc.id # get aws_vpc id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "dev-test-subnet-2"
  }
}

data "aws_vpc" "existing_vpc" {
  default = true
}

resource "aws_subnet" "dev-test-subnet-1" {
  vpc_id            = data.aws_vpc.existing_vpc.id
  cidr_block        = "172.31.48.0/20"
  availability_zone = "us-east-2a"
  tags = {
    Name = "dev-test-subnet-1-default"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.dev-vpc.id
}

output "dev-test-subnet-2-id" {
  value = aws_subnet.dev-test-subnet-2.id
}

output "dev-test-subnet-1-id" {
  value = aws_subnet.dev-test-subnet-1.id
}


# resource "aws_instance" "test" {
#   ami           = "ami-00399ec92321828f5"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "HelloWorld"
#   }
# }
