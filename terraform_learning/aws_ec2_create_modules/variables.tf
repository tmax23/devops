variable "my_region" {}
variable "avail_zone" {}
variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "env_prefix" {}
variable "instance_type" {}
#variable "public_key_location" {}
variable "public_key_name" {}
variable "private_key_location" {}
variable "my_whitelist" {
  type = list(string)
}
variable "image_name" {}
