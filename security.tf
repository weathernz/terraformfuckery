resource "aws_security_group" "ec2" {
  name        = "tutorial-ec2-sg"
  description = "Security group for tutorial EC2 instance"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "tutorial-ec2-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.ec2.id

  description = "SSH from administrator public IP"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = var.ssh_source_ipv4
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.ec2.id

  description = "Allow all outbound IPv4 traffic"
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}