resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.primary-vpc.id
  cidr_block        = "17.5.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.primary-vpc.id
  cidr_block        = "17.5.3.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "private-subnet-1"
  }
}