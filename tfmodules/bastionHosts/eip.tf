resource "aws_eip" "windows_bastion_host" {
  instance = aws_instance.windows_bastion.id
  vpc = true
  tags = {
    Name = "${var.windows_host_tag}-eip"
  }
}