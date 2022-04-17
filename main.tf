terraform {
  required_version = "1.1.8"
  backend "remote" {
    organization = "venkata-mutyala"
    workspaces {
      name = "linode-workstation"
    }
  }
  required_providers {
    linode = "1.27.0"
  }
}

provider "linode" {}