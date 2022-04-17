#!/bin/bash
sudo apt-get update
sudo apt-get -y install zsh
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
chsh -s $(which zsh)
useradd -m -s /bin/zsh venkatamutyala
sudo usermod -aG sudo venkatamutyala
sudo usermod -aG docker venkatamutyala
sudo touch /home/venkatamutyala/.zshrc
sudo cp -r ~/.ssh /home/venkatamutyala/
chown -R venkatamutyala:venkatamutyala /home/venkatamutyala
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

sudo -i -u venkatamutyala zsh << EOF
cd /home/venkatamutyala
git clone https://github.com/asdf-vm/asdf.git /home/venkatamutyala/.asdf
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh
sed -i 's/plugins=(git)/plugins=(git asdf)/' /home/venkatamutyala/.zshrc
git config --global user.email "venkata@venkatamutyala.com"
git config --global user.name "Venkata Mutyala"
EOF