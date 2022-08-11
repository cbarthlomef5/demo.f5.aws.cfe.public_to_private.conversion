variable "aws_key_pair_name" {
  default = "demo"
}

variable "aws_key_pair_file_pub" {
  default = "~/.ssh/demo_id_rsa.pub"
}

variable "aws_key_pair_file_priv" {
  default = "~/.ssh/demo_id_rsa"
}

variable "home_ip_secret_value" {
  default = "75.174.29.233"
}

variable "bigip_pw_secret_id" {
  default = "mySecretId"
}

variable "bigip_pw_secret_pw" {
  default = "admin.F5demo.com"
}