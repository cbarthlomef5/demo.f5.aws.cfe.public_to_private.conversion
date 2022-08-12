resource "random_string" "unique_id" {
  length = 16
  special = false
  upper = false
  keepers = {
    "aws_key_pair_name" = var.aws_key_pair_name
  }
}

data "http" "f5-cftv2-failover-existing-network" {
  url = "https://raw.githubusercontent.com/F5Networks/f5-aws-cloudformation-v2/main/examples/failover/failover-existing-network.yaml"
}

resource "aws_cloudformation_stack" "bigip_ha_across_az" {
  name         = "networking-stack"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM"]
  disable_rollback = "false"
  parameters = {
    uniqueString             = "f5demo"
    vpcId                    = var.security_vpc_id
    vpcCidr                  = var.security_vpc_cidr
    bigIpMgmtSubnetId01      = var.security_vpc_mgmt_a_sub_id
    bigIpMgmtSubnetId02      = var.security_vpc_mgmt_b_sub_id
    bigIpExternalSubnetId01  = var.security_vpc_external_a_sub_id
    bigIpExternalSubnetId02  = var.security_vpc_external_b_sub_id
    bigIpInternalSubnetId01  = var.security_vpc_internal_a_sub_id
    bigIpInternalSubnetId02  = var.security_vpc_internal_b_sub_id
    bigIpMgmtAddress01       = "10.10.1.11"
    bigIpMgmtAddress02       = "10.10.2.11"
    bigIpExternalSelfIp01    = "10.10.3.11"
    bigIpExternalSelfIp02    = "10.10.4.11"
    bigIpInternalSelfIp01    = "10.10.5.11"
    bigIpInternalSelfIp02    = "10.10.6.11"
    bigIpExternalVip01       = "10.10.3.110"
    bigIpExternalVip02       = "10.10.4.110"
    bigIpPeerAddr            = "10.10.1.11"
    cfeVipTag                = "10.10.3.110,10.10.4.110"
    restrictedSrcAddressMgmt = "10.0.0.0/8"
    restrictedSrcAddressApp  = "0.0.0.0/0"
    provisionPublicIpMgmt    = "false"
    provisionPublicIpVip     = "true"
    secretArn                = var.bigip_pw_arn
    sshKey                   = var.aws_key_pair_name
    cfeTag                   = "bigip_high_availability_solution"
    cfeS3Bucket              = "f5demo-${random_string.unique_id.id}-bigip-high-availability-solution"
  }

  template_body = data.http.f5-cftv2-failover-existing-network.response_body
}
