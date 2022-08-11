resource "aws_default_route_table" "bastion_host_vpc_default_rt" {
  default_route_table_id = aws_vpc.bastion_host.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bastion_host_vpc_igw.id
  }

  route {
    cidr_block = "10.0.0.0/8"
    transit_gateway_id = var.demo_env_tgw_id
  }

  tags = {
    Name = "${var.vpc_name_tag}_vpc-default-rt"
  }
}