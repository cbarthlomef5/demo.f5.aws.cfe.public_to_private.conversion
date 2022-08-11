resource "aws_ec2_transit_gateway_route" "all_to_security_vpc" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = var.security_vpc_tgw_attch_id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.demo_env.propagation_default_route_table_id
}