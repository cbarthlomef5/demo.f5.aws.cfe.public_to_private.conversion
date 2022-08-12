resource "aws_instance" "terraform_deployment_server" {
  ami = var.amazon_ec2_ami
  instance_type = var.aws_instance_size
  subnet_id = var.sub_id
  key_name = var.aws_key_pair_name

  tags = {
    Name = var.terraform_deployment_server_tag
  }

  user_data = data.template_file.terraform_deployment_server_user_data.rendered
}