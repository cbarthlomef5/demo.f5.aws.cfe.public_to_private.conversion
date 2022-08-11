resource "aws_instance" "windows_bastion" {
  ami = var.windows_bastion_ami
  instance_type = "t2.medium"
  subnet_id = var.bastion_host_sub_cidr
  key_name = var.aws_key_pair_name

  tags = {
    Name = var.windows_host_tag
  }

  user_data = data.template_file.windows_bastion_user_data.rendered
}