locals {
    authorized_keys = compact(split("\n",data.http.example.body))
}

resource "linode_domain" "yolo_venkatamutyala_com" {
    type = "master"
    domain = "yolo.venkatamutyala.com"
    soa_email = "venkata@venkatamutyala.com"
}

resource "linode_instance" "venkata-workstation" {
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