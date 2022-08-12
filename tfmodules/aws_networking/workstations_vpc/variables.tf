# workstations_vpc Module
# Local variables
variable "vpc_name_tag" {
  default = "workstations"
}

# Imported variables
variable "self_vpc_cidr" {
  type = string
}

variable "bastion_host_vpc_cidr" {
  type = string
}

variable "servers_vpc_cidr" {
  type = string
}

variable "security_vpc_cidr" {
  type = string
}

variable "my_current_ip" {
  type = string
}

variable "demo_env_tgw_id" {
  type = string
}