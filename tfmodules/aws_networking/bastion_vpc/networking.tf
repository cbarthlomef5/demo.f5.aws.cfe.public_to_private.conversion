resource "aws_subnet" "bastion_host_vpc" {
  vpc_id            = aws_vpc.bastion_host.id
  availability_zone = "us-west-2a"
  cidr_block = cidrsubnet(var.self_vpc_cidr, 8, 10)
  tags = {
    Name = "${var.vpc_name_tag}_vpc-sub"
  }
}

resource "aws_internet_gateway" "bastion_host_vpc_igw" {
  vpc_id = aws_vpc.bastion_host.id
  tags = {
    Name = "${var.vpc_name_tag}_vpc-igw"
  }
}