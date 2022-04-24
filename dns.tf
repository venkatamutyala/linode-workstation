data "linode_domain" "yolo_venkatamutyala_com" {
  domain = "yolo.venkatamutyala.com"
}

resource "linode_domain_record" "venkata-workstation" {
  domain_id   = data.linode_domain.yolo_venkatamutyala_com.id
  record_type = "A"
  target      = linode_instance.venkata-workstation.ip_address
  ttl_sec     = local.ttl
}