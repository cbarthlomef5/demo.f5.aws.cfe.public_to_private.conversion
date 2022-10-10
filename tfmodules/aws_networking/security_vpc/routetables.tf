resource "aws_default_route_table" "security_vpc_default_rt" {
  default_route_table_id = aws_vpc.security.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.security_vpc_igw.id
  }

  route {
    cidr_block = "10.0.0.0/8"
    transit_gateway_id = var.demo_env_tgw_id
  }

  tags = {
    Name = "${var.vpc_name_tag}_vpc-default-rt"
    f5_cloud_failover_label = var.cfe_failover_tag
  }
}

resource "aws_route_table" "internal_subnets_rt" {
  vpc_id = aws_vpc.security.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.security_vpc_ngw.id
  }

  route {
    cidr_block = "10.0.0.0/8"
    transit_gateway_id = var.demo_env_tgw_id
  }

  tags = {
    Name = "${var.vpc_name_tag}_vpc-internal_subnet-rt"
    f5_cloud_failover_label = var.cfe_failover_tag
  }
}

resource "aws_route_table_association" "management_a_sub_rt_assoc" {
  subnet_id = aws_subnet.management_a.id
  route_table_id = aws_route_table.internal_subnets_rt.id
}

resource "aws_route_table_association" "management_b_sub_rt_assoc" {
  subnet_id = aws_subnet.management_b.id
  route_table_id = aws_route_table.internal_subnets_rt.id
}

resource "aws_route_table_association" "internal_a_sub_rt_assoc" {
  subnet_id = aws_subnet.internal_a.id
  route_table_id = aws_route_table.internal_subnets_rt.id
}

resource "aws_route_table_association" "internal_b_sub_rt_assoc" {
  subnet_id = aws_subnet.internal_b.id
  route_table_id = aws_route_table.internal_subnets_rt.id
}