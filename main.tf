locals {
    authorized_keys = compact(split("\n",data.http.example.body))
}

resource "linode_instance" "web" {
    label = "venkata-workstation"
    image = "linode/ubuntu20.04"
    region = "us-southeast"
    type = "g7-highmem-1"
    authorized_keys = local.authorized_keys


    group = "foo"
    tags = [ "foo" ]
    swap_size = 256
    private_ip = true
}


data "http" "example" {
  url = "https://github.com/venkatamutyala.keys"
    request_headers = {
    Accept = "text/plain"
  }

}