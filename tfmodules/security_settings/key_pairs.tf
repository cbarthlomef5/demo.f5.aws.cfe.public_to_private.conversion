resource "aws_key_pair" "demo" {
  key_name   = var.aws_key_pair_name
  public_key = file(var.aws_key_pair_file_pub)
}