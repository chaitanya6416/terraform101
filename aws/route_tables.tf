resource "aws_route_table" "public-subnet-route-table" {
  vpc_id = aws_vpc.primary-vpc.id

  route {
    cidr_block = "17.5.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-for-public-subnet.id
  }

  tags = {
    Name = "public-subnet-route-table"
  }

  depends_on = [aws_internet_gateway.igw-for-public-subnet]
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-subnet-route-table.id
}

resource "aws_route_table" "private-subnet-route-table" {
  vpc_id = aws_vpc.primary-vpc.id

  route {
    cidr_block = "17.5.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "private-subnet-route-table"
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-subnet-route-table.id
}