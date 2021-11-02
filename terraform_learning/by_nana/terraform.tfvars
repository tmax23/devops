subnet_cidr_block = "10.10.1.0/24"
cidr_blocks       = ["172.31.48.0/20", "172.31.64.0/20"]

cidr_blocks_obj = [
  { cidr_block = "172.32.0.0/16", name = "prod-vpc" },
  { cidr_block = "172.32.0.0/24", name = "prod-subnet" }
]
