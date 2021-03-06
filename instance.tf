data "linode_images" "ubuntu" {
  filter {
    name   = "label"
    values = ["packer-ubuntu20.04"]
  }
  latest = true

}

resource "linode_instance" "venkata-workstation" {
  label  = "venkata-workstation"
  image  = data.linode_images.ubuntu.images[0].id
  region = "us-southeast"
  #type = "g6-nanode-1"
  type            = "g7-highmem-1"
  authorized_keys = local.authorized_keys
  booted = true

  swap_size       = 256
  backups_enabled = true
  lifecycle {
    ignore_changes = [
      authorized_keys,
      image
    ]
    
    prevent_destroy = true

  }
}

data "http" "example" {
  url = "https://github.com/venkatamutyala.keys"
  request_headers = {
    Accept = "text/plain"
  }

}
