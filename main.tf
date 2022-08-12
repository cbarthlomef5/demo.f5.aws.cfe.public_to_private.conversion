module "aws_infrastructure_setup" {
  source = "./tfmodules/aws_networking"

  home_ip_secret_value = var.home_ip_secret_value
}

module "security_settings_setup" {
  source = "./tfmodules/security_settings"

  aws_key_pair_name = var.aws_key_pair_name
  aws_key_pair_file_pub = var.aws_key_pair_file_pub
  windows_host_tag = module.bastion_hosts_deploy.windows_host_tag
  bigip_pw_secret_id = var.bigip_pw_secret_id
  bigip_pw_secret_pw = var.bigip_pw_secret_pw
}

module "bastion_hosts_deploy" {
  source = "./tfmodules/bastion_hosts"

  aws_key_pair_name = var.aws_key_pair_name
  aws_key_pair_file_priv = var.aws_key_pair_file_priv
  bastion_host_sub_cidr = module.aws_infrastructure_setup.bastion_vpc_subnet_id
}

module "bigip_cft_deploy" {
  source = "./tfmodules/bigip_cft_deploy"

  aws_key_pair_name = var.aws_key_pair_name
  bigip_pw_arn = module.security_settings_setup.bigip_pw_arn
  security_vpc_id = module.aws_infrastructure_setup.security_vpc_id
  # subnet information
  security_vpc_cidr = module.aws_infrastructure_setup.security_vpc_cidr
  security_vpc_mgmt_a_sub_id = module.aws_infrastructure_setup.security_vpc_mgmt_a_sub_id
  security_vpc_mgmt_b_sub_id = module.aws_infrastructure_setup.security_vpc_mgmt_b_sub_id
  security_vpc_external_a_sub_id = module.aws_infrastructure_setup.security_vpc_external_a_sub_id
  security_vpc_external_b_sub_id = module.aws_infrastructure_setup.security_vpc_external_b_sub_id
  security_vpc_internal_a_sub_id = module.aws_infrastructure_setup.security_vpc_internal_a_sub_id
  security_vpc_internal_b_sub_id = module.aws_infrastructure_setup.security_vpc_internal_b_sub_id
}

module "demo_application_deploy" {
  source = "./tfmodules/demo_application"

  aws_key_pair_name = var.aws_key_pair_name
  aws_key_pair_file_priv = var.aws_key_pair_file_priv
  sub_id = module.aws_infrastructure_setup.security_vpc_internal_b_sub_id

  depends_on = [
    module.bigip_cft_deploy
  ]
}