wget https://dl.pstmn.io/download/latest/linux64 -O /tmp/postman.tar.gz
sudo tar -xzf /tmp/postman.tar.gz -C /opt
rm postman.tar.gz
sudo rm /usr/bin/postman
sudo ln -s /opt/Postman/Postman /usr/bin/postman