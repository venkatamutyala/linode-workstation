

resource "linode_instance" "venkata-workstation" {
    label = "venkata-workstation"
    image = "linode/ubuntu20.04"
    region = "us-southeast"
    type = "g7-highmem-1"
    authorized_keys = local.authorized_keys

    stackscript_id = linode_stackscript.bootstrap.id
    swap_size = 256
    private_ip = true
}

data "http" "example" {
  url = "https://github.com/venkatamutyala.keys"
    request_headers = {
    Accept = "text/plain"
  }

}