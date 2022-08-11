provider "aws" {
  default_tags {
    tags = {
      VPC = "servers"
    }
  }
}
