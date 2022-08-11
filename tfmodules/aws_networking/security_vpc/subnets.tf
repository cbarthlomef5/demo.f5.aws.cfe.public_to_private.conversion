locals {
  management_sub_a_cidr = cidrsubnet(var.self_vpc_cidr, 8, 1)
  management_sub_b_cidr = cidrsubnet(var.self_vpc_cidr, 8, 2)
  external_sub_a_cidr = cidrsubnet(var.self_vpc_cidr, 8, 3)
  external_sub_b_cidr = cidrsubnet(var.self_vpc_cidr, 8, 4)
  internal_sub_a_cidr = cidrsubnet(var.self_vpc_cidr, 8, 5)
  internal_sub_b_cidr = cidrsubnet(var.self_vpc_cidr, 8, 6)
  public_sub_cidr = cidrsubnet(var.self_vpc_cidr, 8, 10)
}