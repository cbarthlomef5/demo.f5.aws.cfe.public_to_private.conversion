resource "aws_ec2_transit_gateway_vpc_attachment" "security_vpc_tgw_attch" {
  subnet_ids = [aws_subnet.internal_a.id, aws_subnet.internal_b.id]
  transit_gateway_id = var.demo_env_tgw_id
  vpc_id = aws_vpc.security.id

  tags = {
    Name = "${var.vpc_name_tag}_vpc-tgw-attch"
  }
}