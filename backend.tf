terraform {
  required_version = "1.1.9"
  backend "remote" {
    organization = "venkata-mutyala"
    workspaces {
      name = "linode-workstation"
    }
  }
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.2"
    }
  }
}

provider "linode" {}
