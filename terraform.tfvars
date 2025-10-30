bucket_name = "cmtr-ghjc0xhd-bucket-1761828923"
region      = "us-east-1"
name_prefix = "cmtr-ghjc0xhd-01"
vpc_cidr    = "10.10.0.0/16"
public_subnets = [
  { name_suffix = "public-a", availability_zone = "us-east-1a", cidr_block = "10.10.1.0/24" },
  { name_suffix = "public-b", availability_zone = "us-east-1b", cidr_block = "10.10.3.0/24" },
  { name_suffix = "public-c", availability_zone = "us-east-1c", cidr_block = "10.10.5.0/24" }
]
