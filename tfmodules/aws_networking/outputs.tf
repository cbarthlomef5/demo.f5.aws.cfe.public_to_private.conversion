output "bastion_vpc_subnet_id" {
  value = module.bastion_vpc_setup.subnet_id
}

output "security_vpc_mgmt_a_sub_id" {
  value = module.security_vpc_setup.security_vpc_mgmt_a_sub_id
}

output "security_vpc_mgmt_b_sub_id" {
  value = module.security_vpc_setup.security_vpc_mgmt_b_sub_id
}

output "security_vpc_external_a_sub_id" {
  value = module.security_vpc_setup.security_vpc_external_a_sub_id
}

output "security_vpc_external_b_sub_id" {
  value = module.security_vpc_setup.security_vpc_external_b_sub_id
}

output "security_vpc_internal_a_sub_id" {
  value = module.security_vpc_setup.security_vpc_internal_a_sub_id
}

output "security_vpc_internal_b_sub_id" {
  value = module.security_vpc_setup.security_vpc_internal_b_sub_id
}

output "security_vpc_id" {
  value = module.security_vpc_setup.security_vpc_id
}

output "security_vpc_cidr" {
  value = module.security_vpc_setup.security_vpc_cidr
}