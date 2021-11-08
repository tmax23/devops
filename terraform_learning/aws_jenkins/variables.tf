variable "my_region" {
  default = "us-east-2"
}
variable "avail_zone" {
  default = "us-east-2a"
}
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}
variable "env_prefix" {
  default = "prod"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "public_key_name" {
  default = "server-1"
}
variable "private_key_location" {
  # default = "/home/maxim/devops/keys_for_ssh/server-1.pem" # Home
  # default = "/home/maxim/devops/keys_for_ssh/aws-server" # Work VBox
  default = "/home/linuser/.ssh/server-1.pem" # Work Linserver
}
variable "my_whitelist" {
  default = ["0.0.0.0/0"]
}
