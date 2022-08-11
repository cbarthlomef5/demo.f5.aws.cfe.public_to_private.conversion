resource "aws_nat_gateway" "security_vpc_ngw" {
  allocation_id = aws_eip.security_vpc_ngw_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "${var.vpc_name_tag}_vpc-external_a-ngw"
  }
}