data "template_file" "terraform_deployment_server_user_data" {
  template = file("${path.module}/scripts/bash/bootstrapTerraform.sh")
  vars = {
    knownhosts = file("./common/known_hosts")
    shared_config_files = file("~/.aws/config")
    shared_credentials_files = file("~/.aws/credentials")
  }
}