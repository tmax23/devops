vpc_cidr_block = "10.10.0.0/16"

subnet_cidr_blocks_list = ["172.31.48.0/20", "172.31.64.0/20"]

subnet_cidr_blocks_list_obj = [
  { cidr_block = "10.10.1.0/24", name = "test-subnet-1" },
  { cidr_block = "10.10.2.0/24", name = "test-subnet-2" }
]
