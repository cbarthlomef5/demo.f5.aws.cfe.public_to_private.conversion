resource "aws_ec2_transit_gateway_vpc_attachment" "bastion_host_vpc_tgw_attch" {
  subnet_ids = [aws_subnet.bastion_host_vpc.id]
  transit_gateway_id = var.demo_env_tgw_id
  vpc_id = aws_vpc.bastion_host.id

  tags = {
    Name = "${var.vpc_name_tag}_vpc-tgw-attch"
  }
}