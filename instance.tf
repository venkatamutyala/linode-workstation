


resource "linode_stackscript" "bootstrap" {
  label = "bootstrap"
  description = "Installs all core software"
  script = <<EOF
#!/bin/bash
cd
echo "curl https://raw.githubusercontent.com/venkatamutyala/linode-workstation/main/setup.sh | bash" > bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh

EOF
  images = ["linode/ubuntu20.04"]
  rev_note = "initial version"
}

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