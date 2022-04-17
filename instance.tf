


# resource "linode_stackscript" "foo" {
#   label = "foo"
#   description = "Installs a Package"
#   script = <<EOF
# #!/bin/bash
# sudo apt-get update
# sudo apt-get -y install zsh
# sudo apt-get -y install \
#     ca-certificates \
#     curl \
#     gnupg \
#     lsb-release
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# sudo apt-get -y install docker-ce docker-ce-cli containerd.io
# chsh -s $(which zsh)
# useradd -m -s /bin/zsh venkatamutyala
# sudo groupadd docker
# sudo usermod -aG sudo venkatamutyala
# sudo usermod -aG docker venkatamutyala
# sudo touch /home/venkatamutyala/.zshrc
# sudo cp -r ~/.ssh/authorized_keys /home/venkatamutyala/
# chown -R venkatamutyala:venkatamutyala /home/venkatamutyala
# sudo su venkatamutyala
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sed -i 's/plugins=(git)/plugins=(git asdf)/' /home/venkatamutyala/.zshrc
# EOF
#   images = ["linode/ubuntu18.04", "linode/ubuntu16.04lts"]
#   rev_note = "initial version"
# }

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