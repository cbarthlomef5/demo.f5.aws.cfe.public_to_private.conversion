output "tgw_attch_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.security_vpc_tgw_attch.id
}

output "security_vpc_mgmt_a_sub_id" {
  value = aws_subnet.management_a.id
}

output "security_vpc_mgmt_b_sub_id" {
  value = aws_subnet.management_b.id
}

output "security_vpc_external_a_sub_id" {
  value = aws_subnet.external_a.id
}

output "security_vpc_external_b_sub_id" {
  value = aws_subnet.external_b.id
}

output "security_vpc_internal_a_sub_id" {
  value = aws_subnet.internal_a.id
}

output "security_vpc_internal_b_sub_id" {
  value = aws_subnet.internal_b.id
}

output "security_vpc_id" {
  value = aws_vpc.security.id
}

output "security_vpc_cidr" {
  value = aws_vpc.security.cidr_block
}