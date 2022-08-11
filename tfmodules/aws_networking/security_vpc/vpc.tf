resource "aws_vpc" "security" {
  cidr_block = var.self_vpc_cidr
  tags = {
    Name = "${var.vpc_name_tag}-vpc"
  }
}