provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-2"
}

resource "aws_instance" "ubuntu_from_terraform" {
  count         = 2
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
}
