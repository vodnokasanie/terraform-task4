variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
}

variable "name_prefix" {
  description = "Name prefix used for all resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of objects describing public subnets. Each object must contain: name_suffix, availability_zone, cidr_block"
  type = list(object({
    name_suffix       = string
    availability_zone = string
    cidr_block        = string
  }))
}
