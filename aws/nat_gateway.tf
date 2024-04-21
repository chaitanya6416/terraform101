
resource "aws_nat_gateway" "nat-for-private-subnet" {
  allocation_id = aws_eip.elastic-ip-for-nat.id
  subnet_id     = aws_subnet.private-subnet-1.id

  tags = {
    Name = "nat-for-private-subnet"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  #   depends_on = [aws_internet_gateway.example]
}