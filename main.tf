# resource "linode_instance" "web" {
#     label = "simple_instance"
#     image = "linode/ubuntu20.04"
#     region = "us-southeast"
#     type = "g7-highmem-1"
#     authorized_keys = ["ssh-rsa AAAA...Gw== user@example.local"]
#     root_pass = "terr4form-test"

#     group = "foo"
#     tags = [ "foo" ]
#     swap_size = 256
#     private_ip = true
# }


data "http" "example" {
  url = "https://github.com/venkatamutyala.keys"
}

output "keys" {
    value = data.http.example
}