# Local variables
variable "windows_bastion_ami" {
  default = "ami-0da2fef774e308b99"
}

variable "windows_demo_password" {
  default = "Wind0wsS3rverSecure!"
}

variable "windows_host_tag" {
  default = "windows_bastion_host"
}

# Imported variables
variable "aws_key_pair_name" {
  type = string
}
variable "aws_key_pair_file_priv" {
  type = string
}

variable "bastion_host_sub_cidr" {
  type = string
}