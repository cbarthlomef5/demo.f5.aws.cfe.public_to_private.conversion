# servers_vpc Module
# Local variables
variable "vpc_name_tag" {
  default = "servers"
}

variable "num_subnets" {
  default = 2
}

# Imported variables
variable "self_vpc_cidr" {
  type = string
}

variable "bastion_host_vpc_cidr" {
  type = string
}

variable "security_vpc_cidr" {
  type = string
}

variable "workstations_vpc_cidr" {
  type = string
}

variable "my_current_ip" {
  type = string
}

variable "demo_env_tgw_id" {
  type = string
}