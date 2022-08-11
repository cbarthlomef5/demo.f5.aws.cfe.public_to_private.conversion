data "template_file" "windows_bastion_user_data" {
  template = file("${path.module}/scripts/ps/windowsBastion.ps1")
  vars = {
    "userpassword" = var.windows_demo_password
    "certificate" = file("${var.aws_key_pair_file_priv}")
    "logonScriptCMD" = file("${path.module}/scripts/ps/logon.cmd")
    "knownhosts" = file("${path.module}/known_hosts")
    shared_config_files = file("~/.aws/config")
    shared_credentials_files = file("~/.aws/credentials")
  }
}