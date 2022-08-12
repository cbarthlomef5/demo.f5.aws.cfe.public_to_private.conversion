variable "aws_key_pair_name" {
  default = "demo"
}

variable "aws_key_pair_file_pub" {
  default = "~/.ssh/demo_id_rsa.pub"
}

variable "aws_key_pair_file_priv" {
  default = "~/.ssh/demo_id_rsa"
}

variable "bigip_pw_secret_id" {
  default = "mySecretId"
}

variable "bigip_pw_secret_pw" {
  default = "admin.F5demo.com"
}

variable "cfe_failover_tag" {
  default = "bigip_high_availability_solution"
}