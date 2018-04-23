#/bin/sh
wget http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb -P /tmp
sudo dpkg -i /tmp/dbeaver-ce_latest_amd64.deb
sudo apt-get -f install
echo "DONE"
