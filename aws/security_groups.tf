resource "aws_security_group" "ssh-http-sg" {
    vpc_id = aws_vpc.primary-vpc.id
    tags = {
        Name = "ssh-http-sg"
    }
}

resource "aws_vpc_security_group_ingress_rule" "ingress-rules" {
    ip_protocol = "-1"
    security_group_id = aws_security_group.ssh-http-sg.id
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "egress-rules" {
    ip_protocol = "-1"
    security_group_id = aws_security_group.ssh-http-sg.id
    cidr_ipv4 = "0.0.0.0/0"
}
