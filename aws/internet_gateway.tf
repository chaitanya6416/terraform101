resource "aws_internet_gateway" "igw-for-public-subnet" {
  vpc_id = aws_vpc.primary-vpc.id
  tags = {
    Name = "igw-for-public-subnet"
  }
}