provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-2"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
  # default     = "10.10.1.0/24"
  type = string
}

variable "cidr_blocks" {
  description = "cidr blocks"
  type        = list(string)
}

variable "cidr_blocks_obj" {
  description = "cidr blocks object"
  type = list(object({
    cidr_block = string
    name       = string
  }))
}

resource "aws_vpc" "prod-vpc" {
  cidr_block = var.cidr_blocks_obj[0].cidr_block
  tags = {
    Name    = var.cidr_blocks_obj[0].name
    vpc_env = "dev"
  }
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
  cidr_block        = var.subnet_cidr_block
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
  cidr_block        = var.cidr_blocks[0]
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

resource "aws_instance" "test" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
