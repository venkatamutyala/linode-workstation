locals {
    authorized_keys = compact(split("\n",data.http.example.body))
    ttl = 30
}

resource "linode_domain" "yolo_venkatamutyala_com" {
    type = "master"
    domain = "yolo.venkatamutyala.com"
    soa_email = "venkata@venkatamutyala.com"
    ttl_sec = local.ttl
    retry_sec = local.ttl
    expire_sec = local.ttl
    refresh_sec = local.ttl
}

resource "linode_domain_record" "venkata-workstation" {
    domain_id = linode_domain.yolo_venkatamutyala_com.id
    record_type = "A"
    target = "${linode_instance.venkata-workstation.ip_address}"
    ttl_sec = local.ttl
}

resource "linode_instance" "venkata-workstation" {
    label = "venkata-workstation"
    image = "linode/ubuntu20.04"
    region = "us-southeast"
    type = "g7-highmem-1"
    authorized_keys = local.authorized_keys


    swap_size = 256
    private_ip = true
}


data "http" "example" {
  url = "https://github.com/venkatamutyala.keys"
    request_headers = {
    Accept = "text/plain"
  }

}