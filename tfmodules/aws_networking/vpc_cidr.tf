# Variables file for all CIDR for VPCs
variable "bastion_host_vpc_cidr" {
  default = "10.5.0.0/16"
}

variable "security_vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "servers_vpc_cidr" {
  default = "10.15.0.0/16"
}

variable "workstations_vpc_cidr" {
  default = "10.20.0.0/16"
}