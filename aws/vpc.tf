resource "aws_vpc" "primary-vpc" {
  cidr_block = "17.5.0.0/16"
  tags = {
    Name = "primary-vpc"
    env  = "dev"
  }
}