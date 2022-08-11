resource "aws_vpc" "bastion_host" {
  cidr_block = var.self_vpc_cidr
  tags = {
    Name = "${var.vpc_name_tag}_vpc"
  }
}