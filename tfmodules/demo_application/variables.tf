# Local variables
variable "amazon_ec2_ami" {
  default = "ami-0cea098ed2ac54925"
}

variable "terraform_deployment_server_tag" {
  default = "terraform_deployment_server"
}

variable "aws_instance_size" {
  default = "t2.micro"
}

# Imported variables
variable "aws_key_pair_name" {
  type = string
}
variable "aws_key_pair_file_priv" {
  type = string
}

variable "sub_id" {
  type = string
}