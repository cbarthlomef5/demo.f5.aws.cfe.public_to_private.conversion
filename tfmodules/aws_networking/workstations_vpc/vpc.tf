resource "aws_vpc" "workstations" {
  cidr_block = var.self_vpc_cidr
  tags = {
    Name = "${var.vpc_name_tag}_vpc"
  }
}