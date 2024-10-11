

resource "aws_vpc" "sonlh-vpc" {
  cidr_block = var.cidrvpc
  tags       = var.tags
}

#Create public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.sonlh-vpc.id
  count             = var.az_counts
  cidr_block        = cidrsubnet(aws_vpc.sonlh-vpc.cidr_block, 8, count.index)
  availability_zone = var.azname[count.index]
  tags = merge(var.tags, {
    Name = "${var.vpc_name}-public-subnet"
  })
}

#Create internet gateway
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.sonlh-vpc.id
  tags = merge(var.tags, {
    ext-name = "${var.vpc_name}-igw"
  })
}

#Create route
resource "aws_route" "main-route" {
  route_table_id         = aws_vpc.sonlh-vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main-igw.id
}

#Associate route with public subnet
resource "aws_route_table_association" "public-subnet-rtba" {
  count          = var.az_counts
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_vpc.sonlh-vpc.main_route_table_id
}

#Create private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.sonlh-vpc.id
  count             = var.az_counts
  cidr_block        = cidrsubnet(aws_vpc.sonlh-vpc.cidr_block, 8, count.index + var.az_counts)
  availability_zone = var.azname[count.index]
  tags = merge(var.tags, {
    Name = "${var.vpc_name}-private-subnet"
  })
}

#Create Elastic IP for NAT gateway
resource "aws_eip" "nat-gw-eip" {
  count = var.az_counts
  tags = merge(var.tags, {
    ext-name = "${var.vpc_name}-nat-gw-eip-${count.index}"
  })
}

#Create NAT gateway for private subnet
resource "aws_nat_gateway" "nat-gw" {
  count         = var.az_counts
  subnet_id     = element(aws_subnet.private.*.id, count.index)
  allocation_id = element(aws_eip.nat-gw-eip.*.id, count.index)
  tags = merge(var.tags, {
    Name = "${var.vpc_name}-nat-gw-${count.index}"
  })
}

#Create route table
resource "aws_route_table" "private_rtb" {
  count  = var.az_counts
  vpc_id = aws_vpc.sonlh-vpc.id

  # define route for private subnet
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.nat-gw.*.id, count.index)
  }

  tags = merge(var.tags, {
    ext-name = "${var.vpc_name}-private-route-table-${count.index}"
  })
}

#Asociate route table with private subnet
resource "aws_route_table_association" "private-subnet-rtba" {
  count          = var.az_counts
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private_rtb.*.id, count.index)
}
