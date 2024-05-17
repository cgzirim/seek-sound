#!/usr/bin/env bash

# clear codedeploy-agent files for a fresh install
# sudo rm -rf /home/ubuntu/install

touch /home/ubuntu/status.txt
sudo apt-get -y update

if [ ! -f "/home/ubuntu/install" ]; then
    # install CodeDeploy agent
    sudo apt-get -y install ruby
    sudo apt-get -y install wget
    cd /home/ubuntu
    wget https://aws-codedeploy-eu-north-1.s3.amazonaws.com/latest/install
    sudo chmod +x ./install 
    sudo ./install auto
else
    echo "CodeDeploy agent already installed."
fi

# install golang
sudo apt-get -y install golang-go
echo "Installed Golang" >> /home/ubuntu/status.txt

# install nodeJS, npm, and nvm
sudo apt -y install nodejs
sudo apt -y install npm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# install MongoDB
sudo apt-get install gnupg curl
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo apt-get install -y mongod 
sudo apt-get install -y mongosh
