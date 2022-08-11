resource "aws_eip" "security_vpc_ngw_eip" {
  vpc      = true
  tags = {
    "Name" = "${var.vpc_name_tag}_vpc-ngw-eip"
  }
}