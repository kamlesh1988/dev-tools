#/bin/sh
sudo apt-get update 

# Prerequisit dependencies
# sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Install docker from apt
sudo apt install docker.io

# To run docker commands without sudo add user to docker group
sudo usermod -aG docker $USER

# No need to re-login to affect above usermod command
newgrp docker

# Give permission to docker.sock file 
sudo setfacl -m $USER:$USER:rw /var/run/docker.sock

# To enable docker as a service
#sudo systemctl start docker
#sudo systemctl enable docker

# enable the remote API for dockerd
sudo su
sudo mkdir -p /etc/systemd/system/docker.service.d/

# /etc/systemd/system/docker.service.d/override.conf
sudo echo -e "[Service]\nExecStart=\nExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2377" > /etc/systemd/system/docker.service.d/override.conf

sudo systemctl daemon-reload

sudo systemctl restart docker.service

