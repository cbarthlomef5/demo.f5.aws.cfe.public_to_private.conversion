module "bastion_vpc_setup" {
  source = "./bastion_vpc"

  self_vpc_cidr = var.bastion_host_vpc_cidr
  servers_vpc_cidr = var.servers_vpc_cidr
  security_vpc_cidr = var.security_vpc_cidr
  workstations_vpc_cidr = var.workstations_vpc_cidr
  my_current_ip = local.my_current_ip
  demo_env_tgw_id = module.tgw_setup.demo_env_tgw_id
}

module "servers_vpc_setup" {
  source = "./servers_vpc"

  bastion_host_vpc_cidr = var.bastion_host_vpc_cidr
  self_vpc_cidr = var.servers_vpc_cidr
  security_vpc_cidr = var.security_vpc_cidr
  workstations_vpc_cidr = var.workstations_vpc_cidr
  my_current_ip = local.my_current_ip
  demo_env_tgw_id = module.tgw_setup.demo_env_tgw_id
}

module "security_vpc_setup" {
  source = "./security_vpc"

  bastion_host_vpc_cidr = var.bastion_host_vpc_cidr
  self_vpc_cidr = var.security_vpc_cidr
  servers_vpc_cidr = var.servers_vpc_cidr
  workstations_vpc_cidr = var.workstations_vpc_cidr
  my_current_ip = local.my_current_ip
  demo_env_tgw_id = module.tgw_setup.demo_env_tgw_id
  cfe_failover_tag = var.cfe_failover_tag
}

module "workstations_vpc_setup" {
  source = "./workstations_vpc"

  bastion_host_vpc_cidr = var.bastion_host_vpc_cidr
  self_vpc_cidr = var.workstations_vpc_cidr
  servers_vpc_cidr = var.servers_vpc_cidr
  security_vpc_cidr = var.security_vpc_cidr
  my_current_ip = local.my_current_ip
  demo_env_tgw_id = module.tgw_setup.demo_env_tgw_id
}

module "tgw_setup" {
  source = "./tgw"

  security_vpc_tgw_attch_id = module.security_vpc_setup.tgw_attch_id
}