resource "aws_default_route_table" "servers_vpc_default_rt" {
  default_route_table_id = aws_vpc.servers.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    transit_gateway_id = var.demo_env_tgw_id
  }

  tags = {
    Name = "${var.vpc_name_tag}_vpc-default-rt"
  }
}