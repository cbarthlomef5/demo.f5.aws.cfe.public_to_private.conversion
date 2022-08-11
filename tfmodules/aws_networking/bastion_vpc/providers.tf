provider "aws" {
  default_tags {
    tags = {
      VPC = "bastion_host"
    }
  }
}
