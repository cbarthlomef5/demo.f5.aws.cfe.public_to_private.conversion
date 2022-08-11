resource "aws_default_security_group" "bastion_host_vpc_default_sg" {
  vpc_id = aws_vpc.bastion_host.id
  tags = {
    Name = "${var.vpc_name_tag}_vpc-default-sg"
  }

  ingress {
    description = "All inbound from SG"
    from_port = 0
    to_port = 0
    protocol = "-1"
    self = true
  }

  ingress {
    description = "All inbound from VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.self_vpc_cidr]
  }

  ingress {
    description = "All inbound from security VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.security_vpc_cidr]
  }
  
  ingress {
    description = "All inbound from servers VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.servers_vpc_cidr]
  }

  ingress {
    description = "All inbound from workstations VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.workstations_vpc_cidr]
  }

  ingress {
    description = "All inbound from My IP Static"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${var.home_ip_secret_value}/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}