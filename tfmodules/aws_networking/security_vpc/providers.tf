provider "aws" {
  default_tags {
    tags = {
      VPC = "security"
    }
  }
}
