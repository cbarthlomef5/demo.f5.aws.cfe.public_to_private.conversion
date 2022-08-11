resource "aws_vpc" "servers" {
  cidr_block = var.self_vpc_cidr
  tags = {
    Name = "${var.vpc_name_tag}_vpc"
  }
}