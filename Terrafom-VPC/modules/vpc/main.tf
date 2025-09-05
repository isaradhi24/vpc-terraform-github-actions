# Create VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Terraform_vpc"
  }
}

# Create 2 Subnets 
resource "aws_subnet" "subnets" {
    count = length(var.subnet_cidr)
    vpc_id     = aws_vpc.tf_vpc.id
    cidr_block = var.subnet_cidr[count.index]
    availability_zone = data.aws_availability_zones.available.names[count.index]
    map_public_ip_on_launch = true
 
 tags = {
    Name = var.subnet_names[count.index]
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "tf_vpc_Internetgateway"
  }
}

# Route Table
 resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.tf_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"  #public
    gateway_id = aws_internet_gateway.igw.id
  }

    tags = {
      "Name" = "tf_vpc_rt"
    }

}

# Route Table Association

resource "aws_route_table_association" "a" {
  count = length(var.subnet_cidr)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id
  }