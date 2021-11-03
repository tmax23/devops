provider "aws" {
  region = "us-east-2"
}

# Using environment variable TF_VAR_avail_zone
variable "avail_zone" {}

# Define subnets CIDR
# ----------------------------------------
variable "vpc_cidr_block" {
  description = "vpc cidr block"
  #default     = "10.10.1.0/24"
  type = string
}

# CIDR blocks on existing VPC
variable "subnet_cidr_blocks_list" {
  description = "subnet cidr blocks"
  type        = list(string)
}

# CIDR blocks on test VPC
variable "subnet_cidr_blocks_list_obj" {
  description = "subnet cidr blocks"
  type = list(object({
    cidr_block = string
    name       = string
  }))
}
# ----------------------------------------

data "aws_vpc" "existing_vpc" {
  default = true
}

# Create new test VPC
# ----------------------------------------
resource "aws_vpc" "my-test-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name    = "my-test-vpc"
    vpc_env = "test"
  }
}
# ----------------------------------------

resource "aws_subnet" "subnet-in-exist-vpc" {
  vpc_id            = data.aws_vpc.existing_vpc.id # get aws_vpc id
  cidr_block        = var.subnet_cidr_blocks_list[0]
  availability_zone = var.avail_zone # from env TF_VAR_avail_zone
  tags = {
    Name = "test-subnet"
  }
}

resource "aws_subnet" "test-vpc-subnet-1" {
  vpc_id            = aws_vpc.my-test-vpc.id
  cidr_block        = var.subnet_cidr_blocks_list_obj[0].cidr_block
  availability_zone = var.avail_zone
  tags = {
    Name = var.subnet_cidr_blocks_list_obj[0].name
  }
}

resource "aws_subnet" "test-vpc-subnet-2" {
  vpc_id            = aws_vpc.my-test-vpc.id
  cidr_block        = var.subnet_cidr_blocks_list_obj[1].cidr_block
  availability_zone = var.avail_zone
  tags = {
    Name = var.subnet_cidr_blocks_list_obj[1].name
  }
}

#resource "aws_instance" "test" {
#  ami           = "ami-00399ec92321828f5"
#  instance_type = "t2.micro"
#  tags = {
#    Name = "HelloWorld"
#  }
#}

output "my-test-vpc-id" {
  value = aws_vpc.my-test-vpc.id
}

output "exist-vpc-subnet-id" {
  value = aws_subnet.subnet-in-exist-vpc.id
}

output "test-vpc-subnet-1-id" {
  value = aws_subnet.test-vpc-subnet-1.id
}

output "test-vpc-subnet-2-id" {
  value = aws_subnet.test-vpc-subnet-2.id
}
