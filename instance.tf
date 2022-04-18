data "linode_images" "ubuntu" {
  filter {
    name = "label"
    values = ["packer-ubuntu20.04"]
  }
  latest = true

}

resource "linode_instance" "venkata-workstation" {
    label = "venkata-workstation"
    image = data.linode_images.ubuntu.images[0].id
    region = "us-southeast"
    type = "g6-nanode-1"
    #type = "g7-highmem-1"
    authorized_keys = local.authorized_keys

    swap_size = 256
    backups_enabled = false
}

data "http" "example" {
  url = "https://github.com/venkatamutyala.keys"
    request_headers = {
    Accept = "text/plain"
  }

}
