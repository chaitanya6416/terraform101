
resource "aws_network_acl" "acl-for-public-subnet-1" {
  vpc_id     = aws_vpc.primary-vpc.id
  subnet_ids = [aws_subnet.public-subnet-1.id]
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

#   ingress {
#     protocol   = "-1"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 80
#     to_port    = 80
#   }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

}

resource "aws_network_acl" "acl-for-private-subnet-1" {
  vpc_id     = aws_vpc.primary-vpc.id
  subnet_ids = [aws_subnet.private-subnet-1.id]
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.primary-vpc.cidr_block
    from_port  = 22 #ssh
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = aws_vpc.primary-vpc.cidr_block
    from_port  = 443 # allow http traffic
    to_port    = 443
  }
}