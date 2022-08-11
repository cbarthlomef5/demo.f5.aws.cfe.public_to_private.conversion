resource "aws_internet_gateway" "security_vpc_igw" {
  vpc_id = aws_vpc.security.id
  tags = {
    Name = "${var.vpc_name_tag}_vpc-igw"
  }
}

resource "aws_subnet" "management_a" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = local.management_sub_a_cidr
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.vpc_name_tag}_vpc-management_a-sub"
  }
}

resource "aws_subnet" "management_b" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = local.management_sub_b_cidr
  availability_zone = "us-west-2b"
  tags = {
    Name = "${var.vpc_name_tag}_vpc-management_b-sub"
  }
}

resource "aws_subnet" "external_a" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = local.external_sub_a_cidr
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.vpc_name_tag}_vpc-external_a-sub"
  }
}

resource "aws_subnet" "external_b" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = local.external_sub_b_cidr
  availability_zone = "us-west-2b"
  tags = {
    Name = "${var.vpc_name_tag}_vpc-external_b-sub"
  }
}

resource "aws_subnet" "internal_a" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = local.internal_sub_a_cidr
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.vpc_name_tag}_vpc-internal_a-sub"
  }
}

resource "aws_subnet" "internal_b" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = local.internal_sub_b_cidr
  availability_zone = "us-west-2b"
  tags = {
    Name = "${var.vpc_name_tag}_vpc-internal_b-sub"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.security.id
  cidr_block        = local.public_sub_cidr
  availability_zone = "us-west-2a"
  tags = {
    Name = "${var.vpc_name_tag}_vpc-public-sub"
  }
}