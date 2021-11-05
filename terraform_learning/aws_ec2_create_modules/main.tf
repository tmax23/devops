provider "aws" {
  region = var.my_region
}

resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

module "myapp-subnet" {
  source = "./modules/subnet"

  avail_zone             = var.avail_zone
  subnet_cidr_block      = var.subnet_cidr_block
  env_prefix             = var.env_prefix
  vpc_id                 = aws_vpc.myapp-vpc.id
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
}

module "myapp-webserver" {
  source = "./modules/webserver"

  vpc_id          = aws_vpc.myapp-vpc.id
  my_whitelist    = var.my_whitelist
  env_prefix      = var.env_prefix
  image_name      = var.image_name
  instance_type   = var.instance_type
  subnet_id       = module.myapp-subnet.subnet.id
  avail_zone      = var.avail_zone
  public_key_name = var.public_key_name
}
