resource "aws_subnet" "servers_vpc_sub_cidr" {
  vpc_id            = aws_vpc.servers.id
  availability_zone = "us-west-2a"
  cidr_block = cidrsubnet(var.self_vpc_cidr, 8, 10)
  tags = {
    Name = "${var.vpc_name_tag}_vpc-sub"
  }
}