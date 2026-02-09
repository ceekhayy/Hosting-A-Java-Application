####################
# DEV VPC
####################
resource "aws_vpc" "dev_vpc" {
  cidr_block = var.dev_vpc_ip

  tags = {
    Name        = "dev_vpc"
    Environment = "dev"
  }
}

####################
# SUBNETS
####################

# Private Subnet
resource "aws_subnet" "dev_private_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.dev_private_subnet

  tags = {
    Name        = "dev_private_subnet"
    Environment = "dev"
  }
}

# Public Subnet
resource "aws_subnet" "dev_public_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = var.dev_public_subnet

  tags = {
    Name        = "dev_public_subnet"
    Environment = "dev"
  }
}

####################
# INTERNET GATEWAY
####################
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name        = "dev_igw"
    Environment = "dev"
  }
}

####################
# ROUTE TABLES
####################

# PUBLIC ROUTE TABLE
resource "aws_route_table" "dev_public_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name        = "dev_public_rt"
    Environment = "dev"
  }
}

# PRIVATE ROUTE TABLE
resource "aws_route_table" "dev_private_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name        = "dev_private_rt"
    Environment = "dev"
  }
}

####################
# ROUTE TABLE ASSOCIATIONS
####################

# Public subnet -> Public route table
resource "aws_route_table_association" "dev_public_subnet_assoc" {
  subnet_id      = aws_subnet.dev_public_subnet.id
  route_table_id = aws_route_table.dev_public_rt.id
}

# Private subnet -> Private route table
resource "aws_route_table_association" "dev_private_subnet_assoc" {
  subnet_id      = aws_subnet.dev_private_subnet.id
  route_table_id = aws_route_table.dev_private_rt.id
}
