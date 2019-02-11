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
echo -e "[Service]\nExecStart=\nExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375" > /etc/systemd/system/docker.service.d/override.conf

systemctl daemon-reload

systemctl restart docker.service

# Navigate to /lib/system/system in your terminal and open docker.service file
# vi /lib/systemd/system/docker.service
# Find the line which starts with ExecStart and adds  -H=tcp://0.0.0.0:2375 to make it look like
# ExecStart=/usr/bin/docker daemon -H=fd:// -H=tcp://0.0.0.0:2375

# For latest version of docker 18.xx
#vim /etc/default/docker