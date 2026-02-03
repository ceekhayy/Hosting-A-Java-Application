####################
# PROVIDER
####################
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

####################
# DEV
####################
variable "dev_vpc_ip" {
  description = "CIDR block for the dev VPC"
  type        = string
}

variable "dev_private_subnet" {
  description = "CIDR block for the dev private subnet"
  type        = string
}

variable "dev_public_subnet" {
  description = "CIDR block for the dev public subnet"
  type        = string
}

####################
# EC2
####################
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
  default     = "dev_server"
}
