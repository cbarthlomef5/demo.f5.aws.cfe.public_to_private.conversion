resource "aws_ec2_transit_gateway_vpc_attachment" "servers_vpc_tgw_attch" {
  subnet_ids = [aws_subnet.servers_vpc_sub_cidr.id]
  transit_gateway_id = var.demo_env_tgw_id
  vpc_id = aws_vpc.servers.id

  tags = {
    Name = "${var.vpc_name_tag}_vpc-tgw-attch"
  }
}